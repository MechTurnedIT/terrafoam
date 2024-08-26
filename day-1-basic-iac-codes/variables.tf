variable "ami" {
  description = "attach to main.tf"
  type        = string
  default     = "ami-0a2202cf4c36161a1"
}
variable "type" {
  description = "attatch type to main.tf"
  type        = string
  default     = "t2.micro"
}
variable "key" {
  description = "attatch key to main.tf"
  type        = string
  default     = "ireland"
}