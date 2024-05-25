#!/bin/bash

# Überprüfen, ob genau ein Argument übergeben wurde
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <markdown-file>"
    exit 1
fi

# Der Dateiname der Eingabedatei
input_file="$1"

# Überprüfen, ob die Datei existiert
if [ ! -f "$input_file" ]; then
    echo "File not found: $input_file"
    exit 1
fi

# Der Dateiname der Ausgabedatei
output_file="cleaner-${input_file}"

# Verarbeiten der Datei und Speichern des Ergebnisses
perl -0777 -pe 's/\\\[(.*?)\\\]//g' "$input_file" > "$output_file"

echo "Processed file saved as $output_file"
