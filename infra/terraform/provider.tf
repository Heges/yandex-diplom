terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.135.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kms-backet"
    region     = "ru-central1-a"
    key        = "terraform.tfstate"
    access_key = "YCAJEdl69cHyy0sH4TD8OdZRX"
    secret_key = "YCOAtbY6lNidlTsSWhYcudU1FPg2ktbRWpR-qSZc"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
} 

provider "yandex" {
  token     = var.yc_token #secret.tfvars
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.zone
}