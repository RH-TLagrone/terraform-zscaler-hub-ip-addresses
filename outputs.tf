output "cloud_name" {
  value       = var.cloud_name
  description = <<-EOT
    Name of the Zscaler cloud to which the IP addresses belong.

    Equal to `var.cloud_name`.

    See Also:
      https://config.zscaler.com/
    EOT
}

output "type" {
  value       = var.type
  description = <<-EOT
    Type of the disjoint subset of IP addresses.

    Equal to `var.type`.

    Note:
      Zscaler Hub IP address ranges run vital Zscaler cloud services, platform management, and monitoring.
      Access to & from these IP addresses is essential for seamless service delivery and resilient and scalable support.

    See Also:
      https://config.zscaler.com/zscaler.net/hubs
    EOT
}

output "hub_prefixes" {
  value       = local.hub_prefixes
  description = "List of IP ranges in CIDR format. Both IPv4 and IPv6 addresses are included."
}

output "IPv4_hub_prefixes" {
  value       = local.IPv4_hub_prefixes
  description = "List of IP ranges in CIDR format. Only IPv4 addresses are included."
}

output "IPv6_hub_prefixes" {
  value       = local.IPv6_hub_prefixes
  description = "List of IP ranges in CIDR format. Only IPv6 addresses are included."
}
