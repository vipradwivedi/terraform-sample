resource "random_integer" "count" {
  min = 1
  max = 5
  keepers = {
    always_change = plantimestamp()
  }
}

resource "random_string" "service" {
  count = random_integer.count.result

  length  = var.length
  special = var.special
  lower   = var.lower
  keepers = {
    always_change = plantimestamp()
  }
}
