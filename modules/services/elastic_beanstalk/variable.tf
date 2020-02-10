variable "app_name" {
	description = "EBS app name"
}
variable "app_description" {
	description = "EBS app description"
}
variable "bucket_id" {
}
variable "object_id" {
}
variable "ami" {
}
variable "instance_type" {
  	default = "t2.micro"
}
variable "vpc_id" {
}
variable "autoscale_min" {
}
variable "autoscale_max" {
}
variable "EC2KeyName" {
}
variable "SecurityGroupIds" {
	description = "List of security group Ids"
}
variable "subnets_ids" {
}
variable "elb_subnets_ids" {
}
variable "loadbalancer_type" {  
}
variable "wait_for_ready_timeout" {
}
variable "autoscale_MeasureName" {
}
variable "autoscale_Unit" {
}
variable "autoscale_LowerThreshold" {
}
variable "autoscale_UpperThreshold" {
}



