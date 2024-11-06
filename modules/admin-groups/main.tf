# Assuming you already have the management groups
data "azurerm_management_group" "lz" {
  name = var.landing-zone-management-group-name
}

data "azurerm_management_group" "data_platform" {

  name = var.data-platform-management-group-name
}

locals {
  group_ids = {
    "Azure Tenant Admin"           = "121a028c-4a65-4751-95c5-3cfe873ba2b4"
    "Azure Tenant ReadOnly"        = "121a028c-4a65-4751-95c5-3cfe873ba2b4"
    "Azure Data Platform Admin"    = "121a028c-4a65-4751-95c5-3cfe873ba2b4"
    "Azure Data Platform ReadOnly" = "121a028c-4a65-4751-95c5-3cfe873ba2b4"
  }
}

resource "azurerm_role_assignment" "lz_tenant_admin_role" {
  scope                = data.azurerm_management_group.lz.id
  role_definition_name = "Owner"
  principal_id         = local.group_ids["Azure Tenant Admin"]
}

resource "azurerm_role_assignment" "lz_tenant_readonly_role" {
  scope                = data.azurerm_management_group.lz.id
  role_definition_name = "Reader"
  principal_id         = local.group_ids["Azure Tenant ReadOnly"]
}

resource "azurerm_role_assignment" "data_platform_admin_role" {
  scope                = data.azurerm_management_group.data_platform.id
  role_definition_name = "Owner"
  principal_id         = local.group_ids["Azure Data Platform Admin"]
}

resource "azurerm_role_assignment" "data_platform_readonly_role" {
  scope                = data.azurerm_management_group.data_platform.id
  role_definition_name = "Reader"
  principal_id         = local.group_ids["Azure Data Platform ReadOnly"]
}