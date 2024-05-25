#!/bin/bash

# Überprüfen, ob ein Argument (Dateiname) angegeben wurde
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Der Dateiname der Eingabedatei
input_file=$1

# Überprüfen, ob die Datei existiert
if [ ! -f "$input_file" ]; then
    echo "File not found: $input_file"
    exit 1
fi

# Neuer Dateiname mit Präfix
output_file="no_bckslsh-$input_file"

# Entfernen aller Backslashes und Speichern in der neuen Datei
sed 's/\\//g' "$input_file" > "$output_file"

echo "Processed file saved as: $output_file"
