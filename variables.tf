# variable "variable" {         # don't touch it
#   description = "description"
#   default = {
#       # edit values here
#   }
# }
# ------------------------------Tags------------------------------------------------
variable "tags" {
  description = "Tags will have no effect on functioning of the environment."
  default = {
    app_name        = "TestPythonApp"
    app_description = "A python application"
    owner           = "devops@acko.tech"
  }
}
# ----------------------------Enviroment Config--------------------------------------------------
variable "instance" {
  description = "Config for individual instances"
  default = {
    instance_type          = "t2.micro"
    ec2_key_name           = "key1"
    wait_for_ready_timeout = "10m"
    ImageId                = "ami-04b2418be76894465"
    solution_stack_name    = "64bit Amazon Linux 2018.03 v2.9.5 running Python 3.6"
  }
}
# ----------------------------Autoscale Config--------------------------------------------------
variable "autoscale" {
  description = "When to scale out and scale in. Number of instances we need."
  default = {
    measure_name        = "CPUUtilization"
    measure_unit        = "Percent"
    lower_threshold     = "20"
    upper_threshold     = "80"
    min_instance_count  = 1
    max_instance_count  = 2
    loadbalancer_type   = "application"
    loadbalancer_scheme = "public"
  }
}
# ----------------------------Environment Properties------------------------------------------------
variable "env_prop" {
  description = "Environment Properties or variables. Insert in default section below."
  default = {
    var_name_1 = "some-random-value-1"
    var_name_2 = "some-random-value-2"
  }
}
# ---------------------------- Other Config------------------------------------------------
variable "other" {
  description = "Network config for cloud resources."
  default = {
    region                          = "us-east-1"
    av_zones                        = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
    vpc_id                          = "vpc-701f710a",
    instance_subnets_ids            = ["subnet-cbcc9397", "subnet-4f4c1e28", "subnet-8e164ea0", "subnet-48668405", "subnet-cf6001f1", "subnet-8a849085"]
    loadbalancer_subnets_ids        = ["subnet-cbcc9397", "subnet-4f4c1e28", "subnet-8e164ea0", "subnet-48668405", "subnet-cf6001f1", "subnet-8a849085"]
    instance_security_group_ids     = ["sg-031de133d3554fc4b"]
    loadbalancer_security_group_ids = ["sg-031de133d3554fc4b"]
  }
}