#! /bin/bash
wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/64k.exs
wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/4k.exs
wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/1b.exs
wget https://raw.githubusercontent.com/chanduusc/cloud-init-scripts/master/udp_1400.exs
/usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | /bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 8.12.0
nvm use 8.12.0
git clone https://gitlab.com/stressgrid/stressgrid.git
cd stressgrid/coordinator/management/
npm install && npm run build-css && npm run build
cd ..
printf 'yes\n' |MIX_ENV=prod mix deps.get
printf 'yes\n' |MIX_ENV=prod mix release
cd ../generator
printf 'yes\n' |MIX_ENV=prod mix deps.get
printf 'yes\n' |MIX_ENV=prod mix release
cd ../client
npm install && npm run build && npm link
cd 
git clone https://gitlab.com/stressgrid/udp_server.git
cd udp_server
/usr/bin/gcc -pthread -o udp_server udp_server.c
/usr/bin/nohup ./udp_server &