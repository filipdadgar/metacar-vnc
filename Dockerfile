FROM ubuntu
MAINTAINER "filip@dadgar.se"

RUN apt-get update && apt-get clean && apt-get install -y \
    x11vnc \
    xvfb \
    fluxbox \
    wmctrl \
    wget

# Gym and wrappers

RUN apt-get -y update && apt-get -y install vim git wget python3-dev libopenmpi-dev python-pip python3-pip zlib1g-dev \
    cmake libglib2.0-0 libsm6 libxext6 libfontconfig1 libxrender1 chromium-chromedriver libglib2.0-0 libnss3 libgconf-2-4 \ 
    libfontconfig1 cmake libopenmpi-dev python3-dev zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN useradd ls \
    && mkdir -p /home/ls \
    && chown -v -R ls:ls /home/ls

ENV CODE_DIR /home/ls/code
ENV VENV /home/ls/venv

RUN \
    pip install virtualenv && \
    virtualenv $VENV --python=python3 && \
    . $VENV/bin/activate && \
    mkdir $CODE_DIR && \
    chown -v -R ls:ls /home/ls/venv && \
    cd $CODE_DIR && \
    pip3 install --upgrade pip && \
    pip3 install codacy-coverage && \
    pip3 install scipy && \
    pip3 install joblib && \
    pip3 install mpi4py && \
    pip3 install cloudpickle && \
    pip3 install tensorflow==1.8.0 && \
    pip3 install opencv-python && \
    pip3 install numpy && \
    pip3 install pandas && \
    pip3 install pytest && \
    pip3 install pytest-cov && \
    pip3 install pytest-env && \
    pip3 install pytest-xdist && \
    pip3 install matplotlib && \
    pip3 install gym[atari,classic_control]>=0.10.9 && \
    pip3 install gym && \
    pip3 install selenium && \ 
    pip3 install image && \
    pip3 install pillow && \
    pip3 install pygame && \
    pip3 install stable-baselines[mpi]


ENV PATH=$VENV/bin:$PATH

COPY /include/bootstrap.sh /home/ls/
WORKDIR /home/ls/
RUN git clone https://github.com/AI-Guru/gym-metacar.git && chown -v -R ls:ls /home/ls/gym-metacar
WORKDIR /home/ls/gym-metacar

CMD ["/bin/sh", "/home/ls/bootstrap.sh"]
