# 🪟 Guide d'Installation Windows avec Docker Desktop

Ce guide vous accompagne pas à pas pour installer et utiliser cet environnement de développement C sous Windows avec Docker Desktop.

## 📋 Prérequis

- **Windows 10/11** (64-bit)
  - Version Pro, Enterprise ou Education (recommandé pour Hyper-V)
  - Ou Windows Home avec WSL 2
- **Au moins 4 GB de RAM** disponible
- **10 GB d'espace disque** libre
- **Droits administrateur** sur votre machine

## 🔧 Installation des outils nécessaires

### Étape 1: Installer WSL 2 (Windows Subsystem for Linux)

1. **Ouvrir PowerShell en tant qu'administrateur**
   - Cliquez avec le bouton droit sur le menu Démarrer
   - Sélectionnez "Windows PowerShell (Admin)" ou "Terminal (Admin)"

2. **Activer WSL**
   ```powershell
   wsl --install
   ```

3. **Redémarrer votre ordinateur** si demandé

4. **Vérifier l'installation**
   ```powershell
   wsl --version
   ```

> 💡 **Note**: Si vous avez déjà WSL 1, mettez à jour vers WSL 2:
> ```powershell
> wsl --set-default-version 2
> ```

### Étape 2: Installer Docker Desktop

1. **Télécharger Docker Desktop**
   - Visitez: https://www.docker.com/products/docker-desktop/
   - Cliquez sur "Download for Windows"
   - Téléchargez le fichier d'installation (environ 500 MB)

2. **Installer Docker Desktop**
   - Double-cliquez sur `Docker Desktop Installer.exe`
   - Cochez "Use WSL 2 instead of Hyper-V" (recommandé)
   - Suivez les instructions de l'assistant d'installation
   - Cliquez sur "Close and restart" à la fin

3. **Premier lancement**
   - Lancez Docker Desktop depuis le menu Démarrer
   - Acceptez les conditions d'utilisation
   - Vous pouvez créer un compte Docker (optionnel) ou continuer sans compte

4. **Vérifier l'installation**
   - Ouvrez PowerShell ou CMD
   ```powershell
   docker --version
   docker-compose --version
   ```
   - Vous devriez voir les versions installées

### Étape 3: Installer Git pour Windows

1. **Télécharger Git**
   - Visitez: https://git-scm.com/download/win
   - Téléchargez la version 64-bit

2. **Installer Git**
   - Exécutez l'installateur
   - Utilisez les options par défaut (recommandé)
   - Important: Sélectionnez "Git from the command line and also from 3rd-party software"

3. **Vérifier l'installation**
   ```powershell
   git --version
   ```

### Étape 4: Installer Visual Studio Code (Recommandé)

1. **Télécharger VS Code**
   - Visitez: https://code.visualstudio.com/
   - Téléchargez la version Windows

2. **Installer VS Code**
   - Exécutez l'installateur
   - Cochez "Add to PATH" lors de l'installation

3. **Installer les extensions nécessaires**
   - Lancez VS Code
   - Installez les extensions suivantes:
     - `Dev Containers` (ms-vscode-remote.remote-containers)
     - `C/C++` (ms-vscode.cpptools)
     - `Docker` (ms-azuretools.vscode-docker)

## 📥 Récupération du projet

### Cloner le projet depuis GitHub

1. **Ouvrir PowerShell ou Terminal Windows**

2. **Naviguer vers le dossier où vous souhaitez travailler**
   ```powershell
   # Par exemple, dans vos Documents
   cd C:\Users\VotreNom\Documents
   
   # Ou dans un dossier dédié à vos projets
   cd C:\Users\VotreNom\Projects
   ```

3. **Cloner le projet**
   ```powershell
   git clone https://github.com/e-baloo/dev-c-docker.git
   cd dev-c-docker
   ```

4. **Supprimer l'historique Git (pour créer votre propre projet)**
   ```powershell
   # Sous Windows PowerShell
   Remove-Item -Recurse -Force .git
   
   # Ou avec Git Bash
   rm -rf .git
   ```

5. **Initialiser votre propre dépôt Git (optionnel)**
   ```powershell
   git init
   git add .
   git commit -m "Initial commit: Mon projet C"
   
   # Si vous voulez le pousser sur votre propre GitHub
   git remote add origin git@github.com:votre-username/votre-projet.git
   git branch -M main
   git push -u origin main
   ```

## 🚀 Utilisation du projet

### Méthode 1: Avec VS Code et Dev Containers (⭐ Recommandé)

1. **Ouvrir le projet dans VS Code**
   ```powershell
   # Après avoir cloné le projet
   cd dev-c-docker
   code .
   ```

2. **Ouvrir dans VS Code**
   ```powershell
   code .
   ```

