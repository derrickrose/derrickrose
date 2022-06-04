module "shared_vars" {
  source = "../shared_vars"
}

module "network" {
  source = "../network"
}

resource "aws_lb" "load_balancer" {
  depends_on         = [module.network]
  name               = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.network.public_sg_id]
  #  subnets            = [for subnet in aws_subnet.public : subnet.id]
  subnets            = [module.shared_vars.public_subnet_id_a, module.shared_vars.public_subnet_id_b]


  enable_deletion_protection = false

  tags = {
    Environment = module.shared_vars.env
  }
}

resource "aws_lb_target_group" "target_group_http" {
  name     = "${module.shared_vars.env}-${module.shared_vars.domain}-${module.shared_vars.project}-lb-tg-http"
  port     = 80
  protocol = "HTTP"
  #  target_type = "ip"
  vpc_id   = module.shared_vars.vpc_id
  health_check {
    path                = "/icons/apache_pb2.gif"
    interval            = 30
    timeout             = 15
    healthy_threshold   = 2
    unhealthy_threshold = 10
  }
}

resource "aws_lb_listener" "lb_listener_http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  # we don't use it since we are using only http
  #  ssl_policy        = "ELBSecurityPolicy-2016-08"
  #  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_http.arn
  }
}

output "private_sg_id" {
  value = module.network.private_sg_id
}

output "target_group_arn" {
  value = aws_lb_target_group.target_group_http.arn
}