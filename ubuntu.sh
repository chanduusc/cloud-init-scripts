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