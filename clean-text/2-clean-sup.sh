#!/bin/bash

# Überprüfen, ob ein Argument angegeben wurde
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Der Dateiname der Eingabedatei
input_file=$1

# Überprüfen, ob die Datei existiert
if [ ! -f "$input_file" ]; then
    echo "File does not exist: $input_file"
    exit 1
fi

# Der Dateiname der Ausgabedatei
output_file="cleaned-$input_file"

# Verarbeiten der Datei und Entfernen der <sup>...</sup> Tags
sed 's/<sup.*sup>//g' "$input_file" > "$output_file"

echo "Processed file saved as $output_file"
