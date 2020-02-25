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
    app_name        = "entity-service-uat"
    app_description = "Entity service for UAT"
    owner           = "devops@acko.dev"
  }
}
# ----------------------------Enviroment Config--------------------------------------------------
variable "instance" {
  description = "Config for individual instances"
  default = {
    instance_type          = "t2.nano"
    ec2_key_name           = "entity-service"
    IamInstanceProfile     = "aws-elasticbeanstalk-ec2-role"
    wait_for_ready_timeout = "10m"
    # ImageId                = "ami-081089dc4c9cc5c50"
    solution_stack_name = "64bit Amazon Linux 2018.03 v2.10.2 running Java 8"
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
    loadbalancer_scheme = "internal"
  }
}
# ----------------------------Environment Properties------------------------------------------------
variable "env_prop" {
  description = "Environment Properties or variables. Insert in default section below."
  default = {
    # var_name_1 = "some-random-value-1"
    # var_name_2 = "some-random-value-2"
  }
}
# ---------------------------- Other Config------------------------------------------------
variable "other" {
  description = "Network config for cloud resources."
  default = {
    region                          = "ap-south-1"
    av_zones                        = ["ap-south-1a", "ap-south-1b"]
    vpc_id                          = "vpc-a9b9e2c1",
    instance_subnets_ids            = ["subnet-06593149ecdc27f22", "subnet-0a9b9a51140530d8c"] # private-1a, priate-1b
    loadbalancer_subnets_ids        = ["subnet-06593149ecdc27f22", "subnet-0a9b9a51140530d8c"]
    instance_security_group_ids     = ["sg-03cb80268f9132a56"] # default-internal-all
    loadbalancer_security_group_ids = ["sg-03cb80268f9132a56"] # default-internal-all
  }
}