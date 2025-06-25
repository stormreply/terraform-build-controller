variable "detailed_monitoring" {
  type        = bool
  description = <<-EOD
    Flag for detailed monitoring. Make sure to understand cost/benefit relationship.
    Check: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/manage-detailed-monitoring.html
  EOD
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Instance type of the build controller"
  default     = "t3.medium"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume of the build controller in GB"
  default     = 50 # TODO: validate check for min 50GB
}

variable "user_data" {
  type        = string
  description = "User data to pass to the build controller"
  default     = ""
}
