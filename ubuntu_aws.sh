#! /bin/bash
sudo apt-get update
sudo wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
sudo dpkg -i erlang-solutions_2.0_all.deb
sudo wget https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
sudo apt-key add erlang_solutions.asc
sudo apt-get update
sudo wget -O /etc/sysctl.d/10-dummy.conf https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/10-dummy.conf
sudo /sbin/sysctl -p
sudo wget -O /etc/ssl/certs/lighttpd.pem https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/lighttpd.pem
sudo apt-get update
sudo apt-get -y install esl-erlang
sudo apt -y install zlib1g zlib1g-dev elixir build-essential curl git libssl-dev libz-dev unzip lighttpd
sudo rm -rf /etc/lighttpd/lighttpd.conf
sudo wget -O /etc/lighttpd/lighttpd.conf https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/lighttpd.conf
sudo wget -O /var/www/html/64k.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/64k.html
sudo wget -O /var/www/html/4k.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/4k.html
sudo wget -O /var/www/html/1b.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/1b.html
sudo wget -O /var/www/html/bench.html https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/bench.html
sudo systemctl stop lighttpd
sudo systemctl reload lighttpd
sudo systemctl start lighttpd
sudo git clone https://github.com/giltene/wrk2.git
cd wrk2
sudo make
sudo /bin/cp wrk /bin/
cd ..
su - ubuntu -c "wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/npm.sh"
su - ubuntu -c "chmod a+x npm.sh"
su - ubuntu -c "./npm.sh"
su - ubuntu -c "/home/ubuntu/stressgrid/coordinator/_build/prod/rel/coordinator/bin/coordinator daemon"
su - ubuntu -c "/home/ubuntu/stressgrid/generator/_build/prod/rel/generator/bin/generator daemon"