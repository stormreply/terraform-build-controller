variable "ami" {
  type        = string
  description = "AMI (Id) to use for the instance"
  default     = null
}

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
  default     = null # will be set in locals
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t3.medium"
}

variable "key_name" {
  type        = string
  description = "Key pair name to use"
  default     = null
}

variable "policies" {
  type        = list(string)
  description = "List of IAM policy ARNs to attach to the instance"
  default     = []
}

variable "region" {
  type        = string
  description = "Region where to deploy to"
  default     = null
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB"
  default     = 50
}

variable "subnet_id" {
  type        = string
  description = "Id of the subnet to create this instance in"
  default     = null
}

variable "user_data" {
  type        = string
  description = "User data to pass to the instance"
  default     = null
}

variable "user_data_base64" {
  type        = string
  description = "User data to pass to the instance; base64-encoded"
  default     = null
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to use with the instance"
  default     = null
}
