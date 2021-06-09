provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "Webinar-VNet" {
  address_space       = ["172.21.0.0/16"]
  location            = var.location
  name                = "VNet-Lab"
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_subnet" "serwery_www" {
  name                 = "serwery_www"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.Webinar-VNet.name
  address_prefixes     = ["172.21.0.0/24"]
}

resource "azurerm_network_security_group" "LabNSG" {
  location            = var.location
  name                = "LabNSG"
  resource_group_name = var.resource_group
  tags                = var.tags

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "SSH"
    priority                   = 100
    protocol                   = "Tcp"
    source_address_prefix      = "212.180.199.2"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
  }

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "HTTP"
    priority                   = 101
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
  }
}

resource "azurerm_public_ip" "publicIPVM" {
  allocation_method   = "Static"
  location            = var.location
  name                = "publicIPVM-${count.index}"
  resource_group_name = var.resource_group
  sku                 = "Standard"
  count               = var.ile
}

resource "azurerm_network_interface" "vNIC" {
  location            = var.location
  name                = "vNIC-VM-${count.index}"
  resource_group_name = var.resource_group
  count               = var.ile
  ip_configuration {
    name                          = "vNICIP-${count.index}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.serwery_www.id
    public_ip_address_id          = element(azurerm_public_ip.publicIPVM.*.id, count.index)
  }
}

resource "azurerm_subnet_network_security_group_association" "VNet_NSG" {
  network_security_group_id = azurerm_network_security_group.LabNSG.id
  subnet_id                 = azurerm_subnet.serwery_www.id
}

resource "azurerm_linux_virtual_machine" "linux_www" {
  location              = var.location
  name                  = "www-${count.index}"
  network_interface_ids = [element(azurerm_network_interface.vNIC.*.id, count.index)]
  resource_group_name   = var.resource_group
  size                  = "Standard_B1ls"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    offer     = "UbuntuServer"
    publisher = "Canonical"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_username                  = var.server_credentials.login
  admin_password                  = var.server_credentials.passwd
  disable_password_authentication = false

  count = var.ile

  provisioner "local-exec" {
    command = "sleep 30; ansible-playbook -i '${self.public_ip_address},' -e adres_ip='${self.private_ip_address}' playbook.yaml"
  }

  tags = var.tags
}

