/*
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
*/

terraform {
  backend "gcs" {
    bucket = "terraform-state-347670"
    prefix = "/env/prod/terraform.tfstate"
  }
}
