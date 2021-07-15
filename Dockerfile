FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    make \
    git \
    cmake \
    clang

RUN apt-get update

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone https://github.com/LASzip/LASzip.git \
    && cd LASzip \
    && git checkout tags/3.1.0 \
    && cmake . \
    && make \
    && make install

COPY . /app
WORKDIR /app
RUN cargo build --verbose
