output "random_string" {
  value = "${var.service}-${var.env}-${random_string.service[0].result}"
}
