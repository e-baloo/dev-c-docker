# Image de base avec GCC et outils de développement C
FROM gcc:latest

# Installation des outils de développement supplémentaires
RUN apt-get update && apt-get install -y \
    gdb \
    make \
    cmake \
    valgrind \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Répertoire de travail
WORKDIR /workspace

# Commande par défaut
CMD ["/bin/bash"]
