terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "otusinfra"
    region                      = "ru-central1"
    key                         = "terraform/stage/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
