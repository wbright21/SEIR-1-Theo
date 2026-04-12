resource "null_resource" "get_credentials" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials primary --zone us-central1-a --project thailand-433607"
  }

  depends_on = [
    google_container_cluster.primary
  ]
}


output "kubectl_command" {
  value = "kubectl get nodes"
}

