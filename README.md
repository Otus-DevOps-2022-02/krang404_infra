[![Run tests for OTUS homework](https://github.com/Otus-DevOps-2022-02/krang404_infra/actions/workflows/run-tests-2022-02.yml/badge.svg)](https://github.com/Otus-DevOps-2022-02/krang404_infra/actions/workflows/run-tests-2022-02.yml)

# krang404_infra
krang404 Infra repository

################################################################
# Home Work № 3
################################################################


# Bastion Host
Bastion Host External IP is $bastionip
ProxyJump User is 'appuser'
Connection package is OpenSSH by public key

#Internl Host
Intenal Host IP is $internalhostip
SSH user is 'appuser'
Connection package is OpenSSH by public key

#SSH Client config

In '~/.ssh' make file 'config'.

Config file:

Host bastion
        HostName $bastionip
        User appuser
        IdentityFile ~/.ssh/appuser
Host someinternalhost
        HostName $internalhostip
        User appuser
        ProxyCommand ssh appuser@bastion nc %h %p

#Command for connection to Intenal Host via Bastionhost

ssh -J bastion someinternalhost

#Command for connection to Internal Host with alias

ssh someinternalhost

#SSL-cert for Web-Console Pritunl server

SSL certificate auto make in Web-Console in Settings. In field 'Lets Encrypt Domian' type '0-0-0-0.sslip.io' where '0-0-0-0' is
your bastion IP with dash replaced dot. And adress to web after that 'https://0-0-0-0.sslip.io'

#IP for bastionhost and someinternalhost

bastion_IP = 178.154.222.118

someinternalhost_IP = 10.128.0.23

testapp_IP = 51.250.72.207

testapp_port = 9292

################################
# Home Work № 4
################################

Scripts for deployment applications puma. Run in VM after provisioning in Yandex Cloud.

1. File 'install_ruby.sh'
2. File 'install_mongodb.sh'
3. File 'deploy.sh'

Startup script is 'startup_script.sh'.

Command for Yandex CLI. Run in commandline.

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=metadata.yaml \
  --metadata serial-port-enable=1 \

File 'metadata.yaml' is cloud-config for cloud-init.

################################
# Home Work № 5
################################

Create image with Packer for Yandex Cloud in Fry and Bake strategy.

1. In packer/ubuntu.json - Fry image
2. In packer/immutable.json - Bake image

################################
# Home Work № 6
################################

Create VM with Terraform. File 'main.tf' has description of VM in Yandex Cloud. Count of VM's has contained in 'var.instance_count' Folder '/files' is place of scipts for provisioning VM. File 'lb.tf' creates a network load balancer for target group of VM's.

################################
# Home Work № 7
################################

Create 2 modules for provisioning virtual machines 'app' and 'db'. Create 2 environments for provisioning (stage and prod).
Module 'db' creates VM that contened database MongoDB. Because MongoDB is running on localhost (127.0.0.1), in provisioning section of the resource "db" make thread editing config file in '/etc/mongod.conf'. For module 'app' make depends of module 'db' through output variable 'internal_ip_address_db' in 'main.tf' of root level.

################################
# Home Work № 8
################################

In this homework Ansible was install on local machine. Folder 'ansible' contains all config files for working with inventory. Inventory has performed in YAML and JSON format. Moreover, python-script 'dinventuse.py' works as dinamic inventory.

################################
# Home Work № 9
################################

In this homework was create playbooks for install MongoDB and deploy Monolith app in 3 variants:

1. reddit_app_one_play.yml - is all scenario in one play
2. reddit_app_multiple_play.yml - is scenario in multiple play
3. site.yml is include 3 playbooks.

Moreover in ansible config was including dinamic inventory module 'yc_compute'. That works localy in directory 'ansible'. Also packer image was recreating with playbooks 'packer_app.yml' and 'packer_db.yml'.

################################
# Home Work № 10
################################

In this homework was creating roles for install MongoDB and application Monolith. Moreover was installing role with ansible-galaxy.
In addition in this homework was writing playbook for create users in servers 'db' and 'app'. Sensetive data is protected by 'ansible-vault'.
Also in this README.md was added badge of passed tests.

################################
# Home Work № 11
################################

In this homework was creating local environment for testing infrastructure: install Vagrant and Virtualbox, make Vagrantfile for provisioning VM`s with Ansible. Also was changing roles 'app' and 'db'. For locally testing was creating virtual environment in witch installed Ansible, Molecule and Testinfra. Test for Testinfra placed in 'roles/db/molecule/tests/test_default.py'. Renewal roles was added to provisioning scenarios for Packer.
