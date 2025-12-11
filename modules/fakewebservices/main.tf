variable "service_name" { default = "my-service" }
variable "vpc_cidr_block" { default = "0.0.0.0/1" }
variable "server_count" { default = 3 }
variable "server_type" { default = "t2.micro" }
variable "database_size" { default = 256 }

locals {
  vpc_name     = "${var.service_name}-vpc"
  server_names = [for i in range(var.server_count) : "web-server-${var.service_name}-${i + 1}"]
  lb_name      = "web-server-${var.service_name}-lb"
  db_name      = "db-server-${var.service_name}"
}

resource "fakewebservices_vpc" "primary_vpc" {
  name       = local.vpc_name
  cidr_block = var.vpc_cidr_block
}

resource "fakewebservices_server" "servers" {
  count = var.server_count

  name = local.server_names[count.index]
  type = var.server_type
  vpc  = fakewebservices_vpc.primary_vpc.name
}

resource "fakewebservices_load_balancer" "primary_lb" {
  name    = local.lb_name
  servers = fakewebservices_server.servers[*].name
}

output "vpc_name" { value = fakewebservices_vpc.primary_vpc.name }
output "server_names" { value = fakewebservices_server.servers[*].name }
output "load_balancer_name" { value = fakewebservices_load_balancer.primary_lb.name }
