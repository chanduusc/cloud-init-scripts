#! /bin/bash
sudo apt-get update
sudo apt -y remove erlang-base-hipe erlang-crypto erlang-syntax-tools nginx apache2
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb 
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get -y install esl-erlang
sudo apt -y install zlib1g zlib1g-dev elixir build-essential curl git libssl-dev libz-dev unzip lighttpd
rm -rf /etc/lighttpd/lighttpd.conf
wget -O /etc/lighttpd/lighttpd.conf https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/lighttpd.conf
wget -O /etc/ssl/certs/rithvik.pem https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/rithvik.pem
sudo systemctl stop lighthttpd
sudo systemctl reload lighthttpd
sudo systemctl start lighthttpd

sudo git clone https://github.com/giltene/wrk2.git
cd wrk2
sudo make
sudo /bin/cp wrk /bin/
cd ..
su - ubuntu -c "wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/npm.sh"
su - ubuntu -c "chmod a+x npm.sh"
su - ubuntu -c "./npm.sh"
su - ubuntu -c "/home/ubuntu/stressgrid/coordinator/_build/prod/rel/coordinator/bin/coordinator start"
su - ubuntu -c "/home/ubuntu/stressgrid/generator/_build/prod/rel/generator/bin/generator start"