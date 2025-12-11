variable "generate_new_random_resource" { default = "random123" }
variable "service_name" { default = "my-service" }
variable "server_count" { default = 3 }
variable "environment" { default = "sandbox" }
variable "ring" { default = "r0" }
variable "region" { default = "us-west-2" }


resource "random_id" "this" {
  count       = var.server_count
  byte_length = 4
  prefix      = "${var.service_name}-${var.environment}-${var.region}-${var.ring}-${count.index}"

  keepers = {
    always_change = var.generate_new_random_resource
  }
}

output "workspaces" { value = random_id.this[*].hex }
