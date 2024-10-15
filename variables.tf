variable "cloud_name" {
  type        = string
  nullable    = false
  default     = "zscaler.net"
  description = <<-EOT
    Name of the Zscaler cloud for which to return Zscaler Hub IP addresses.

    Must be one of the ZIA clouds (e.g. "zscaler.net").
    May not be a ZPA cloud (e.g. "private.zscaler.com") or ZDX cloud (e.g. "zdxcloud.net").
    Defaults to "zscaler.net".

    See Also:
      https://config.zscaler.com/
    EOT

  validation {
    condition = contains(
      [
        "zscaler.net",
        "zscalerone.net",
        "zscalertwo.net",
        "zscalerthree.net",
        "zscloud.net",
        "zscalerbeta.net",
        "zscalergov.net",
        "zscalerten.net",
      ],
      var.cloud_name
    )
    error_message = "The cloud name must be one of the ZIA clouds. See: https://config.zscaler.com/"
  }
}

variable "type" {
  type        = string
  nullable    = false
  default     = "required"
  description = <<-EOT
    The disjoint subset of IP addresses to return.

    Must be either "required" or "recommended".
    Defaults to "required".

    Note:
      Zscaler Hub IP address ranges run vital Zscaler cloud services, platform management, and monitoring.
      Access to & from these IP addresses is essential for seamless service delivery and resilient and scalable support.

    See Also:
      https://config.zscaler.com/zscaler.net/hubs
    EOT

  validation {
    condition     = contains(["required", "recommended"], var.type)
    error_message = "The type must be either \"required\" or \"recommended\"."
  }
}

variable "as_azurerm_storage_account_ip_rules" {
  type        = bool
  nullable    = false
  default     = false
  description = <<-EOT
    Whether to format the output hub_prefixes as Azure Storage Account IP rules.

    If true, then:
    - Excludes IPv6 addresses. (i.e. includes only IPv4 addresses)
    - Replaces /32 IPv4 address CIDRs with one non-CIDR address. (i.e. without the trailing "/32")
    - Replaces /31 IPv4 address CIDRs with two non-CIDR addresses. (i.e. without the trailing "/31")
    Defaults to false.

    See Also:
      https://learn.microsoft.com/azure/storage/common/storage-network-security#restrictions-for-ip-network-rules
    EOT
}
