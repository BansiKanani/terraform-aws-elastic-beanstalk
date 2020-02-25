# ---------------------------- S3 Backend (terraform state file) Config------------------------------------------------
terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "terraform-state-files-ackodev"
    key    = "devops/terraform-state-files/entity-service-for-UAT.tfstate"
    # encrypt = "true"
  }
}