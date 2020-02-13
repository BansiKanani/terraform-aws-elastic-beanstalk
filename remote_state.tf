# ---------------------------- S3 Backend (terraform state file) Config------------------------------------------------
terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "brk-terraform-remote-state"
    key     = "devops/ebs-infra.tfstate"
    # encrypt = "true"
  }
}