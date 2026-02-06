# # Create EC2 instance
resource "aws_instance" "catalogue" {                               #sess-42
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    subnet_id = local.private_subnet_id
    
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-catalogue" # roboshop-dev-mongodb
        }
    )
}

# # Connect to instance using remote-exec provisioner through terraform_data or null same 
resource "terraform_data" "catalogue" {                               #sess-42
  triggers_replace = [   # it works when above cata instance id was changed 
    aws_instance.catalogue.id
  ]
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip
  }

  # terraform copies this file to catalogue server
  provisioner "file" {
    source = "catalogue.sh"
    destination = "/tmp/catalogue.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/catalogue.sh",
        # "sudo sh /tmp/catalogue.sh"
        "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"
    ]
  }
}

# stop the instance to take image
resource "aws_ec2_instance_state" "catalogue" {                           #sess-42
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.catalogue] # see above block
}

# taking AMI from instance 
resource "aws_ami_from_instance" "catalogue" {                     #sess-42
  name               = "${local.common_name_suffix}-catalogue-ami"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [aws_ec2_instance_state.catalogue] # see above block 
  tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-catalogue-ami" # roboshop-dev-mongodb
        }
  )
}

# TG is done 
resource "aws_lb_target_group" "catalogue" {            # sess-43
  name     = "${local.common_name_suffix}-catalogue"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = local.vpc_id
  deregistration_delay = 60 # waiting period before deleting the instance

  health_check { # these are IMP
    healthy_threshold = 2   # fast response
    interval = 10           # how much frequent
    matcher = "200-299"      # success codes checks
    path = "/health"         # health check path
    port = 8080              # for DB ni refer chestundhi so we need 8080
    protocol = "HTTP"        # 
    timeout = 2             # 
    unhealthy_threshold = 2    # 
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
# for lUNCH TEMPLATE is done                              # sess-43
resource "aws_launch_template" "catalogue" {
  name = "${local.common_name_suffix}-catalogue"
  image_id = aws_ami_from_instance.catalogue.id

  instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t3.micro"

  vpc_security_group_ids = [local.catalogue_sg_id]

  # when we run terraform apply again, a new version will be created with new AMI ID
  update_default_version = true            # sess-45

  # tags attached to the instance
  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name_suffix}-catalogue"
      }
    )
  }

  # tags attached to the volume created by instance
  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name_suffix}-catalogue"
      }
    )
  }

  # tags attached to the launch template
  tags = merge(
      local.common_tags,
      {
        Name = "${local.common_name_suffix}-catalogue"
      }
  )

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
# ASG ONLY # ASG like as HR 
resource "aws_autoscaling_group" "catalogue" {                       # sess-43
  name                      = "${local.common_name_suffix}-catalogue"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 100
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = false # not required by defalut vundhi in syntax
  launch_template {
    id      = aws_launch_template.catalogue.id
    version = aws_launch_template.catalogue.latest_version
  }
  vpc_zone_identifier       = local.private_subnet_ids  # comes from local lo pvt ids
  target_group_arns = [aws_lb_target_group.catalogue.arn]

# ASG Refresh or Rolling update 
  instance_refresh {             # sess-45
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50 # atleast 50% of the instances should be up and running
    }
    triggers = ["launch_template"]
  }
  
  dynamic "tag" {  # we will get the iterator with name as tag    sess-43-24:00 min 
    for_each = merge(
      local.common_tags,
      {
        Name = "${local.common_name_suffix}-catalogue"
      }
    )
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  timeouts {
    delete = "15m"  # within 15 min lo lunch cheyali ortherwise we will get timeout error
  }

}

# ASG POLICY like as HR 
resource "aws_autoscaling_policy" "catalogue" {            # sess-43
  autoscaling_group_name = aws_autoscaling_group.catalogue.name 
  name                   = "${local.common_name_suffix}-catalogue"
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 75.0
  }
}

# ALB-RULE

resource "aws_lb_listener_rule" "catalogue" {              # sess-43
  listener_arn = local.backend_alb_listener_arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.catalogue.arn 
  }

  condition {
    host_header {
      values = ["catalogue.backend-alb-${var.environment}.${var.domain_name}"] # ila hit chste 
    }  # ila hit chste above vunna TG ki request vellali 
  }
}

resource "terraform_data" "catalogue_local" {           #sess-43
  triggers_replace = [
    aws_instance.catalogue.id
  ]
  
  depends_on = [aws_autoscaling_policy.catalogue]
  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${aws_instance.catalogue.id}"
  }
}