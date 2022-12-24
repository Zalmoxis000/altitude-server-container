FROM debian:bullseye-slim

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends --allow-unauthenticated curl ca-certificates lbzip2 unzip sudo \
  && curl https://nimblygames-installers.s3.amazonaws.com/altitude.tar.bz2 > /tmp/altitude.tar.bz2 \
  && mkdir -p /usr/local/altitude \
  && tar -C /usr/local/altitude -xvf /tmp/altitude.tar.bz2 \
  && rm /tmp/altitude.tar.bz2
#  && bash /usr/local/altitude/google-cloud-sdk/install.sh --quiet	

ADD maps_ball4.zip /tmp/maps_ball4.zip

RUN unzip /tmp/maps_ball4.zip -d /usr/local/altitude/lib/app/maps/
# /usr/local/altitude/lib/app/maps/

WORKDIR /usr/local/altitude/bin

ADD my_config.xml .
ADD run_alti_server.sh .
RUN chmod +x run_alti_server.sh

EXPOSE 27275/udp
EXPOSE 27277/udp
# ENTRYPOINT [/bin/bash]