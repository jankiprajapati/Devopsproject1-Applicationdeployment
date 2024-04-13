resource "aws_instance" "master"{
 tags = merge (
      {
          Name = "master-server"
      },
      var.tags
  )
 ami                            = var.ami
 instance_type                  = var.insttype
 key_name                       = "mykey"
 subnet_id                      = aws_subnet.public-1[0].id
 associate_public_ip_address    = true
 security_groups                = [aws_security_group.master_sg.id]
 user_data = <<-EOF
                     #!/bin/bash
                     sudo apt-get update -y
                     sudo apt-get install software-properties-common -y       
                     sudo apt-add-repository --yes --update ppa:ansible/ansible
                     sudo apt-get install ansible -y
                     sudo su -
                     hostnamectl set-hostname master
                EOF

}

resource "aws_instance" "node"{
 tags = merge (
      {
          Name = "node-server-${count.index}"
      },
      var.tags
  )
 count                          = 2
 ami                            = var.ami
 instance_type                  = var.insttype
 key_name                       = "mykey"
 subnet_id                      = aws_subnet.public-2[0].id
 associate_public_ip_address    = true
 security_groups                = [aws_security_group.nodes_sg.id]
}
