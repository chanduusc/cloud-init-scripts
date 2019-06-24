#! /bin/bash
sudo apt-get update
sudo apt -y remove erlang-base-hipe erlang-crypto erlang-syntax-tools nginx apache2
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb 
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get -y install esl-erlang
sudo apt -y install zlib1g zlib1g-dev elixir build-essential curl git libssl-dev libz-dev unzip lighttpd
sudo rm -rf /etc/lighttpd/lighttpd.conf
sudo wget -O /etc/lighttpd/lighttpd.conf https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/lighttpd.conf
sudo wget -O /var/www/html/64k.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/64k.html
sudo wget -O /var/www/html/4k.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/4k.html
sudo wget -O /var/www/html/1b.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/1b.html
sudo wget -O /var/www/html/bench.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/bench.html
sudo systemctl stop lighthttpd
sudo systemctl reload lighthttpd
sudo systemctl start lighthttpd
sudo git clone https://github.com/giltene/wrk2.git
cd wrk2
sudo make
sudo /bin/cp wrk /bin/
cd ..
su - panadmin -c "wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/npm.sh"
su - panadmin -c "chmod a+x npm.sh"
su - panadmin -c "./npm.sh"
su - panadmin -c "/home/panadmin/stressgrid/coordinator/_build/prod/rel/coordinator/bin/coordinator start"
su - panadmin -c "/home/panadmin/stressgrid/generator/_build/prod/rel/generator/bin/generator start"