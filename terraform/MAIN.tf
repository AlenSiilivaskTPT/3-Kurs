provider "azurerm" {
  subscription_id = "${var.subscription}"
  version = "v1.44.0"
}

resource "azurerm_resource_group" "myResource" {
  name     = "${var.rgName}"
  location = "${var.region}"
}

resource "azurerm_storage_account" "tpt" {
  name                     = "dpsfgjsdg"
  resource_group_name      = "${azurerm_resource_group.myResource.name}"
  location                 = "${azurerm_resource_group.myResource.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tpt" {
  name                  = "dpsfgjsdg"
  storage_account_name  = "${azurerm_storage_account.tpt.name}"
  container_access_type = "private"
}
