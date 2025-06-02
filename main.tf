resource "random_integer" "count" {
  min = 5
  max = 10
  keepers = {
    always_change = plantimestamp()
  }
}

resource "random_string" "service" {
  count = 3

  length  = var.length + random_integer.count.result
  special = var.special
  lower   = var.lower
  keepers = {
    always_change = plantimestamp()
  }
}
