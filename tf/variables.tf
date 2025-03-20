variable "create_resource_group" {
  type     = bool
  default  = true
  nullable = false
}

variable "location" {
  default = "germanywestcentral"
}

variable "resource_group_name" {
  type    = string
  default = null
}

variable "storage_account_name" {
  type        = string
  default = null
}
variable "container_name" {
  type        = string
  default = null
}
variable "access_key" {
  type        = string
  default = null
}

variable "key" {
  type        = string
  default = null
}