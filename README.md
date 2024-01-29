# Unix based setup automation

## setup (For Fresh Installs)

- first you need to clone this repo

````shell
git clone https://github.com/miladhzzzz/unix-dev-automation.git
````

- then use different scripts located at /scripts directory to setup your environment

````shell
# for example you can use mac.sh from scripts directory
cd /scripts
chmod +x ./setup-mac.sh 
./mac.sh 
# for setting up linux you should do the same steps replace setup-mac.sh with setup-linux.sh
# we also use kali linux so 
````

- **we also have some custom setup scripts for example you can run setup-kali.sh for a custom Graphical kali dev environment**

````shell
# this will install all the things required to setup a kali to my taste (you can install other setup files if you dont want this!)
chmod +x ./setup-kali.sh
./setup-kali.sh
````

## Dotfiles

we have gathered some minimal and unchanged config files for various platforms that you can also pull from this repo and configure your tools with our entrypoint init.sh!

## infrastructure as code

in this repo we are setting up everything needed for a local dev environment in different Operating Systems including Linux/Mac (No WINDOWS!!) using a combination of Kind , Localstack , Virtualbox to run labs easily!

### terraform

- after setting up your os you can use the terraform script to ubuntu images on virtualbox that we setted up earlier

````shell
cd /terraform/virtualbox
terraform init
terraform plan
terraform apply
````

using this commands you can create vms in virtual box and you can specify how many vm's you want in the /terrafor/virtualbox/main.tf file.

### ansible

- now we can use our ansible playbooks to configure vm's that we ran earlier with terraform!

````shell
ansiple -i playbooks/ssh-nginx
````

you can use all the playbooks located in a directory with the same name to configure different labs basically! magical.

### automation (initialization script (entrypoint) )

- we prepared init.sh to ease your life you can pass it arguments to run the whole project

````shell
chmod +x init.sh
# for setting up a freshly installed system
./init.sh setup

# for deploying our iac to virtualbox
./init.sh deploy 

# and there will be more soon!
````

## TODO

- gitops needs to be set up for the project automation pipeline!
