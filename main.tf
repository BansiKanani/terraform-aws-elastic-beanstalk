provider "aws" {
  profile = "default"
  region  = var.other.region
}

module "elastic_beanstalk" {
  source = "./modules/elastic_beanstalk"

  app_name                 = var.tags.app_name
  app_description          = var.tags.app_description
  owner                    = var.tags.owner
  EnvironmentPropertiesMap = var.env_prop

  # ImageId                = var.instance.ImageId
  EC2KeyName             = var.instance.ec2_key_name
  IamInstanceProfile     = var.instance.IamInstanceProfile
  InstanceType           = var.instance.instance_type
  solution_stack_name    = var.instance.solution_stack_name
  wait_for_ready_timeout = var.instance.wait_for_ready_timeout

  VPCId              = var.other.vpc_id
  ec2_SecurityGroups = var.other.instance_security_group_ids
  elb_SecurityGroups = var.other.loadbalancer_security_group_ids
  Subnets            = var.other.instance_subnets_ids
  ELBSubnets         = var.other.loadbalancer_subnets_ids

  MeasureName      = var.autoscale.measure_name
  Unit             = var.autoscale.measure_unit
  MinSize          = var.autoscale.min_instance_count
  MaxSize          = var.autoscale.max_instance_count
  LowerThreshold   = var.autoscale.lower_threshold
  UpperThreshold   = var.autoscale.upper_threshold
  LoadBalancerType = var.autoscale.loadbalancer_type
  ELBScheme        = var.autoscale.loadbalancer_scheme
}