# Unix based setup automation

Welcome to the Unix-Based Setup Automation repository! This project offers a comprehensive suite of scripts and configurations designed to streamline the setup process for developers on Unix-based operating systems. Whether you're on macOS or Linux, our repository provides tools, configurations, and automation scripts to expedite environment configuration and deployment.

## setup (For Fresh Installs)

- first you need to clone this repo

````shell
git clone https://github.com/miladhzzzz/unix-dev-automation.git
````

- then use init.sh to automatically detect your OS and execute the write setup script!

````shell
chmod +x ./init.sh
./init.sh

# for setting up manually you can run the setup script for your OS (example):
cd /scripts
chmod +x ./setup-mac.sh 
./setup-mac.sh 
````

- **we also have some custom setup scripts for example you can run setup-kali.sh for a custom Graphical kali dev environment**

````shell
# this will install all the things required to setup a kali to my taste (you can install other setup files if you dont want this!)
chmod +x ./setup-kali.sh
./setup-kali.sh
````

### list of tools and packages

- we need the list here!

## Dotfiles

Enhance your development experience with our curated collection of minimal and unaltered configuration files, accessible in various platforms' directories. These dotfiles, along with our init.sh entrypoint script, facilitate seamless configuration of your tools.

## Labs: Accelerate Cloud-Native Development Skills

Experience the power of local development environments through our Labs feature. Leveraging Kind, Localstack, and Virtualbox, we provide a robust framework for running various projects and experiments, enabling you to hone your cloud-native development skills.

### Terraform (IAC) and Ansible (IAC)

Utilize Terraform scripts to provision Ubuntu VMs on Virtualbox, and then deploy Ansible playbooks to configure the provisioned machines efficiently. This approach ensures consistency and repeatability in setting up complex environments like Kubernetes clusters.

### Virtualbox and Localstack

With Virtualbox and Localstack integration, developers can emulate cloud environments locally, enabling rapid development and testing of cloud-native applications without incurring cloud costs. This setup provides an ideal sandbox for experimenting with various cloud services and architectures.

### Usage (infrastructure as code)

- after setting up your os you can use the terraform script to ubuntu images on virtualbox that we setted up earlier

````shell
cd /terraform/virtualbox
terraform init
terraform plan
terraform apply
````

using this commands you can create vms in virtual box and you can specify how many vm's you want in the /terrafor/virtualbox/main.tf file.

- now we can use our ansible playbooks to configure vm's that we ran earlier with terraform!

````shell
ansiple -i playbooks/ssh-nginx
````

you can use all the playbooks located in a directory with the same name to configure different labs basically! magical.

### K3s Cluster with Terraform and Ansible

Our project simplifies the setup of a k3s cluster using Terraform for infrastructure provisioning and Ansible for configuration management. By combining these technologies, developers can quickly spin up a Kubernetes cluster for testing, development, or learning purposes.

### automation (initialization script (entrypoint) )

Simplify your workflow with init.sh, a comprehensive initialization script capable of executing the entire project seamlessly. Use it to set up a freshly installed system or deploy infrastructure as code (IAC) to Virtualbox with ease.

Stay tuned for more automation features, including the implementation of GitOps to enhance project automation pipelines.

````shell
chmod +x init.sh
# for setting up a freshly installed system this will detect what unix base OS you're using and runs the setup script.
./init.sh setup

# for deploying our iac to virtualbox
./init.sh deploy 
````

## TODO

- gitops needs to be set up for the project automation pipeline!
