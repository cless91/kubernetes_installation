resource "aws_security_group" "public" {
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      "0.0.0.0/0"]
    ipv6_cidr_blocks = [
      "::/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      "0.0.0.0/0"]
    ipv6_cidr_blocks = [
      "::/0"]
  }

  tags = {
    Owner = "jmbimbi-bene"
    Name = "machineRebondSG"
  }
}

resource "aws_instance" "kube_master" {
  ami = "ami-013ae7c08b0ad5b2c"
  instance_type = var.size
  key_name = aws_key_pair.myKeys.key_name
  security_groups = [
    aws_security_group.public.name]
  tags = {
    Owner = "jmbimbi-bene"
    Name = "kube_master"
    Group = "kubernetes_test"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 1"]

    connection {
      host = self.public_ip
      user = "ubuntu"
      private_key = file("ssh/id_rsa")
    }
  }
}

resource "aws_instance" "kube_worker_1" {
  ami = "ami-013ae7c08b0ad5b2c"
  instance_type = var.size
  key_name = aws_key_pair.myKeys.key_name
  security_groups = [
    aws_security_group.public.name]
  tags = {
    Owner = "jmbimbi-bene"
    Name = "kube_worker_1"
    Group = "kubernetes_test"
    Group = "kube_workers"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 1"]

    connection {
      host = self.public_ip
      user = "ubuntu"
      private_key = file("ssh/id_rsa")
    }
  }
}

resource "aws_instance" "kube_worker_2" {
  ami = "ami-013ae7c08b0ad5b2c"
  instance_type = var.size
  key_name = aws_key_pair.myKeys.key_name
  security_groups = [
    aws_security_group.public.name]
  tags = {
    Owner = "jmbimbi-bene"
    Name = "kube_worker_2"
    Group = "kubernetes_test"
    Group = "kube_workers"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 1"]

    connection {
      host = self.public_ip
      user = "ubuntu"
      private_key = file("ssh/id_rsa")
    }
  }
}


variable "size" {
  type = string
  default = "t2.medium"
}