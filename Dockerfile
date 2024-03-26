FROM arm64v8/ubuntu:latest

RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libuuid1 \
    uuid-dev \
    valgrind \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["bash"]
