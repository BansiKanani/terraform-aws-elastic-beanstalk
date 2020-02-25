resource "aws_elastic_beanstalk_application" "default" {
    name = var.app_name
    description = var.app_description
}

resource "aws_elastic_beanstalk_environment" "default" {
    name = var.app_name
    application = aws_elastic_beanstalk_application.default.name
    solution_stack_name = var.solution_stack_name
    wait_for_ready_timeout = var.wait_for_ready_timeout
    tags = {
        "app_name" = var.app_name
        "owner" = var.owner
    }

    dynamic "setting" {
        for_each = {
            "VPCId" = var.VPCId,
            "ELBSubnets" = join(",", var.ELBSubnets),
            "Subnets" = join(",", var.Subnets),
            "ELBScheme" = var.ELBScheme,
        }
        content {
            namespace = "aws:ec2:vpc"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "MeasureName" = var.MeasureName,
            "Unit" = var.Unit,
            "LowerThreshold" = var.LowerThreshold,
            "UpperThreshold" = var.UpperThreshold
        }
        content {
            namespace = "aws:autoscaling:trigger"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "LoadBalancerType" = var.LoadBalancerType
        }
        content {
            namespace = "aws:elasticbeanstalk:environment"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "SecurityGroups" = join(",", var.elb_SecurityGroups),
        }
        content {
            namespace = "aws:elbv2:loadbalancer"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            # "ImageId" = var.ImageId,
            "InstanceType" = var.InstanceType,
            "EC2KeyName" = var.EC2KeyName,
            "SecurityGroups" = join(",", var.ec2_SecurityGroups)
            "IamInstanceProfile" = var.IamInstanceProfile
        }
        content {
            namespace = "aws:autoscaling:launchconfiguration"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = {
            "MinSize" = var.MinSize,
            "MaxSize" = var.MaxSize,
        }
        content {
            namespace = "aws:autoscaling:asg"
            name = setting.key
            value = setting.value
        }
    }

    dynamic "setting" {
        for_each = var.EnvironmentPropertiesMap
        content {
            namespace = "aws:elasticbeanstalk:application:environment"
            name = setting.key
            value = setting.value
        }
    }
}