
#!/bin/bash
set -eux
export APP_DIR=${HOME}/reddit
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR
cd $APP_DIR
bundle install
sudo mv /tmp/puma.env $APP_DIR/puma.env
cat /tmp/puma.service.tmpl | envsubst | sudo tee /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
