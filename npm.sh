#! /bin/bash
/usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | /bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 8.12.0
nvm use 8.12.0
git clone https://gitlab.com/stressgrid/stressgrid.git
cd stressgrid/coordinator/management/
npm install && npm run build-css && npm run build
cd ..