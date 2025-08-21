#!/bin/bash
# Installer dp dans le répertoire courant et créer le fichier ~/.deepseek_bash

set -e


# Vérifier et installer curl si nécessaire
if ! command -v curl >/dev/null 2>&1; then
  echo "curl n'est pas installé. Installation en cours..."
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y curl
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y curl
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y curl
  else
    echo "Veuillez installer curl manuellement."
    exit 2
  fi
fi

# Copier le script dp dans le répertoire courant
if [ ! -f "dp" ]; then
    echo "Erreur : le script dp doit être présent dans le répertoire courant."
    exit 1
fi
chmod +x dp
echo "Copie du script dp dans le répertoire /usr/local/bin..."
sudo cp dp /usr/local/bin/dp
if [ $? -ne 0 ]; then
    echo "Erreur lors de la copie du script dp dans /usr/local/bin."
    exit 1
fi

# Créer le fichier ~/.deepseek_bash si absent
if [ ! -f "$HOME/.deepseek_bash" ]; then
    echo "Création du fichier $HOME/.deepseek_bash..."
    echo "Pour utiliser ce script, vous avez besoin d'un token API DeepSeek."
    echo "Obtenez votre token ici : https://platform.deepseek.com/api_keys"
    read -p "Entrez votre DeepSeek API token : " token
    echo "# DeepSeek API token (get yours at https://platform.deepseek.com/api_keys)" > "$HOME/.deepseek_bash"
    echo "DEEPSEEK_API_TOKEN=\"$token\"" >> "$HOME/.deepseek_bash"
    echo "# Number of previous bash commands sent for context" >> "$HOME/.deepseek_bash"
    echo "HISTORY=10" >> "$HOME/.deepseek_bash"
    echo "Fichier $HOME/.deepseek_bash créé."
else
    echo "Le fichier $HOME/.deepseek_bash existe déjà."
fi

# Message d'installation
cat <<EOF

Installation terminée !

Utilisation :
  ./dp [options] <question>

Exemples :
  ./dp -s README.MD list my files
  ./dp -c list files in color
  ./dp -d show disk usage

EOF
