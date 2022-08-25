FROM node:16.17-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -yqq \
wget \
ocl-icd-opencl-dev \
gcc

RUN mkdir app

RUN wget -q -O app/nws https://github.com/nanocurrency/nano-work-server/releases/download/V0.3.0/nano-work-server && \
chmod +x app/nws

RUN npm i -g nullpilot/hive-cli
