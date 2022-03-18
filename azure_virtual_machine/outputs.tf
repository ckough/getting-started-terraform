# The ID of the Resource Group
output "azurerm_resource_group" {
  value = azurerm_resource_group.demo.id
}

# The ID of the Virtual Network
output "azurerm_virtual_network" {
  value = azurerm_virtual_network.demo.id
}

# The ID of the Virtual Machines
output "demo_servers_id" {
  value = length(azurerm_windows_virtual_machine.demo_servers) > 0 ? azurerm_windows_virtual_machine.demo_servers.*.id : null
}