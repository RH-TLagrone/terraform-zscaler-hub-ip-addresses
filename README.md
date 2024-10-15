# Zscaler Hub IP Addresses

Terraform data-only module for [Zscaler Hub IP addresses](https://config.zscaler.com/zscloud.net/hubs)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | >= 3.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [http_http.cidr](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_as_azurerm_storage_account_ip_rules"></a> [as\_azurerm\_storage\_account\_ip\_rules](#input\_as\_azurerm\_storage\_account\_ip\_rules) | Whether to format the output hub\_prefixes as Azure Storage Account IP rules.<br><br>If true, then:<br>- Excludes IPv6 addresses. (i.e. includes only IPv4 addresses)<br>- Replaces /32 IPv4 address CIDRs with one non-CIDR address. (i.e. without the trailing "/32")<br>- Replaces /31 IPv4 address CIDRs with two non-CIDR addresses. (i.e. without the trailing "/31")<br>Defaults to false.<br><br>See Also:<br>  https://learn.microsoft.com/azure/storage/common/storage-network-security#restrictions-for-ip-network-rules | `bool` | `false` | no |
| <a name="input_cloud_name"></a> [cloud\_name](#input\_cloud\_name) | Name of the Zscaler cloud for which to return Zscaler Hub IP addresses.<br><br>Must be one of the ZIA clouds (e.g. "zscaler.net").<br>May not be a ZPA cloud (e.g. "private.zscaler.com") or ZDX cloud (e.g. "zdxcloud.net").<br>Defaults to "zscaler.net".<br><br>See Also:<br>  https://config.zscaler.com/ | `string` | `"zscaler.net"` | no |
| <a name="input_type"></a> [type](#input\_type) | The disjoint subset of IP addresses to return.<br><br>Must be either "required" or "recommended".<br>Defaults to "required".<br><br>Note:<br>  Zscaler Hub IP address ranges run vital Zscaler cloud services, platform management, and monitoring.<br>  Access to & from these IP addresses is essential for seamless service delivery and resilient and scalable support.<br><br>See Also:<br>  https://config.zscaler.com/zscaler.net/hubs | `string` | `"required"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hub_prefixes"></a> [hub\_prefixes](#output\_hub\_prefixes) | List of IP ranges in CIDR format. |
