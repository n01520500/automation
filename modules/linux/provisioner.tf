resource "null_resource" "hostnamectl" {
  provisioner "local-exec" {
    command = "echo 'hostanamectl'"
  }
}
