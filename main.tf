terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = ">= 3.4.0"
    }
  }
}

data "http" "cidr" {
  url = "https://config.zscaler.com/api/${var.cloud_name}/hubs/cidr/json/${var.type}"

  request_headers = {
    Accept = "application/json"
  }

  retry {
    attempts = 2
  }

  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "Status code invalid: ${self.status_code}"
    }
  }
}

locals {
  hub_prefixes = jsondecode(data.http.cidr.response_body).hubPrefixes

  hub_prefixes_as_azurerm_storage_account_ip_rules = flatten([
    for ip_rule in local.hub_prefixes : (
      endswith(ip_rule, "/32") ? [substr(ip_rule, 0, length(ip_rule) - 3)] :  # Refactor */32 CIDRs to 1 individual IP address.
      endswith(ip_rule, "/31") ? [  # Refactor */31 CIDRs to 2 individual IP addresses.
        join("", [substr(ip_rule, 0, length(ip_rule) - 4), "0"]),
        join("", [substr(ip_rule, 0, length(ip_rule) - 4), "1"]),
      ] :
      [ip_rule]
      # All conditional branches must return the same data type.
      # Thus, we return list(string) on every branch even if it is a singleton.
    )
    if !strcontains(cidr, ":")  # Include only IPv4. (i.e. exclude all IPv6)
  ])
}
