locals {
  env = "dev"

  uchiadsh_rules = [
    {
      id     = "rule-1"
      status = "Enabled"
      expiration = {
        days = 90
      }
    },
    {
      id     = "rule-2"
      status = "Enabled"
    },
  ]
  uchiadsh_02_rules = [
    {
      id     = "rule-3"
      status = "Enabled"
    },
    {
      id     = "rule-4"
      status = "Enabled"
    },
  ]
}
