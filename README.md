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
| <a name="input_cloud_name"></a> [cloud\_name](#input\_cloud\_name) | Name of the Zscaler cloud for which to return Zscaler Hub IP addresses.<br><br>Must be one of the ZIA clouds (e.g. "zscaler.net").<br>May not be a ZPA cloud (e.g. "private.zscaler.com") or ZDX cloud (e.g. "zdxcloud.net").<br>Defaults to "zscaler.net".<br><br>See Also:<br>  https://config.zscaler.com/ | `string` | `"zscaler.net"` | no |
| <a name="input_type"></a> [type](#input\_type) | The disjoint subset of IP addresses to return.<br><br>Must be either "required" or "recommended".<br>Defaults to "required".<br><br>Note:<br>  Zscaler Hub IP address ranges run vital Zscaler cloud services, platform management, and monitoring.<br>  Access to & from these IP addresses is essential for seamless service delivery and resilient and scalable support.<br><br>See Also:<br>  https://config.zscaler.com/zscaler.net/hubs | `string` | `"required"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_IPv4_hub_prefixes"></a> [IPv4\_hub\_prefixes](#output\_IPv4\_hub\_prefixes) | List of IP ranges in CIDR format. Only IPv4 addresses are included. |
| <a name="output_IPv6_hub_prefixes"></a> [IPv6\_hub\_prefixes](#output\_IPv6\_hub\_prefixes) | List of IP ranges in CIDR format. Only IPv6 addresses are included. |
| <a name="output_cloud_name"></a> [cloud\_name](#output\_cloud\_name) | Name of the Zscaler cloud to which the IP addresses belong.<br><br>Equal to `var.cloud_name`.<br><br>See Also:<br>  https://config.zscaler.com/ |
| <a name="output_hub_prefixes"></a> [hub\_prefixes](#output\_hub\_prefixes) | List of IP ranges in CIDR format. Both IPv4 and IPv6 addresses are included. |
| <a name="output_type"></a> [type](#output\_type) | Type of the disjoint subset of IP addresses.<br><br>Equal to `var.type`.<br><br>Note:<br>  Zscaler Hub IP address ranges run vital Zscaler cloud services, platform management, and monitoring.<br>  Access to & from these IP addresses is essential for seamless service delivery and resilient and scalable support.<br><br>See Also:<br>  https://config.zscaler.com/zscaler.net/hubs |
