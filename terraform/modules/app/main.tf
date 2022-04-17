terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
  required_version = ">= 1.00"
}

resource "yandex_compute_instance" "app" {
  #count       = var.instance_count
  name = "reddit-app"
  labels = {
    tags = "reddit-app"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.app_disk_image
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }


  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }
  provisioner "local-exec" {
    command = "echo DATABASE_URL=${var.database_addr}:27017 >> ../files/puma.env"
  }
  provisioner "file" {
    source      = "../files/puma.env"
    destination = "/tmp/puma.env"
  }
  provisioner "file" {
    source      = "../files/puma.service.tmpl"
    destination = "/tmp/puma.service.tmpl"
  }
  provisioner "remote-exec" {
    script = "../files/deploy.sh"
  }
}
