# A Dockerfile that sets up a full Gym install
FROM tensorflow/tensorflow:latest-gpu-py3

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
# RUN apt-get install console-common -y

# RUN L='us' && sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard

RUN apt-get install -y libav-tools \
    python-numpy \
    python-scipy \
    python-setuptools \
    libpq-dev \
    libjpeg-dev \
    curl \
    cmake \
    swig \
    freeglut3 \
    python-opengl \
    libboost-all-dev \
    libglu1-mesa \
    libglu1-mesa-dev \
    libsdl2-2.0-0\
    libgles2-mesa-dev \
    libsdl2-dev \
    wget \
    unzip \
    git \
    xserver-xorg-input-void \
    xserver-xorg-video-dummy \
    python-gtkglext1 \
    xpra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && easy_install pip

# WORKDIR /usr/local/gym

RUN pip install gym[all]
RUN /bin/bash -c "ln -sfn /usr/bin/python3 /usr/bin/python"
# RUN ln -sfn /usr/bin/python3 /usr/bin/python
# RUN alias python=python3

WORKDIR /root
# ENTRYPOINT ["/usr/local/gym/bin/docker_entrypoint"]
