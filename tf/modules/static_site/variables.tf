variable "prefix" {
  type = string
  default = ""
}

variable "hosted_zone_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "redirect_domain_names" {
  default = []
}

variable "routing_rules" {
  type = string
  default = ""
}
