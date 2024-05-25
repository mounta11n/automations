#!/bin/bash

# Überprüfen, ob ein Argument übergeben wurde
if [ $# -eq 0 ]; then
    echo "Bitte geben Sie ein Argument an."
    exit 1
fi

# Argument in Kleinbuchstaben umwandeln
argument=$(echo $1 | tr '[:upper:]' '[:lower:]')

# Ordner erstellen
mkdir -p ~/containers/$argument/$argument-home

# Pfad zur docker-compose.yml Datei
compose_file=~/containers/$argument/docker-compose.yml

# Inhalt der docker-compose.yml Datei generieren
cat > $compose_file <<EOF
version: '3.1'
services:
  $argument:
    image: $argument/$argument
    volumes:
      - ~/containers/$argument/$argument-home:/home
EOF

echo "Docker Compose Datei erstellt: $compose_file"

