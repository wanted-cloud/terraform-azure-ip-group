/*
 * # wanted-cloud/terraform-azure-ip-group
 * 
 * Terraform module building block managing Azure IP group resource.
 */

resource "azurerm_ip_group" "this" {
  name                = "example1-ipgroup"
  location            = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  # CIDRs are defined by its own resource therefore this is empty
  cidrs = []

  tags = merge(var.tags, local.metadata.tags)

  lifecycle {
    ignore_changes = [
      # Ignore changes to the tags attribute
      cidrs,
    ]
  }
}