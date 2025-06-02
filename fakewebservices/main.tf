terraform {
  required_providers {
    fakewebservices = {
      source  = "xissy/fakewebservices"
      version = "0.0.6"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "fakewebservices" {
}
provider "random" {
}

resource "random_string" "service" {
  length  = 8
  special = false
  lower   = true
  keepers = {
    always_change = plantimestamp()
  }
}

resource "random_integer" "count" {
  min = 1
  max = 5
  keepers = {
    always_change = plantimestamp()
  }
}

resource "fakewebservices_vpc" "primary_vpc" {
  name       = "${var.service.result}-vpc"
  cidr_block = "0.0.0.0/1"
}

resource "fakewebservices_server" "servers" {
  count = random_integer.count.result

  name = "web-server-${var.service.result}-${count.index + 1}"
  type = "t2.micro"
  vpc  = fakewebservices_vpc.primary_vpc.name
}

resource "fakewebservices_load_balancer" "primary_lb" {
  name    = "web-server-${var.service.result}-lb"
  servers = fakewebservices_server.servers[*].name
}

resource "fakewebservices_database" "prod_db" {
  name = "db-server-${var.service.result}"
  size = 256
}
