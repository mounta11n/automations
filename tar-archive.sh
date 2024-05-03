#!/usr/bin/env bash

# Aktuelles Verzeichnis
current_dir=$(pwd)

# Elternverzeichnis
parent_dir_name=$(basename $current_dir)

# Archivname
archive_name="${current_dir}/${parent_dir_name}.tar"

# Prüfe ob keine Argumente angegeben wurden
if [ $# -eq 0 ]
then
    # Ohne Argumente einfach alles archivieren
    tar --xattrs --exclude="$archive_name" -cvpf $archive_name ./*
else
    # Andernfalls nur angegebene Dateien archivieren
    tar --xattrs --exclude="$archive_name" -cvpf $archive_name "$@"
fi
