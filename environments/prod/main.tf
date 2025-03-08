module "random_string" {
  source  = "../../"
  env     = local.env
  service = local.service
  length  = local.length
  special = local.special
  lower   = local.lower
}
