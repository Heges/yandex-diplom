resource "yandex_kubernetes_cluster" "k8s_zonal_cluster" {
 network_id = yandex_vpc_network.k8s-network.id
 master {
   version = var.k8s_version
   zonal {
     zone      = yandex_vpc_subnet.k8s-subnet.zone
     subnet_id = yandex_vpc_subnet.k8s-subnet.id
   }
   public_ip = true
 }
 
 service_account_id      = yandex_iam_service_account.k8s.id
 node_service_account_id = yandex_iam_service_account.k8s.id
   depends_on = [
     yandex_resourcemanager_folder_iam_binding.edit,
     yandex_resourcemanager_folder_iam_binding.image
   ]
}

resource "yandex_vpc_network" "k8s-network" { 
  name = "k8s-network" 
}

resource "yandex_vpc_subnet" "k8s-subnet" {
 name = "k8s-subnet"
 v4_cidr_blocks = [var.v4_cidr_blocks]
 zone           = var.zone
 network_id     = yandex_vpc_network.k8s-network.id
}

resource "yandex_iam_service_account" "k8s" {
 name        = "k8s"
 description = "Сервисный аккаунт для управления k8s"
}

resource "yandex_resourcemanager_folder_iam_binding" "edit" {
 folder_id = var.yc_folder_id
 role      = "editor"
 members   = [
   "serviceAccount:${yandex_iam_service_account.k8s.id}"
 ]
}

resource "yandex_resourcemanager_folder_iam_binding" "image" {
 folder_id = var.yc_folder_id
 role      = "container-registry.images.puller"
 members   = [
   "serviceAccount:${yandex_iam_service_account.k8s.id}"
 ]
}

resource "yandex_kubernetes_node_group" "k8s-node-group" {
  cluster_id  = "${yandex_kubernetes_cluster.k8s_zonal_cluster.id}"
  name        = "k8s-node-group"
  version     = var.k8s_version

  instance_template {
    platform_id = var.platform_id

    network_interface {
      nat                = true
      subnet_ids         = ["${yandex_vpc_subnet.k8s-subnet.id}"]
    }

    resources {
      memory = var.node_memory
      cores  = var.node_cores
      core_fraction = var.node_core_fraction
    }

    boot_disk {
      type = var.boot_disk_type
      size = var.boot_disk_size
    }
  }

  scale_policy {
    fixed_scale {
      size = var.nodes_count
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }

}