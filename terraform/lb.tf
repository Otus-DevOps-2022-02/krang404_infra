resource "yandex_lb_target_group" "ya_target" {
  name      = "yatarget"
  folder_id = var.folder_id
  region_id = "ru-central1"

  dynamic "target" {
    for_each = yandex_compute_instance.app.*.network_interface.0.ip_address

    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
  }
}

resource "yandex_lb_network_load_balancer" "lb_reddit" {
  name      = "redditloadbalancer"
  folder_id = var.folder_id

  listener {
    name        = "listenreddit"
    port        = "80"
    target_port = "9292"
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.ya_target.id

    healthcheck {
      name = "http"
      tcp_options {
        port = "9292"
      }
    }
  }
}
