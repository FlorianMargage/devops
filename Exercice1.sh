#!/bin/bash

# Fonction pour lister les fichiers et dossiers récursivement avec permissions
list_files_recursively() {
    local directory="$1"
    local indent="$2"
    
    # Boucle sur tous les éléments du répertoire
    for item in "$directory"/*; do
        if [ -d "$item" ]; then
            permissions=$(stat -c "%A" "$item")
            echo -e "${indent}├── [${permissions}] $(basename "$item")"
            # Appel récursif pour les sous-dossiers avec indentation accrue
            list_files_recursively "$item" "    $indent"
        elif [ -f "$item" ]; then
            permissions=$(stat -c "%A" "$item")
            echo -e "${indent}├── [${permissions}] $(basename "$item")"
        fi
    done
}

# Répertoire à lister (défaut: répertoire courant)
directory=${1:-.}

# Appel de la fonction avec le répertoire spécifié et indentation initiale vide
list_files_recursively "$directory" ""
