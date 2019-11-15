data "template_file" "demsy_values" {
  template = "${file("./demsy-deployment/template_values.yaml")}"
  vars = {
    deployment_endpoint = "${lookup(var.dns_endpoint_demsy, "${var.deployment_environment}")}"
    deployment_image = "${var.deployment_image}"
  }
}

resource "local_file" "demsy_values_local_file" {
  content  = "${trimspace(data.template_file.demsy_values.rendered)}"
  filename = "./demsy-deployment/.cache/values.yaml"
}

resource "helm_release" "demsy" {
  name      = "${var.deployment_environment}-demsy-deployment"
  namespace = "${var.deployment_environment}"
  chart = "./demsy-deployment"
  version    = "${var.version}"
   values = [
    "${data.template_file.demsy_values.rendered}"
  ]
}