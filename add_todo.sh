#!/bin/bash

TODO_FILE=~/todo.txt

# Dialogfeld mit Yad erstellen
TODO_TEXT=$(yad --title="Neue Aufgabe" --form --field="Aufgabe:" --width=400 --height=200)

# Überprüfen, ob der Benutzer auf "OK" geklickt hat
if [[ $? -eq 0 ]]; then
    # Aufgabe zur todo.txt-Datei hinzufügen
    echo "$TODO_TEXT" >> "$TODO_FILE"
    echo "Aufgabe hinzugefügt: $TODO_TEXT"
else
    echo "Keine Aufgabe hinzugefügt."
fi
