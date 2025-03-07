variable "instance_type" {
  type        = string
  description = "Instance type of the build controller"
  default     = "t3.medium"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume of the build controller in GB"
  default     = 20
}

variable "user_data" {
  type        = string
  description = "User data to pass to the build controller"
  default     = ""
}
