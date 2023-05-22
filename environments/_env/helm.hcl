terraform {
 source = "../../../modules/helm"
 before_hook "get-credentials"{
    commands = ["apply"]
    execute = ["az", "aks","get-credentials", "--resource-group","${dependency.aks.outputs.resource_group_name}", "--name", "${dependency.aks.outputs.cluster_name}", "--overwrite-existing"]
 }
}

dependency "aks" {
  config_path = "../aks"
}



# Module configuration
inputs = {
  ingress_name = "nginx-ingress-controller"
  app_name = "web-app"
}
