## BUILDING
##   (from project root directory)
##   $ docker build -t node-js-for-gsalgado-btcd .
##
## RUNNING
##   $ docker run -p 3000:3000 node-js-for-gsalgado-btcd
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r7

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="aap9d7z" \
    STACKSMITH_STACK_NAME="Node.js for gsalgado/btcd" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libssl1.0.0 libncurses5 libtinfo5 zlib1g libbz2-1.0 libreadline6 libstdc++6 libgcc1 ghostscript imagemagick libmysqlclient18

RUN bitnami-pkg install node-7.3.0-0 --checksum 8eef9136355717b6718f36f2c34573c8a96fc2019ed8ba343a8cc65d327d3494

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Node base template
COPY . /app
WORKDIR /app

RUN npm install

CMD ["node"]
