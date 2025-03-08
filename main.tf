resource "random_string" "this" {
  length  = var.length
  special = var.special
  lower   = var.lower
}
