variable "vm_cores" {
  description = "Number of cpu cores for vm."
  type        = number
  default     = 2
}
variable "vm_mem" {
  description = "Number of memory for vm."
  type        = number
  default     = 2
}
variable "compute_zone" {
  description = "compute_zone."
  type        = string
  default     = "ru-central1-a"
}
variable "yc_token" {
  description = "yc_token"
  type        = string
  sensitive   = true
}
variable "yc_cloud_id" {
  description = "yc_cloud_id"
  type        = string
  sensitive   = true
}
variable "yc_folder_id" {
  description = "yc_folder_id"
  type        = string
  sensitive   = true
}
variable "subnet_id" {
  description = "subnet_id"
  type        = string
  sensitive   = true
}