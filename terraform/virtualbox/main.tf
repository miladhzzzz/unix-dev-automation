terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "node" {
  count     = 2
  name      = format("node-%02d", count.index + 1)
  # image     = "https://vagrantcloud.com/ubuntu/boxes/xenial64/versions/20180420.0.0/providers/virtualbox.box"
  image       = "virtualbox.box"
  cpus      = 1
  memory    = "512 mib"

# configuring the sshd_config file

 user_data = <<-EOF
    #!/bin/bash

    # Modify sshd_config
    sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

    # Restart SSH service
    sudo systemctl restart sshd
  EOF

  network_adapter {
    type           = "bridged"
    host_interface = "eth0" #this is the linux configuration
    #host_interface = "en0" this is the macos configuration
  }
}

# writing the ip address of the machines created to ansible hosts.ini file located at root of project dir
resource "null_resource" "write_hosts" {
  count = length(virtualbox_vm.node)

  provisioner "local-exec" {
    command = "echo '${element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, count.index)}' >> ../../hosts.ini"
  }
}

