terraform {
 source = "../../../modules/aks"
}



# Module configuration
inputs = {
  resource_group_location = "southeastasia"
  resource_group_name = "my-aks-resource-group"
  cluster_name = "k8s-cluster"
  node_pool_name  = "default"
  vm_size = "Standard_DS2_v2"
}
