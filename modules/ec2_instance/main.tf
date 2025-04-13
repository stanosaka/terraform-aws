data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # AWS Account for Canonical, makers of Ubuntu.
  owners = ["099720109477"]
}

resource "aws_instance" "hello_world" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  subnet_id     = var.subnet_id
  instance_type = var.instance_type

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-{count.index}"
  })
}
