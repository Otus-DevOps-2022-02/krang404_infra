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
tesapp_port = 9292

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
