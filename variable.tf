variable "bucket_name" {
  description = "Name of the bucket"
  type = string
}

variable "public_access" {
    description = "Should allow public access"
    type = bool
    default = false
}

variable "lifecycle_enabled" {
    description = "Should use lifecycle"
    type = bool
    default = false
}

variable "days" {
  description = "Should use transtion"
  type = number
  default = 1
}