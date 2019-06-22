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
su - panadmin -c "wget https://gist.githubusercontent.com/chanduusc/456068338371cc870ac72939e18c8300/raw/b4de3d6db0e6fef9818c15af8e8f1d5d73de0372/npm.sh"
su - panadmin -c "chmod a+x npm.sh"
su - panadmin -c "./npm.sh"
su - panadmin -c "cd /home/panadmin/stressgrid/coordinator/;yes |MIX_ENV=prod mix deps.get;yes |MIX_ENV=prod mix release"
su - panadmin -c "cd /home/panadmin/stressgrid/generator/;yes |MIX_ENV=prod mix deps.get;yes |MIX_ENV=prod mix release"
su - panadmin -c "/home/panadmin/stressgrid/coordinator/_build/prod/rel/coordinator/bin/coordinator start"
su - panadmin -c "/home/panadmin/stressgrid/generator/_build/prod/rel/generator/bin/generator start"