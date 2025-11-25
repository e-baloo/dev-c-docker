# Environnement de Développement C avec Docker

## 🚀 Démarrage rapide

### Option 1: Utiliser Dev Container (Recommandé)
1. Ouvrez ce dossier dans VS Code
2. Installez l'extension "Dev Containers" si ce n'est pas déjà fait
3. Cliquez sur le bouton en bas à gauche et sélectionnez "Reopen in Container"
4. VS Code va automatiquement construire et démarrer le conteneur

### Option 2: Utiliser Docker Compose manuellement
```bash
# Construire et démarrer le conteneur
docker-compose up -d

# Entrer dans le conteneur
docker-compose exec dev-c bash

# Arrêter le conteneur
docker-compose down
```

## 📦 Outils inclus

- **GCC**: Compilateur C/C++ (dernière version)
- **GDB**: Débogueur GNU
- **Make**: Outil de compilation
- **CMake**: Système de génération de build
- **Valgrind**: Outil de détection de fuites mémoire
- **Git**: Gestion de version

## 🔨 Utilisation

### Compiler le projet
```bash
make
```

### Exécuter le programme
```bash
make run
```

### Déboguer avec GDB
```bash
make debug
```

### Vérifier les fuites mémoire
```bash
make valgrind
```

### Nettoyer les fichiers compilés
```bash
make clean
```

## 📁 Structure du projet

```
.
├── src/           # Code source (.c)
├── build/         # Fichiers objets (.o)
├── bin/           # Exécutables
├── Dockerfile     # Configuration Docker
├── Makefile       # Règles de compilation
└── .devcontainer/ # Configuration VS Code Dev Container
```

## 🎯 Développement avec VS Code

Une fois dans le Dev Container, vous pouvez:
- Utiliser IntelliSense pour l'auto-complétion
- Déboguer avec des points d'arrêt (F5)
- Compiler avec Ctrl+Shift+B
- Utiliser le terminal intégré

## 📝 Notes

- Tous vos fichiers sont synchronisés entre votre machine et le conteneur
- Les modifications sont persistées même après l'arrêt du conteneur
- Le code est compilé avec les flags `-Wall -Wextra` pour une meilleure détection d'erreurs
