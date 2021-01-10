FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt install -y git sudo cmake g++ libboost-dev libboost-serialization-dev libboost-iostreams-dev llvm-11-dev libfmt-dev zlib1g-dev


RUN useradd -m tomoya-s
RUN gpasswd -a tomoya-s sudo

USER tomoya-s
WORKDIR /home/tomoya-s
RUN git clone -b release-6.0 https://github.com/IntelligentSoftwareSystems/Galois.git
RUN mkdir /home/tomoya-s/Galois/build
WORKDIR /home/tomoya-s/Galois/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN make -j 4




