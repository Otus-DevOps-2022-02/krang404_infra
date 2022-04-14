variable "cloud_id" {
  description = "Cloud"
  type        = string
  default     = "fakefakefakefake"
}
variable "folder_id" {
  description = "Folder"
  type        = string
  default     = "fakefakefakefake"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "service_account_key_file" {
  description = "key.json"
  default     = "key.json"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
  default     = "~/.ssh/yc.pub"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
  default     = "~/.ssh/yc"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
}
