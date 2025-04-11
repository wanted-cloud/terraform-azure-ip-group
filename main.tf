/*
 * # wanted-cloud/terraform-azure-ip-group
 * 
 * Terraform module building block managing Azure IP group resource.
 */

resource "azurerm_ip_group" "this" {
  name                = var.name
  location            = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  # CIDRs are defined by its own resource therefore this is empty
  cidrs = []

  tags = merge(local.metadata.tags, var.tags)

  lifecycle {
    ignore_changes = [
      # Ignore changes to the cidrs attribute as it is managed by the azurerm_ip_group_cidr resource
      cidrs
    ]
  }
}