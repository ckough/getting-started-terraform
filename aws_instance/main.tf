# Write Everything Twice
resource "aws_vpc" "demo" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "DemoVpc"
    Project     = "getting-started-terraform"
    Owner       = "Mark Carriedo"
    Environment = var.environment
  }
}

resource "aws_subnet" "demo" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name        = "DemoSubnet1"
    Project     = "getting-started-terraform"
    Owner       = "Mark Carriedo"
    Environment = var.environment
  }
}

resource "aws_instance" "demo_server1" {
  ami           = "ami-036c62d1245305f42"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.demo.id

  # root_block_device {
  #   encrypted = true
  # }

  # metadata_options {
  #   http_tokens = "required"
  # }

  tags = {
    Name        = "DemoServer1"
    Project     = "getting-started-terraform"
    Owner       = "Mark Carriedo"
    Environment = var.environment
  }
}

# Don't Repeat Yourself
resource "aws_instance" "demo_server2" {
  ami           = local.linux_ami.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.demo.id

  # root_block_device {
  #   encrypted = true
  # }

  # metadata_options {
  #   http_tokens = "required"
  # }

  tags = merge(
    local.tags,
    {
      Name = "DemoServer2"
    }
  )
}

resource "aws_instance" "prod_servers" {
  count = var.environment == "prod" ? 3 : 0

  ami           = local.linux_ami.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.demo.id

  # root_block_device {
  #   encrypted = true
  # }

  # metadata_options {
  #   http_tokens = "required"
  # }

  tags = merge(
    local.tags,
    {
      Name = "ProdServer${count.index + 1}" # start with 1
    }
  )
}