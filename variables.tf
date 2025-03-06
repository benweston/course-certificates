variable "project_name" {
  type        = string
  description = "Project name."
  sensitive   = true
}

variable "project_id_prefix" {
  type        = string
  description = "Project ID prefix."
  sensitive   = true
}

variable "project_number" {
  type        = string
  description = "Project number."
  sensitive   = true
}

variable "billing_account" {
  type        = string
  description = "Google Cloud billing account."
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Default region to use."
  sensitive   = true
}

variable "zone" {
  type        = string
  description = "Default zone to use."
  sensitive   = true
}

variable "my_email" {
  type        = string
  description = "Personal email address for setting ownership."
  sensitive   = true
}
/*
variable "bucket_sa" {
  type        = string
  description = "Default project Service Account."
  sensitive   = true
}
*/
