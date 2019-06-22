#! /bin/bash
sudo apt-get update
sudo apt -y remove erlang-base-hipe erlang-crypto erlang-syntax-tools
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb 
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get -y install esl-erlang
sudo apt -y install zlib1g zlib1g-dev elixir build-essential curl git libssl-dev libz-dev unzip
sudo git clone https://github.com/giltene/wrk2.git
cd wrk2
sudo make
sudo /bin/cp wrk /bin/
cd ..
su - panadmin -c "wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/npm.sh"
su - panadmin -c "chmod a+x npm.sh"
su - panadmin -c "./npm.sh"
su - panadmin -c "cd /home/panadmin/stressgrid/coordinator/;yes |MIX_ENV=prod mix deps.get"
su - panadmin -c "cd /home/panadmin/stressgrid/coordinator/;yes |MIX_ENV=prod mix release"
su - panadmin -c "cd /home/panadmin/stressgrid/generator/;yes |MIX_ENV=prod mix deps.get"
su - panadmin -c "cd /home/panadmin/stressgrid/coordinator/;yes |MIX_ENV=prod mix release"
su - panadmin -c "/home/panadmin/stressgrid/coordinator/_build/prod/rel/coordinator/bin/coordinator start"
su - panadmin -c "/home/panadmin/stressgrid/generator/_build/prod/rel/generator/bin/generator start"