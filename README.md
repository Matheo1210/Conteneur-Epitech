# Conteneur Docker Epitech

Ce README explique la configuration et l'utilisation d'un conteneur Docker basé sur l'image `arm64v8/ubuntu:latest`, spécialement préparé pour le développement en C/C++ d'Epitech. Ce conteneur inclut les outils essentiels tels que GCC, Make, ainsi que des bibliothèques et des outils de débogage comme Valgrind.

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
    g++ \
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
docker run -v $(pwd):/app -it mon-application-c
```

Remplacez `mon-application-c` par le nom de votre image.

## Travailler dans le Conteneur

Après avoir démarré le conteneur, vous serez dans le répertoire `/app`, où votre code source est copié. Vous pouvez compiler et exécuter vos programmes en C en utilisant GCC, faire des tests avec Valgrind, et utiliser Make pour automatiser la compilation.

## Utilisation du Script de Style de Codage

Pour garantir la cohérence du style de codage dans vos projets en C, un script `coding-style.sh` est inclus dans le conteneur. Ce script est conçu pour formater automatiquement votre code selon les conventions de style Epitech.

### Comment Exécuter le Script de Style de Codage

Pour utiliser le script `coding-style.sh` et appliquer les conventions de style à vos fichiers source en C, exécutez la commande suivante dans le terminal de votre conteneur :

```bash
coding-style.sh chemin_vers_votre_fichier.c
```

Remplacez `chemin_vers_votre_fichier.c` par le chemin relatif ou absolu de votre fichier source en C. Vous pouvez également appliquer le script à plusieurs fichiers en les listant séparément ou en utilisant des motifs globaux.
