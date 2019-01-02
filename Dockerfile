FROM opensuse/leap:15
LABEL maintainer="Vicente Zepeda <chente.z.m@gmail.com>"
RUN zypper in -y tar xz && \
    zypper clean --all
ENV version=v10.15.0 \
    distro=linux-x64
ENV NODEJS_HOME=/usr/local/lib/nodejs/node-${version}/bin
ENV PATH=$NODEJS_HOME:${PATH}
ADD https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.xz /tmp/nodejs/node-${version}-${distro}.tar.xz
WORKDIR /tmp/nodejs
RUN mkdir -p /usr/local/lib/nodejs && \
    mkdir /code && \
    tar -xvf "node-${version}-${distro}.tar.xz" -C /usr/local/lib/nodejs/ &&\
    mv /usr/local/lib/nodejs/node-$version-$distro /usr/local/lib/nodejs/node-$version && \
    rm -rf /tmp/nodejs
# Install Angular
RUN useradd -m node && \
    groupadd node && \
    usermod -a -G node node && \
    chown node:node -R /usr/local/lib/nodejs && \
    chown node:node -R /code
USER node
RUN npm install -g @angular/cli
WORKDIR /code