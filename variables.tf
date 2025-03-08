variable "length" {
  description = "The length of the random string"
  type        = number
  default     = 8
}

variable "special" {
  description = "Whether to include special characters"
  type        = bool
  default     = false
}

variable "lower" {
  description = "Whether to include lowercase characters"
  type        = bool
  default     = true
}

variable "env" {
  description = "The environment"
  type        = string
  default     = "default"
}

variable "service" {
  description = "The service"
  type        = string
  default     = "default"
}