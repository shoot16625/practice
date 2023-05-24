include "root" {
  path = find_in_parent_folders()
}

locals {
  root_path = dirname(find_in_parent_folders())

  env_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  env            = local.env_vars.locals.env
  bucket_name    = local.common_vars.locals.uchidash_s3_bucket_name
  bucket_name_02 = local.common_vars.locals.uchidash_02_s3_bucket_name
}

terraform {
  source = "${local.root_path}//modules/s3/bucket"
}

inputs = {
  bucket_names = ["${local.env}-${local.bucket_name}", "${local.env}-${local.bucket_name_02}"]
}
