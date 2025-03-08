output "random_string" {
  value = "${var.service}-${var.env}-${random_string.this.result}"
}
