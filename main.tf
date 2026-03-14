# 1. VPC (Networking) - Official AWS Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "trendstore-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    "kubernetes.io/cluster/trendstore-cluster" = "shared"
  }
}

# 2. Security Group for Jenkins Server
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  vpc_id      = module.vpc.vpc_id

  # Access for Management Tools (Restricted to your IP)
  dynamic "ingress" {
    for_each = [22, 3000, 9090]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.my_ip]
    }
  }

  # NodePort Range (Restricted to your IP)
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  # Publicly Accessible Ports (HTTP, Jenkins, Email)
  dynamic "ingress" {
    for_each = [80, 8080, 587, 5857]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. EC2 Instance for Jenkins
resource "aws_instance" "jenkins_server" {
  ami                    = "ami-0a14f53a6fe4dfcd1"
  instance_type          = "c7i-flex.large"
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = "mumbaikeypair"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true # Add this line!
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y fontconfig openjdk-21-jre docker.io unzip
              sudo systemctl start docker
              sudo usermod -aG docker ubuntu

              # Install Jenkins
              sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
              echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
              sudo apt-get update -y
              sudo apt-get install -y jenkins
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              sudo usermod -aG docker jenkins
              sudo chmod 666 /var/run/docker.sock
              sudo systemctl restart jenkins
              EOF

  tags = { Name = "Jenkins-Server" }
}

# 4. EKS Cluster (Upgraded to v20 for compatibility)
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "trendstore-cluster"
  cluster_version = "1.29"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  # Module v20 requires this for authentication to the cluster
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
      instance_types = ["c7i-flex.large"]
    }
  }

  tags = {
    Environment = "dev"
    Project     = "trendstore"
  }
}
