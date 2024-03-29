terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
  required_version = ">= 1.00"
}

resource "yandex_compute_instance" "db" {
  name                      = "reddit-db"
  allow_stopping_for_update = true
  labels = {
    tags = "reddit-db"
  }

  resources {
    core_fraction = 5
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  # connection {
  #   type  = "ssh"
  #   host  = self.network_interface.0.nat_ip_address
  #   user  = "ubuntu"
  #   agent = false
  #   # путь до приватного ключа
  #   private_key = file(var.private_key_path)
  # }
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo sed -i.bak 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf",
  #     "sudo systemctl restart mongod.service"
  #   ]
  # }
}
