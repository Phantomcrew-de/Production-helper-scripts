#!/bin/bash

# Funktion zur Abfrage und Validierung des Datums
date_prompt() {
    read -p "Geben Sie ein Datum ein (YYYYMMDD) oder drücken Sie Enter für das aktuelle Datum: " input_date
    if [[ -z "$input_date" ]]; then
        # Aktuelles Datum verwenden
        date +"%Y%m%d"
    elif [[ $input_date =~ ^[0-9]{8}$ ]]; then
        # Benutzerdefiniertes Datum verwenden
        echo "$input_date"
    else
        echo "Ungültiges Datum. Bitte versuchen Sie es erneut."
        date_prompt
    fi
}

# Abfrage der Eingabedaten
date=$(date_prompt)
read -p "Geben Sie den Auftraggebernamen ein: " client_name
read -p "Geben Sie den Projektnamen ein: " project_name

# Entferne Leerzeichen und Sonderzeichen aus den Namen
client_name=$(echo "$client_name" | tr -d '[:space:]' | tr -cd '[:alnum:]_')
project_name=$(echo "$project_name" | tr -d '[:space:]' | tr -cd '[:alnum:]_')

# Hauptordner erstellen
main_folder="${date}_${client_name}_${project_name}"
mkdir -p "$main_folder"

# Unterordner erstellen
mkdir -p "$main_folder/00_Final"
mkdir -p "$main_folder/01_Footage/Cam_01"
mkdir -p "$main_folder/01_Footage/Cam_02"
mkdir -p "$main_folder/01_Footage/Cam_03"
mkdir -p "$main_folder/01_Footage/Cam_04"
mkdir -p "$main_folder/01_Footage/Liverecording"
mkdir -p "$main_folder/01_Footage/SFX"
mkdir -p "$main_folder/01_Footage/VFX"
mkdir -p "$main_folder/01_Footage/Graphics"
mkdir -p "$main_folder/01_Footage/Music"
mkdir -p "$main_folder/02_Dokumente"

# Erfolgsmeldung ausgeben
echo "Projektordner '$main_folder' wurde erfolgreich erstellt."

