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
  hub_prefixes      = jsondecode(data.http.cidr.response_body).hubPrefixes
  IPv4_hub_prefixes = [for cidr in local.hub_prefixes : cidr if !strcontains(cidr, ":")]
  IPv6_hub_prefixes = [for cidr in local.hub_prefixes : cidr if strcontains(cidr, ":")]
}
