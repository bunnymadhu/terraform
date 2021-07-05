resource "null_resource" "ansible-apply" {
  triggers =  {
    abc = timestamp()
  }
  count                                = length(var.COMPONENTS)
  provisioner "remote-exec" {

    connection {
      host                              = "${element(var.COMPONENTS, count.index)}.roboshop.internal"
      user                              = "centos"
      password                       = "DevOps321"
    }
      inline = [
        "sudo yum install ansible -y",
        "sudo yum remove ansible -y",
        "sudo rm -rf /usr/lib/python2.7/site-packages/ansible*",
        "sudo yum remove python-pip -y",
        "sudo cd /usr/local/src",
        "sudo wget https://bootrap.pypa.io/pip/2.7/get-pip.py",
        "sudo python get-pip.py",
        "sudo pip install ansible==3.4.0",
        "ansible-pull -i localhost, -U https://github.com/bunnymadhu/ansible.git roboshop-pull.yml -e COMPONENT=${element(var.COMPONENTS, count.index)}"
//         "sudo yum install ansible -y",
//         "sudo yum remove ansible -y",
//         "sudo rm -rf /usr/lib/python2.7/site-packages/ansible*",
//         "sudo pip install ansible==4.1.0",
//         "ansible-pull -i localhost, -U https://github.com/bunnymadhu/ansible.git roboshop-pull.yml  -e COMPONENT=${element(var.COMPONENTS, count.index)}"
      ]

  }
}

variable "COMPONENTS" {}


## here triggers will help to the re-run that particular Null_resource if that abc value changing  it will  re-apply once again...marking as change it so that it run evrytime...