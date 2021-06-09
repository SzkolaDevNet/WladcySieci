output "adresy_ip_prywatne" {
  value = join(" ", azurerm_network_interface.vNIC.*.private_ip_address)
}

output "adresy_ip_publiczne" {
  value = join(" ", azurerm_public_ip.publicIPVM.*.ip_address)
}
