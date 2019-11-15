variable "deployment_environment" {
  default = "dev"
}

variable "dns_endpoint_demsy" {
  type = "map"

  default = {
    dev  = "dev.demsy.indyreliable.com"
    qa   = "qa.demsy.indyreliable.com"
    prod = "demsy.indyreliable.com"
  }
}

variable "deployment_image" {
  default = "docker.indyreliable.com/demsy-dev"
}


variable "version" {
  default = "0.1"
}


