variable "env" {
  description = "This is the env for my infra"
  type = string
}

variable "bucket_name" {
  description = "This is the bucket name"
  type = string
}

variable "instance_count" {
  description = "This is the count of intance"
  type = number
}

variable "instance_type" {
  description = "This is instance type"
  type = string
}

variable "ami_id" {
  description = "This is ami_id"
  type = string
}
