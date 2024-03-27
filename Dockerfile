FROM arm64v8/ubuntu:latest

RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libuuid1 \
    uuid-dev \
    valgrind \
    libsfml-dev \
    libcsfml-dev \
  && rm -rf /var/lib/apt/lists/*

COPY coding-style.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/coding-style.sh

WORKDIR /app

CMD ["bash"]
