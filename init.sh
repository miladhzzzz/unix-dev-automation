#!/bin/bash

# Function to detect the operating system
detect_os() {
	if [[ "$OSTYPE" == "darwin"* ]]; then
		echo "mac"
	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		if [ -f "/etc/os-release" ]; then
			source /etc/os-release
			if [[ "$ID" == "ubuntu" ]]; then
				echo "ubuntu"
			elif [[ "$ID" == "kali" ]]; then
				echo "kali"
			fi
		fi
	fi
}

# Function to run the setup script based on the detected OS
run_setup() {
	os=$(detect_os)
	if [[ "$os" == "mac" ]]; then
		cd scripts
		chmod +x setup-mac.sh
		./setup-mac.sh
	elif [[ "$os" == "ubuntu" ]]; then
		cd scripts
		chmod +x setup-linux.sh
		./setup-linux.sh
	elif [[ "$os" == "kali" ]]; then
		chmod +x setup-kali.sh
		./setup-kali.sh
	else
		echo "Unsupported operating system."
		exit 1
	fi
}

# Function to deploy the infrastructure using Terraform
deploy_infrastructure() {
	cd terraform/virtualbox
	terraform init
	terraform plan
	terraform apply
}

# Function to run the Ansible playbooks
run_ansible_playbooks() {
	ansible-playbook -i .hosts.ini playbooks/nginx/playbook.yml
}

# Main script logic
if [[ "$1" == "setup" ]]; then
	run_setup
elif [[ "$1" == "deploy" ]]; then
	deploy_infrastructure
elif [[ "$1" == "ansible" ]]; then
	run_ansible_playbooks
else
	echo "Invalid argument. Usage: ./init.sh [setup|deploy|ansible]"
	exit 1
fi
