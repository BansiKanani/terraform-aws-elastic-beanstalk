# Environment Info
variable "publc-subnet-map" {
  default = {
    us-east-1a = "subnet-cbcc9397"
    us-east-1b = "subnet-4f4c1e28"
    us-east-1c = "subnet-8e164ea0"
    us-east-1d = "subnet-48668405"
    us-east-1e = "subnet-cf6001f1"
    us-east-1f = "subnet-8a849085"
  }
}
variable "private-subnet-map" {
  default = {
    us-east-1a = "subnet-00778577f8df0fcd7"
    us-east-1b = "subnet-0db40be6c10e7b7e0"
    us-east-1c = "subnet-0c8841dfbd0faadf7"
    us-east-1d = "subnet-0b4b9f4d500fd2f6e"
    us-east-1e = "subnet-012665bde776bc7c7"
    us-east-1f = "subnet-0d751c08b72c6596d"
  }
}
variable "env" {
  default = {
    region        = "us-east-1"
    av_zones      = ["us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
    bucket_name   = "somerandombucketgfgjhuikjiolkjiuygytrfrasdscvfd"
    ami           = "ami-0f86bb438e080dd6b"
    instance_type = "t2.micro"
    EC2KeyName    = "ssh-trial"

    #  Public VPC
    vpc_id                 = "vpc-701f710a"
    SecurityGroupIds       = ["sg-031de133d3554fc4b"]
    subnets_ids            = ["subnet-8e164ea0", "subnet-48668405", "subnet-cf6001f1", "subnet-8a849085"]
    elb_subnets_ids        = ["subnet-cbcc9397", "subnet-4f4c1e28"]

    # Private VPC
    # vpc_id                 = "vpc-024588dabb9de5508"
    # SecurityGroupIds       = ["sg-0e13bcaa1b1d963cf"]
    # subnets_ids            = ["subnet-0c8841dfbd0faadf7", "subnet-0b4b9f4d500fd2f6e", "subnet-012665bde776bc7c7", "subnet-0d751c08b72c6596d"]
    # elb_subnets_ids        = ["subnet-00778577f8df0fcd7", "subnet-0db40be6c10e7b7e0"]
    loadbalancer_type      = "application"
    wait_for_ready_timeout = "10m"

    autoscale_min            = 1
    autoscale_max            = 2
    autoscale_MeasureName    = "CPUUtilization"
    autoscale_Unit           = "Percent"
    autoscale_LowerThreshold = "20"
    autoscale_UpperThreshold = "80"
  }
}
# Application Info
variable "app" {
  default = {
    app_name        = "TestPythonApp"
    app_description = "A python application"
    source_file     = "python-v1.zip"
  }
}