FROM arm64v8/ubuntu:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    cmake \
    git \
    valgrind \
    gdb \
    lldb \
    cppcheck \
    vim \
    libncurses5-dev \
    libncursesw5-dev \
    libsfml-dev \
    libcsfml-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-ttf-dev \
    libglm-dev \
    libglew-dev \
    freeglut3-dev \
    mesa-utils \
    xorg-dev \
    libx11-dev \
    libxrandr-dev \
    libxi-dev \
    uuid-dev \
    libssl-dev \
    python3 \
    python3-pip \
    nasm \
    sudo \
    curl \
    && curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh get-docker.sh \
  && pip3 install conan \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["bash"]
