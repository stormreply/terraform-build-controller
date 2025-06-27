variable "detailed_monitoring" {
  type        = bool
  description = <<-EOD
    Flag for detailed monitoring. Make sure to understand cost/benefit relationship.
    Check: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/manage-detailed-monitoring.html
  EOD
  default     = true
}

variable "instance_name" {
  type        = string
  description = "Instance name"
  default     = "" # will be set in locals
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t3.medium"
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB"
  default     = 50
}

variable "user_data" {
  type        = string
  description = "User data to pass to the instance"
  default     = ""
}
