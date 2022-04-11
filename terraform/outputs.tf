output "external_ip_address_app" {
  value = yandex_compute_instance.app[0].network_interface.0.nat_ip_address
}
output "external_ip_address_load_balancer" {
  value = yandex_lb_network_load_balancer.lb_reddit.listener.*.external_address_spec[0].*.address
}
