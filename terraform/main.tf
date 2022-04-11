#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "~> 0.35"
#    }
#  }
#  required_version = ">= 1.00"
#}

provider "yandex" {
  version = "~> 0.35"
  #  token                    = var.ya_auth_token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
  service_account_key_file = var.service_account_key_file
}
