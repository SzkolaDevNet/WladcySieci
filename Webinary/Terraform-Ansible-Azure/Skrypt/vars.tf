variable "ile" {
  type    = number
  default = 2
}
variable "location" {
  type    = string
  default = "WestEurope"
}

variable "resource_group" {
  type    = string
  default = "terraformrg"
}

variable "tags" {
  type = map(any)
  default = {
    deployment  = "terraform"
    environment = "wladcysieci"
  }
}

variable "server_credentials" {
  type = map(any)
  default = {
    login  = "azureadmin"
    passwd = "Test123!!"
  }
}