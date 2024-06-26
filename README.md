# Conteneur Docker Epitech

Ce README explique la configuration et l'utilisation d'un conteneur Docker basé sur l'image `arm64v8/ubuntu:latest`, spécialement préparé pour le développement en C/C++ d'Epitech. Ce conteneur inclut les outils essentiels tels que GCC, Make, ainsi que des bibliothèques et des outils de débogage comme Valgrind.

## Prérequis

- Docker installé sur votre machine. Si vous n'avez pas encore Docker, suivez les instructions sur [le site officiel de Docker](https://docs.docker.com/get-docker/) pour l'installer sur votre système d'exploitation.
- Un ordinateur avec une architecture ARM64, compatible avec l'image `arm64v8/ubuntu:latest`.

## Configuration du Dockerfile

Le `Dockerfile` suivant est utilisé pour créer l'image Docker :

```dockerfile
FROM arm64v8/ubuntu:latest

# Install common development tools and libraries
RUN apt-get update && apt-get install -y \
    build-essential \ # Includes gcc, g++ and make
    clang \ # Additional compiler option
    cmake \ # Build system
    git \ # Version control
    valgrind \ # Memory debugging
    gdb \ # Debugging
    lldb \ # Another debugger, often used with Clang
    cppcheck \ # Static analysis for C/C++
    vim \ # Editor (you can choose others like emacs or nano)
    libncurses5-dev \ # For terminal-based interfaces
    libncursesw5-dev \
    libsfml-dev \ # Simple and Fast Multimedia Library for C++
    libcsfml-dev \ # Binding of SFML for C
    libsdl2-dev \ # Simple DirectMedia Layer for multimedia
    libsdl2-image-dev \ # SDL2 image modules
    libsdl2-ttf-dev \ # SDL2 ttf modules
    libglm-dev \ # OpenGL Mathematics
    libglew-dev \ # OpenGL Extension Wrangler Library
    freeglut3-dev \ # OpenGL Utility Toolkit
    mesa-utils \ # OpenGL utilities
    xorg-dev \ # Xorg development libraries
    libx11-dev \ # X11 development libraries
    libxrandr-dev \ # Xrandr library
    libxi-dev \ # X Input library
    uuid-dev \ # Universally unique id library
    libssl-dev \ # SSL libraries
    python3 \ # Python 3
    python3-pip \ # Python package manager
    nasm \ # Netwide Assembler
    sudo \ # Superuser do
    curl \ # File transfer
    && curl -fsSL https://get.docker.com -o get-docker.sh \ # Docker installation script
    && sh get-docker.sh \ # Install Docker
  && pip3 install conan \ # C/C++ package manager
  && rm -rf /var/lib/apt/lists/*

COPY coding-style.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/coding-style.sh

WORKDIR /app

CMD ["bash"]

```

## Construction de l'Image Docker

Pour construire l'image Docker à partir de ce Dockerfile, exécutez la commande suivante dans le répertoire contenant le `Dockerfile` :

```bash
docker build -t mon-application-c .
```

Remplacez `mon-application-c` par le nom souhaité pour votre image.

## Exécution du Conteneur Docker

Une fois l'image construite, vous pouvez démarrer un conteneur en utilisant :

```bash
docker run -v $(pwd):/app -it mon-application-c
```

Remplacez `mon-application-c` par le nom de votre image.

## Travailler dans le Conteneur

Après avoir démarré le conteneur, vous serez dans le répertoire `/app`, où votre code source est copié. Vous pouvez compiler et exécuter vos programmes en C en utilisant GCC, faire des tests avec Valgrind, et utiliser Make pour automatiser la compilation.
