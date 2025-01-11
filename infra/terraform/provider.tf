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
    region     = "ru-central1"
    key        = "YCOAtbY6lNidlTsSWhYcudU1FPg2ktbRWpR-qSZc"
    access_key = "y0_AgAAAAAzqi7KAATuwQAAAAELMnMnAABIkgQ1aqZBuKJC7way-GwlP38bwg"
  # secret_key in backend.tfvars

    skip_region_validation      = true
    skip_credentials_validation = true
  }
} 

provider "yandex" {
  token     = var.iam_token #secret.tfvars
  cloud_id  = var.yc_token
  folder_id = var.yc_folder_id
  zone      = var.zone
}