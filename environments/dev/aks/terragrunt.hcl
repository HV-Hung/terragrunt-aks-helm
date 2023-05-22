# environments/dev/terragrunt.hcl

include "root" {
  path = find_in_parent_folders()
}

include "env_aks" {
  path = "${get_terragrunt_dir()}/../../_env/aks.hcl"
}


# Module configuration
inputs = {
  env= "dev"
}

