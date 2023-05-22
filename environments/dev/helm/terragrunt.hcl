# environments/dev/terragrunt.hcl

include "root" {
  path = find_in_parent_folders()
}

include "env_helm" {
  path = "${get_terragrunt_dir()}/../../_env/helm.hcl"
}

