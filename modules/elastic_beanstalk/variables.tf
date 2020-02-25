variable "app_name" {
	description = "Elastic Beanstalk Application Name (tag)"
}
variable "app_description" {
	description = "Elastic Beanstalk Application Description (tag)"
}
# variable "ImageId" {
# 	description = "AMI to use to build the environment"
# }
variable "solution_stack_name" {
	description = "Environment type i.e. 64bit Amazon Linux 2018.03 v2.9.5 running Python 3.6"
}
variable "InstanceType" {
  	description = "Depends on processing power, otherwise use t2.micro for free tier"
}
variable "VPCId" {
	description = "Self descriptive"
}
variable "MinSize" {
	description = "No of minimum instances in autoscaling"
}
variable "MaxSize" {
	description = "No of maximum instances in autoscaling"
}
variable "EC2KeyName" {
	description = "Key to use to acces EC2 instances"
}
variable "IamInstanceProfile" {
	description = "IamInstanceProfile to set for EC2 instances"
}
variable "ec2_SecurityGroups" {
	description = "List of security group Ids"
}
variable "elb_SecurityGroups" {
	description = "List of security group Ids"
}
variable "Subnets" {
	description = "Subnet IDs for instances"
}
variable "ELBSubnets" {
	description = "Subnet IDs for Loadbalancer"
}
variable "LoadBalancerType" { 
	description = "It can be classic, application or network" 
}
variable "wait_for_ready_timeout" {
	description = "Wait for instances before timeout, default is 20 minutes (20m)"
}
variable "MeasureName" {
	description = "Which thing you want to measure for autoscaling. i.e. CPUUtilization"
}
variable "Unit" {
	description = "Unit of mesurement for autoscaling. i.e. Percent"
}
variable "LowerThreshold" {
	description = "When you want to scale in. i.e. 20"
}
variable "UpperThreshold" {
	description = "When you want to scale out. i.e. 80"
}
variable "owner" {
	description = "Owner Email ID. i.e. devops@acko.tech"
}
variable "ELBScheme" { 
	description = "Loadbalancer scheme, public or internal"
}
variable "EnvironmentPropertiesMap" {
  description = "enviroment variable map (key value pair)"
}