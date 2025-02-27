resource "aws_instance" "web" {
  ami                    = "ami-066333d9c572b0680"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0785ae796b2761b5a"]
  key_name               = "Krish"


connection {
  host        = self.public_ip
  user        = "ec2-user"
  type        = "ssh"
  private_key = file("Krish.pem")
}

provisioner "file" {
  source      = "Krish.pem"
  destination = "/home/ec2-user/Krish.pem"
}

provisioner "remote-exec" {
  inline = [
    "chmod 400 /home/ec2-user/Krish.pem",
    "sudo amazon-linux-extras install java-openjdk11 -y",
    "sudo yum install java-1.8.0-openjdk -y",
  ]
}

provisioner "local-exec" {
  command = "echo ${self.public_ip} > hosts"

}


tags = {
  Name = "HelloWorld"
}


}
