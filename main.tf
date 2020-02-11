provider "aws" {
  profile = "default"
  region  = var.env.region
}
module "s3" {
  source      = "./modules/data-store/s3"
  bucket_name = var.env.bucket_name
  key_name    = var.app.source_file
  source_file = var.app.source_file
}
module "elastic_beanstalk" {
  app_name                 = var.app.app_name
  app_description          = var.app.app_description
  source                   = "./modules/services/elastic_beanstalk"
  # ami                      = var.env.ami
  instance_type            = var.env.instance_type
  bucket_id                = module.s3.bucket_id
  object_id                = module.s3.object_id
  vpc_id                   = var.env.vpc_id
  autoscale_min            = var.env.autoscale_min
  autoscale_max            = var.env.autoscale_max
  EC2KeyName               = var.env.EC2KeyName
  SecurityGroupIds         = var.env.SecurityGroupIds
  subnets_ids              = var.env.subnets_ids
  elb_subnets_ids          = var.env.elb_subnets_ids
  loadbalancer_type        = var.env.loadbalancer_type
  wait_for_ready_timeout   = var.env.wait_for_ready_timeout
  autoscale_MeasureName    = var.env.autoscale_MeasureName
  autoscale_Unit           = var.env.autoscale_Unit
  autoscale_LowerThreshold = var.env.autoscale_LowerThreshold
  autoscale_UpperThreshold = var.env.autoscale_UpperThreshold
  owner                    = var.app.owner
  elb_scheme               = var.env.elb_scheme
}