variable "description" {
  description = "Description of the launch template"
  type        = string
  default     = null
}

variable "image_id" {
  description = "AMI ID"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Base64-encoded user data"
  type        = string
  default     = null
}

variable "monitoring_enabled" {
  description = "Whether detailed monitoring is enabled"
  type        = bool
  default     = true
}

variable "network_interface" {
  description = "Network interface configuration"
  type = object({
    associate_public_ip_address = optional(bool, false)
    security_groups             = optional(list(string), [])
  })
  default = null
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}
