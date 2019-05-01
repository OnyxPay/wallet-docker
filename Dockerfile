FROM ubuntu:18.04
MAINTAINER toktor <ak.toktor@gmail.com>

RUN apt-get install -y curl && \
apt update && apt install nodejs npm && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
apt update && apt install yarn

RUN git clone https://github.com/OnyxPay/OnyxChain-wallet.git && \
cd OnyxChain-wallet; yarn install; npm run build

RUN npm install forever -g ; npm install http-server -g
