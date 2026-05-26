resource "aws_launch_template" "this" {
  count = module.this.enabled ? 1 : 0

  name          = module.this.id
  description   = var.description
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data_base64

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  monitoring {
    enabled = var.monitoring_enabled
  }

  dynamic "network_interfaces" {
    for_each = var.network_interface != null ? [var.network_interface] : []
    content {
      associate_public_ip_address = network_interfaces.value.associate_public_ip_address
      security_groups             = network_interfaces.value.security_groups
      delete_on_termination       = true
    }
  }

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile_name != null ? [1] : []
    content {
      name = var.iam_instance_profile_name
    }
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = var.root_volume_size
      volume_type           = var.root_volume_type
      encrypted             = true
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags          = merge(module.this.tags, { Name = module.this.id })
  }

  tags = module.this.tags
}
