FROM debian:bullseye-slim

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends --allow-unauthenticated curl ca-certificates lbzip2 \
  && curl https://nimblygames-installers.s3.amazonaws.com/altitude.tar.bz2 > /tmp/altitude.tar.bz2 \
  && mkdir -p /usr/local/altitude \
  && tar -C /usr/local/altitude -xvf /tmp/altitude.tar.bz2 
#  && bash /usr/local/altitude/google-cloud-sdk/install.sh --quiet	

WORKDIR /usr/local/altitude/bin
# ENTRYPOINT [/bin/bash]