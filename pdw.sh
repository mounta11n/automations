#!/bin/bash

wordlist="/home/$USER/.gnupg/diceware_german.txt"
num_words=6
delimiter="-"

# Funktion, um ein Wort aus einer Zeile zu extrahieren
extract_word() {
    echo "$1" | awk '{print $2}'
}

password=""

for ((i=1; i<=num_words; i++))
do
    line=$(shuf -n 1 $wordlist)
    word=$(extract_word "$line")
    if [ -z "$password" ]; then
        password="$word"
    else
        password="$password$delimiter$word"
    fi
done

echo "$password"

