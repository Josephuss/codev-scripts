
resource "aws_instance" "codev-ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = local.subnet_id
  vpc_security_group_ids = [local.security_group_id]

  tags = {
    Name = "Terragrunt-EC2"
    Environment = "demo"
  }
}

resource "aws_ebs_volume" "codev-ebs-volume" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size

  tags = {
    Name = "demo-volume"
    Environment = "demo"
  }
}

resource "aws_volume_attachment" "codev-ebs-volume-attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.codev-ebs-volume.id
  instance_id = aws_instance.codev-ec2.id
  force_detach = true
}