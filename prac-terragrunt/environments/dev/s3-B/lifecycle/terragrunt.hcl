include "root" {
  path = find_in_parent_folders()
}

locals {
  root_path = dirname(find_in_parent_folders())

  env_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  env         = local.env_vars.locals.env
  bucket_name = local.common_vars.locals.uchidash_s3_bucket_name
}

dependency "s3_bucket" {
  config_path = "${local.root_path}/environments/${local.env}/s3-B/buckets"

  mock_outputs = {
    "test-bucket-name" = {}
  }
}

inputs = {
  bucket_name = "${local.env}-${local.bucket_name}"
}
