
variable "resource_group_name" {
  type = string
  default = "my-aks-resource-group"
}
variable "resource_group_location" {
  type = string
  default = "southeastasia"
}

variable "cluster_name" {
  type = string
  default = "k8s-cluster"
}

variable "node_pool_name" {
  type = string
  default = "default"
}
variable "vm_size" {
  type = string
  default = "Standard_DS2_v2"
}

variable "env" {
  type = string
  default = "dev"
}
resource "azurerm_resource_group" "aks" {
  name     = "${var.resource_group_name}-${var.env}"
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}-${var.env}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "k8s-cluster"

  linux_profile {
    admin_username = "adminuser"
    ssh_key {
      key_data = file("~/.ssh/pingping.pub")
    }
  }

  default_node_pool {
    name            = var.node_pool_name
    vm_size         = var.vm_size
    node_count      = 1
    os_disk_size_gb = 30
  }
  identity {
    type = "SystemAssigned"
  }

  # service_principal {
  #   client_id     = ""
  #   client_secret = ""
  # }


   network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet" 
  }

  tags = {
    environment = var.env
  }
}


output "cluster_name" {
  value = azurerm_kubernetes_cluster.k8s.name
}

output "resource_group_name" {
  value = azurerm_resource_group.aks.name
}