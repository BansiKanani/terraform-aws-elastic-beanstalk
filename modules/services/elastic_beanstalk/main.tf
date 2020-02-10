resource "aws_elastic_beanstalk_application" "default" {
    name = var.app_name
    description = var.app_description
}
resource "aws_elastic_beanstalk_application_version" "default" {
    name = var.app_name
    application = aws_elastic_beanstalk_application.default.name
    description = var.app_description
    bucket = var.bucket_id
    key = var.object_id
}
resource "aws_elastic_beanstalk_environment" "default" {
    name = var.app_name
    application = aws_elastic_beanstalk_application.default.name
    solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.5 running Python 3.6"
    wait_for_ready_timeout = var.wait_for_ready_timeout

    dynamic "setting" {
        for_each = {
            "VPCId" = var.vpc_id,
            "ELBSubnets" = join(",", var.elb_subnets_ids),
            "Subnets" = join(",", var.subnets_ids),
        }
        content {
            namespace = "aws:ec2:vpc"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "MeasureName" = var.autoscale_MeasureName,
            "Unit" = var.autoscale_Unit,
            "LowerThreshold" = var.autoscale_LowerThreshold,
            "UpperThreshold" = var.autoscale_UpperThreshold
        }
        content {
            namespace = "aws:autoscaling:trigger"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "LoadBalancerType" = var.loadbalancer_type
        }
        content {
            namespace = "aws:elasticbeanstalk:environment"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "SecurityGroups" = join(",", var.SecurityGroupIds)
        }
        content {
            namespace = "aws:elbv2:loadbalancer"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            # "ImageId" = var.ami,
            "InstanceType" = var.instance_type,
            "EC2KeyName" = var.EC2KeyName,
            "SecurityGroups" = join(",", var.SecurityGroupIds)
        }
        content {
            namespace = "aws:autoscaling:launchconfiguration"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "MinSize" = var.autoscale_min,
            "MaxSize" = var.autoscale_max
        }
        content {
            namespace = "aws:autoscaling:asg"
            name = setting.key
            value = setting.value
        }
    }




}