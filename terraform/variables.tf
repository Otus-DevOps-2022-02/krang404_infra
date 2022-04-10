variable "cloud_id" {
  description = "Cloud"
  type        = string
}
variable "folder_id" {
  description = "Folder"
  type        = string
}
#variable "ya_auth_token" {
#  description = "ya_auth_token"
#  type        = string
#}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
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
}
variable "instance_count" {
  description = "count var"
  default     = "1"
}
