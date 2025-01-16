terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.135.0"
    }
  }

  backend "s3" {
    # Добавьте в переменные окружения идентификатор ключа и секретный ключ
    # export ACCESS_KEY="<идентификатор_ключа>"
    # export SECRET_KEY="<секретный_ключ>"
    # terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
    endpoint   = "storage.yandexcloud.net"
    bucket     = "kns-backet"
    region     = "ru-central1-a"
    key        = "terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
} 

provider "yandex" {
  #указывается в value.tfvars
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.zone
}