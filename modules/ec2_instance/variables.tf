variable "aws_region" {
  type        = string
  description = "The AWS region to launch the instance in"
  default     = "ap-southeast-2"
}

variable "instance_type" {
  type        = string
  description = "The type of EC2 instance to launch"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet in which to launch the instance"

  validation {
    condition     = length(regexall("^subnet-[\\d|\\w]+$", var.subnet_id)) == 1
    error_message = "The subnet_id variable must match the pattern ^subnet-[\\d|\\w]+$"
  }
}
