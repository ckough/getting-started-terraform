# A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it.
locals {
  location = "australiasoutheast"

  windows_publisher = "MicrosoftWindowsServer"
  windows_offer     = "WindowsServer"
  windows_sku       = "2016-Datacenter"
}