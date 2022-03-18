# Write Everything Twice
resource "azurerm_resource_group" "demo" {
  name     = "getting-started-terraform"
  location = local.location
}

resource "azurerm_virtual_network" "demo" {
  name                = "DemoVnet"
  address_space       = ["10.0.0.0/16"]
  location            = local.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_subnet" "demo" {
  name                 = "DemoSubnet"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "demo_nics" {
   count = var.environment == "prod" ? 3 : 1

  name                = "DemoNic${count.index + 1}"
  location            = local.location
  resource_group_name = azurerm_resource_group.demo.name

  ip_configuration {
    name                          = "DemoConfig${count.index + 1}"
    subnet_id                     = azurerm_subnet.demo.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "demo_servers" {
  count = var.environment == "prod" ? 3 : 1

  name                  = "DemoServer${count.index + 1}"
  location              = azurerm_resource_group.demo.location
  resource_group_name   = azurerm_resource_group.demo.name
  network_interface_ids = ["${element(azurerm_network_interface.demo_nics.*.id, count.index)}"]
  size                  = var.vm_size

  admin_username = "adminuser" # very bad practice
  admin_password = "P@$$w0rd1234!" # very bad practice

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = local.windows_publisher
    offer     = local.windows_offer
    sku       = local.windows_sku
    version   = "latest"
  }
}