#!/bin/bash

# Überprüfen, ob ein Argument (Dateiname) angegeben wurde
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Dateiname aus dem Argument speichern
filename="$1"

# Überprüfen, ob die Datei existiert
if [ ! -f "$filename" ]; then
    echo "File does not exist: $filename"
    exit 1
fi

# Funktion zum Konvertieren von HTML zu Markdown
convert_html_to_markdown() {
    local input_file="$1"
    local temp_file=$(mktemp)

    # Entfernen von <table>, <tbody>, </tbody>, </table>
    sed 's/<\/\?\(table\|tbody\)>//g' "$input_file" > "$temp_file"

    # Umwandeln von <tr> in eine neue Zeile
    sed -i 's/<\/tr>/\
/g' "$temp_file"

    # Umwandeln von <td> und <th> in Markdown-Tabellen-Syntax
    sed -i 's/<\/\?\(td\|th\)>/|/g' "$temp_file"

    # Entfernen von <strong> und </strong>, optional können Sie hier weitere Tags hinzufügen
    sed -i 's/<\/\?strong>//g' "$temp_file"

    # Ausgabe der konvertierten Daten
    cat "$temp_file"

    # Temporäre Datei löschen
    rm "$temp_file"
}

# Funktion aufrufen und Datei konvertieren
convert_html_to_markdown "$filename"
