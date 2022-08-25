FROM node:16.17-buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -yqq \
apt-utils \
unzip \
tar \
wget \
clinfo \
opencl-headers \
ocl-icd-libopencl1 \
ocl-icd-opencl-dev \
xz-utils

# Source https://linuxhandbook.com/setup-opencl-linux-docker/

# NVidia drivers
RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

# NWS + Hive
RUN mkdir app

RUN wget -q -O app/nws https://github.com/nanocurrency/nano-work-server/releases/download/V0.3.0/nano-work-server && \
chmod +x app/nws

RUN npm i -g nullpilot/hive-cli

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
