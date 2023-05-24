include "root" {
  path = find_in_parent_folders()
}

locals {
  root_path = dirname(find_in_parent_folders())

  env_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  env                    = local.env_vars.locals.env
  bucket_name            = local.common_vars.locals.uchidash_s3_bucket_name
  bucket_lifecycle_rules = local.env_vars.locals.uchiadsh_rules
}

terraform {
  source = "${local.root_path}//modules/s3/pattern01"
}

inputs = {
  bucket_name            = "${local.env}-${local.bucket_name}"
  bucket_lifecycle_rules = local.bucket_lifecycle_rules
}
