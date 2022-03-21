# krang404_infra
krang404 Infra repository

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
someinternalhosp_IP = 10.128.0.23
