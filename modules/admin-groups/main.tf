# Assuming you already have the management groups
data "azurerm_management_group" "lz" {
  name = var.landing-zone-management-group-name
}

data "azurerm_management_group" "data_platform" {

  name = var.data-platform-management-group-name
}

# Data source to fetch existing Azure AD groups
data "azuread_group" "groups" {
  for_each = toset([
    "Azure Tenant Admin",
    "Azure Tenant ReadOnly",
    "Azure Data Platform Admin", 
    "Azure Data Platform ReadOnly"
  ])
  
  display_name = each.key
}

# Role Assignments for Tenant Landing Zone Management Group
resource "azurerm_role_assignment" "lz_tenant_admin_role" {
  name                 = "lz-tenant-admin-owner-role"
  scope                = data.azurerm_management_group.lz.id
  role_definition_name = "Owner"
  principal_id         = data.azuread_group.groups["Azure Tenant Admin"].id
}

resource "azurerm_role_assignment" "lz_tenant_readonly_role" {
  name                 = "lz-tenant-readonly-reader-role"
  scope                = data.azurerm_management_group.lz.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_group.groups["Azure Tenant ReadOnly"].id
}

# Role Assignments for Data Platform Management Group
resource "azurerm_role_assignment" "data_platform_admin_role" {
  name                 = "data-platform-admin-owner-role"
  scope                = data.azurerm_management_group.data_platform.id
  role_definition_name = "Owner"
  principal_id         = data.azuread_group.groups["Azure Data Platform Admin"].id
}

resource "azurerm_role_assignment" "data_platform_readonly_role" {
  name                 = "data-platform-readonly-reader-role"
  scope                = data.azurerm_management_group.data_platform.id
  role_definition_name = "Reader"
  principal_id         = data.azuread_group.groups["Azure Data Platform ReadOnly"].id
}
