output "hub_prefixes" {
  value = (
    var.as_azurerm_storage_account_ip_rules ?
    local.hub_prefixes_as_azurerm_storage_account_ip_rules :
    local.hub_prefixes
  )
  description = "List of IP ranges in CIDR format."
}