3. **Ouvrir dans le conteneur**
   - VS Code détecte automatiquement la configuration Dev Container
   - Cliquez sur le bouton vert en bas à gauche de VS Code
   - Sélectionnez "Reopen in Container"
   - VS Code va construire l'image Docker (première fois: 2-5 minutes)
   - Une fois prêt, vous êtes dans l'environnement Linux!

4. **Compiler et exécuter**
   - Ouvrez le terminal intégré dans VS Code (`` Ctrl+` ``)
   - Compilez le projet:
     ```bash
     make
     ```
   - Exécutez le programme:
     ```bash
     make run
     ```

### Méthode 2: Avec Docker Compose (Ligne de commande)

1. **Ouvrir PowerShell dans le dossier du projet**
   - Naviguez vers le dossier:
     ```powershell
     cd C:\chemin\vers\votre\projet
     ```

2. **Démarrer le conteneur**
   ```powershell
   docker-compose up -d
   ```
   - La première fois, Docker va télécharger et construire l'image (2-5 minutes)

3. **Entrer dans le conteneur**
   ```powershell
   docker-compose exec dev-c bash
   ```
   - Vous êtes maintenant dans un environnement Linux!

4. **Compiler et exécuter**
   ```bash
   # Dans le conteneur
   make
   make run
   ```

5. **Quitter le conteneur**
   ```bash
   exit
   ```

6. **Arrêter le conteneur**
   ```powershell
   docker-compose down
   ```

### Méthode 3: Avec Docker directement

1. **Construire l'image**
   ```powershell
   docker build -t dev-c-env .
   ```

2. **Lancer le conteneur**
   ```powershell
   docker run -it --rm -v ${PWD}:/workspace dev-c-env
   ```

3. **Compiler et exécuter**
   ```bash
   make
   make run
   ```

## 🔨 Commandes utiles

### Commandes Make disponibles

```bash
make          # Compile le projet
make run      # Compile et exécute le programme
make clean    # Nettoie les fichiers compilés
make debug    # Lance le débogueur GDB
make valgrind # Vérifie les fuites mémoire
```

### Commandes Docker utiles

```powershell
# Voir les conteneurs en cours d'exécution
docker ps

# Voir toutes les images Docker
docker images

# Arrêter tous les conteneurs
docker stop $(docker ps -aq)

# Supprimer tous les conteneurs arrêtés
docker container prune

# Supprimer les images inutilisées
docker image prune

# Voir les logs d'un conteneur
docker-compose logs dev-c
```

## 🐛 Dépannage

### Problème: "WSL 2 installation is incomplete"

**Solution:**
1. Téléchargez et installez le kernel WSL 2: https://aka.ms/wsl2kernel
2. Redémarrez Docker Desktop

### Problème: "Docker Desktop requires virtualization to be enabled"

**Solution:**
1. Redémarrez votre PC et entrez dans le BIOS (F2, F10, Del selon le fabricant)
2. Activez la virtualisation (Intel VT-x ou AMD-V)
3. Sauvegardez et redémarrez

### Problème: Docker Desktop ne démarre pas

**Solutions:**
1. Vérifiez que WSL 2 est correctement installé:
   ```powershell
   wsl --status
   ```
2. Réinitialisez Docker Desktop:
   - Paramètres → Troubleshoot → Reset to factory defaults
3. Désactivez votre antivirus temporairement

### Problème: "Cannot connect to Docker daemon"

**Solution:**
1. Assurez-vous que Docker Desktop est lancé et en cours d'exécution
2. Regardez l'icône Docker dans la barre des tâches (doit être verte)
3. Si l'icône clignote, attendez que Docker finisse de démarrer

### Problème: Les volumes ne se synchronisent pas

**Solution:**
1. Dans Docker Desktop:
   - Paramètres → Resources → File Sharing
   - Ajoutez le lecteur où se trouve votre projet (C:\, D:\, etc.)
   - Cliquez sur "Apply & Restart"

### Problème: Performance lente sur Windows

**Solutions:**
1. **Placez votre projet dans WSL** (recommandé):
   ```powershell
   # Ouvrir WSL
   wsl
   
   # Votre projet sera plus rapide ici
   cd ~
   git clone <url-du-projet>
   ```

2. **Ajustez les ressources Docker Desktop**:
   - Paramètres → Resources
   - Augmentez RAM et CPU alloués

### Problème: "Error response from daemon: open \\.\pipe\docker_engine"

**Solution:**
- Relancez Docker Desktop en tant qu'administrateur
- Ou redémarrez le service Docker depuis les Services Windows

## 📚 Ressources supplémentaires

- **Documentation Docker Desktop**: https://docs.docker.com/desktop/windows/
- **Documentation WSL 2**: https://docs.microsoft.com/fr-fr/windows/wsl/
- **Documentation VS Code Dev Containers**: https://code.visualstudio.com/docs/devcontainers/containers
- **Tutoriels C**: https://www.learn-c.org/

## 🔑 Configuration SSH pour GitLab EPITA

### Étape 1: Générer une clé SSH dans le conteneur

1. **Ouvrir le conteneur**
   ```powershell
   # Si vous utilisez Docker Compose
   docker-compose exec dev-c bash
   
   # Ou avec VS Code Dev Container, ouvrez simplement un terminal
   ```

2. **Générer la clé SSH**
   ```bash
   # Générer une clé SSH (remplacez par votre email EPITA)
   ssh-keygen -t ed25519 -C "votre.email@epita.fr"
   
   # Appuyez sur Entrée pour accepter l'emplacement par défaut (~/.ssh/id_ed25519)
   # Entrez un mot de passe (recommandé) ou laissez vide
   ```

3. **Démarrer l'agent SSH**
   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   ```

4. **Copier la clé publique**
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   - Sélectionnez et copiez tout le contenu affiché (commence par `ssh-ed25519`)

### Étape 2: Ajouter la clé à GitLab EPITA

1. **Connectez-vous à GitLab EPITA**
   - Visitez: https://gitlab.cri.epita.fr/
   - Connectez-vous avec vos identifiants EPITA

2. **Accéder aux paramètres SSH**
   - Cliquez sur votre avatar en haut à droite
   - Sélectionnez "Preferences" ou "Préférences"
   - Dans le menu de gauche, cliquez sur "SSH Keys"

3. **Ajouter la clé**
   - Collez votre clé publique dans le champ "Key"
   - Donnez un titre (ex: "Docker Dev Container - Windows")
   - Cliquez sur "Add key"

### Étape 3: Tester la connexion

```bash
# Dans le conteneur
ssh -T git@gitlab.cri.epita.fr
```

Vous devriez voir un message de bienvenue confirmant l'authentification.

### Étape 4: Configurer Git

```bash
# Configurer votre identité Git
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@epita.fr"

# Vérifier la configuration
git config --list
```

### Cloner un projet depuis GitLab EPITA

```bash
# Format SSH (recommandé avec la clé SSH)
git clone git@gitlab.cri.epita.fr:username/projet.git

# Exemple
git clone git@gitlab.cri.epita.fr:votre.login/mon-projet-c.git
```

### Persistance de la clé SSH

Pour conserver votre clé SSH entre les redémarrages du conteneur:

**Option 1: Monter le dossier .ssh (Recommandé)**

Modifiez le `docker-compose.yml`:
```yaml
services:
  dev-c:
    build: .
    container_name: dev-c-container
    volumes:
      - .:/workspace
      - ~/.ssh:/root/.ssh:ro  # Ajouter cette ligne (lecture seule)
    stdin_open: true
    tty: true
    working_dir: /workspace
```

**Option 2: Créer la clé dans WSL**

Si vous utilisez WSL, créez votre clé SSH directement dans WSL:
```powershell
# Ouvrir WSL
wsl

# Générer la clé
ssh-keygen -t ed25519 -C "votre.email@epita.fr"
```

Ensuite, la clé sera automatiquement disponible dans le conteneur si vous montez `~/.ssh`.

## 💡 Conseils et bonnes pratiques

### Performance optimale

1. **Utilisez WSL 2 pour les projets** - Placez vos projets dans le système de fichiers WSL pour de meilleures performances
   ```powershell
   # Accéder à WSL depuis l'explorateur Windows
   \\wsl$\Ubuntu\home\<votre-utilisateur>
   ```

2. **Gérez les ressources** - Configurez Docker Desktop avec 4-8 GB de RAM

3. **Gardez Docker à jour** - Vérifiez régulièrement les mises à jour

### Sécurité

1. Ne partagez pas vos conteneurs Docker avec des images non vérifiées
2. Gardez Docker Desktop et WSL à jour
3. Utilisez des images officielles quand possible

### Workflow recommandé

1. **Développez avec VS Code Dev Containers** - C'est la méthode la plus simple et efficace
2. **Committez régulièrement** votre code avec Git
3. **Utilisez `make clean`** avant de committer pour ne pas inclure les binaires
4. **Testez avec Valgrind** pour détecter les fuites mémoire

## ✅ Vérification de l'installation

Pour vérifier que tout fonctionne correctement:

```powershell
# 1. Vérifier Docker
docker --version
docker run hello-world

# 2. Vérifier Docker Compose
docker-compose --version

# 3. Vérifier WSL
wsl --version

# 4. Vérifier Git
git --version

# 5. Tester le projet
cd <dossier-du-projet>
docker-compose up -d
docker-compose exec dev-c bash
# Dans le conteneur:
make run
exit
docker-compose down
```

Si toutes ces commandes fonctionnent, votre installation est complète! 🎉

## 🆘 Support

En cas de problème non résolu:
1. Vérifiez les logs Docker: `docker-compose logs`
2. Consultez les issues GitHub du projet
3. Redémarrez Docker Desktop et votre ordinateur
4. Vérifiez la documentation officielle Docker

---

**Bonne programmation en C! 🚀**
