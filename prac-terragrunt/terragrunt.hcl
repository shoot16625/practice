generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("src/provider.tf")
}

generate "terraform" {
  path      = "_terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("src/terraform.tf")
}
