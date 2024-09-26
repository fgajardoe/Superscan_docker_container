FROM ubuntu:focal-20240530
LABEL maintainer Felipe Gajardo <fgajardoe@gmail.com>


# Evitar la interacción durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Configurar la selección de la localización
RUN echo 'tzdata tzdata/Areas select America' | debconf-set-selections && \
    echo 'tzdata tzdata/Zones/America select Mexico_City' | debconf-set-selections


# Install software.
RUN apt-get update && \
    apt-get install -y \
     gcc \
     g++ \
     git \
     cmake \
     bedtools \
     vim \
     r-base \
     libcurl4-openssl-dev \
     libxml2-dev \
     python \
     python3 \
     libssl-dev \
     git \
     python3-pip


# Set user.
RUN useradd -ms /bin/bash user
RUN echo 'user:user' | chpasswd
USER user

RUN alias ll='ls -l'
RUN alias l='ls'
RUN alias xx='exit'

WORKDIR /home/user
RUN git clone https://github.com/cshasha/superscan && \
    cd superscan && \
    echo "numpy==1.23\npandas==1.1.1\nscanpy==1.6.0\nxgboost==1.2.1\njoblib==0.14.1\nscipy==1.5.2\ntabulate==0.8.7\nnumba==0.56.4\nscikit-learn==0.22\nseaborn==0.11.0\nsetuptools-scm==3.4.1\nmatplotlib<3.7" > requeriments.txt && \
    pip install -r requeriments.txt

RUN pip install hdf5plugin

CMD ["/bin/bash"]
