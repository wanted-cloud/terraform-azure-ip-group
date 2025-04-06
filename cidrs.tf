resource "azurerm_ip_group_cidr" "this" {
  for_each    = { for cidr in var.address_spaces : cidr => cidr }
  ip_group_id = azurerm_ip_group.this.id
  cidr        = each.value
}