
variable "ingress_name" {
  type = string
  default = "nginx-ingress-controller"
}
variable "app_name" {
  type = string
  default = "web-app"
}
resource "helm_release" "nginx_ingress" {
  name       = var.ingress_name

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"
}
resource "helm_release" "web_app" {
  name       = var.app_name
  chart      = "./web-app"

}

