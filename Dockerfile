FROM ubuntu
MAINTAINER "filip@dadgar.se"

RUN apt-get update && apt-get clean && apt-get install -y \
    x11vnc \
    xvfb \
    fluxbox \
    wmctrl \
    wget

# Gym and wrappers

RUN apt-get -y update && apt-get -y install vim git wget python-dev python3-dev libopenmpi-dev python-pip zlib1g-dev cmake libglib2.0-0 libsm6 libxext6 libfontconfig1 libxrender1 chromium-chromedriver libglib2.0-0 libnss3 libgconf-2-4 libfontconfig1 cmake libopenmpi-dev python3-dev zlib1g-dev

RUN pip install gym selenium image pillow pygame


RUN useradd ls \
    && mkdir -p /home/ls \
    && chown -v -R ls:ls /home/ls

COPY /include/bootstrap.sh /home/ls/
RUN ls /home/ls/
WORKDIR /home/ls/
RUN git clone https://github.com/AI-Guru/gym-metacar.git
#RUN chmod +x bootstrap.sh

CMD ["/bin/sh", "bootstrap.sh"]