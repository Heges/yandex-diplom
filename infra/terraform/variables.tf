variable "yc_token" {
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  type        = string
  sensitive   = true
}

variable "yc_folder_id" {
  type        = string
  sensitive   = true
}

variable "s3_secret" {
  type        = string
  sensitive   = true
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "v4_cidr_blocks" {
  type        = string
  default     = "10.100.0.0/16"
}

variable "platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "node_memory" {
  type        = number
  default     = 3
}

variable "node_cores" {
  type        = number
  default     = 2
}

variable "node_core_fraction" {
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  type        = string
  default     = "network-hdd"
}

variable "boot_disk_size" {
  type        = number
  default     = 64
}

variable "nodes_count" {
  type        = number
  default     = 2
}

variable "k8s_version" {
  type        = string
  default     = "1.28"
}