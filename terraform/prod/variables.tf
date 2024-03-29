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
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
  default     = "~/.ssh/appuser.pub"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
  default     = "~/.ssh/appuser"
}
variable "image_id" {
  description = "Disk image"
  type        = string
}
variable "subnet_id" {
  description = "Subnet"
  type        = string
}
variable "service_account_key_file" {
  description = "key.json"
  default     = "key.json"
}
variable "instance_count" {
  description = "count var"
  default     = "1"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
}
