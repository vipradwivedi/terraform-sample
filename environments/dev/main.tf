module "random_string" {
  source  = "../../"
  service = local.service
  env     = local.env
  length  = local.length
  special = local.special
  lower   = local.lower
}
