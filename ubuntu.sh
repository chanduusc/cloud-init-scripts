#! /bin/bash
sudo apt-get update
sudo apt -y remove erlang-base-hipe erlang-crypto erlang-syntax-tools
sudo wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
sudo dpkg -i erlang-solutions_2.0_all.deb
sudo wget https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
sudo apt-key add erlang_solutions.asc
sudo apt-get update
sudo apt-get -y install esl-erlang
wget -O /etc/sysctl.d/10-dummy.conf https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/10-dummy.conf
/sbin/sysctl -p
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
sudo /bin/cp wrk2 /bin
cd ..
/usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | /bin/bash
source ~/.profile
nvm install 8.12.0
nvm use 8.12.0
git clone https://gitlab.com/stressgrid/stressgrid.git
cd stressgrid 
cd coordinator/management/
npm install && npm run build-css && npm run build
cd ..
yes |MIX_ENV=prod mix deps.get
yes |MIX_ENV=prod mix release
cd ..
cd generator/
yes |MIX_ENV=prod mix deps.get
yes |MIX_ENV=prod mix release
cd ..
coordinator/_build/prod/rel/coordinator/bin/coordinator start
generator/_build/prod/rel/generator/bin/generator start