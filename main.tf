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

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_ip_group"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_ip_group"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_ip_group"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_ip_group"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}