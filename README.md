# Conteneur Docker Epitech

Ce README explique la configuration et l'utilisation d'un conteneur Docker basé sur l'image `arm64v8/ubuntu:latest`, spécialement préparé pour le développement en C. Ce conteneur inclut les outils essentiels tels que GCC, Make, ainsi que des bibliothèques et des outils de débogage comme Valgrind.

## Prérequis

- Docker installé sur votre machine. Si vous n'avez pas encore Docker, suivez les instructions sur [le site officiel de Docker](https://docs.docker.com/get-docker/) pour l'installer sur votre système d'exploitation.
- Un ordinateur avec une architecture ARM64, compatible avec l'image `arm64v8/ubuntu:latest`.

## Configuration du Dockerfile

Le `Dockerfile` suivant est utilisé pour créer l'image Docker :

```dockerfile
FROM arm64v8/ubuntu:latest

# Mise à jour des paquets et installation des outils de développement
RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libuuid1 \
    uuid-dev \
    valgrind \
  && rm -rf /var/lib/apt/lists/*

# Copie du code source dans le conteneur
COPY . /app

# Définition du répertoire de travail
WORKDIR /app
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
docker run -it --name mon-conteneur-c mon-application-c
```

Remplacez `mon-conteneur-c` par le nom souhaité pour votre conteneur, et `mon-application-c` par le nom de l'image que vous avez construite.

## Travailler dans le Conteneur

Après avoir démarré le conteneur, vous serez dans le répertoire `/app`, où votre code source est copié. Vous pouvez compiler et exécuter vos programmes en C en utilisant GCC, faire des tests avec Valgrind, et utiliser Make pour automatiser la compilation.

## Conclusion

Ce conteneur Docker fournit un environnement de développement en C prêt à l'emploi pour les systèmes avec une architecture ARM64. Il est particulièrement utile pour les développeurs travaillant sur des projets nécessitant les outils spécifiés, offrant ainsi une plateforme cohérente et isolée pour le développement.
