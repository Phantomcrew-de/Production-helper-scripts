#!/usr/bin/env bash

# Stelle sicher, dass wir im richtigen Verzeichnis sind
BASE_DIR="."

# Alten Namen aus .drp-Datei ableiten
OLD_NAME=$(find "$BASE_DIR" -maxdepth 1 -type f -name "*.drp" | head -n 1 | sed 's|.*/||' | sed 's|\.drp$||')

if [ -z "$OLD_NAME" ]; then
  echo "❌ Keine .drp-Datei gefunden!"
  exit 1
fi

echo "🔍 Erkannter alter Projektname: $OLD_NAME"

# Neuen Namen abfragen
read -p "🆕 Neuer Projektname: " NEW_NAME

if [ "$OLD_NAME" = "$NEW_NAME" ]; then
  echo "⚠️ Neuer Name ist identisch mit dem alten. Abbruch."
  exit 1
fi

# 1. Dateien & Ordner rekursiv umbenennen – von unten nach oben
find "$BASE_DIR" -depth -name "*$OLD_NAME*" | while IFS= read -r OLD_PATH; do
  NEW_PATH="${OLD_PATH//$OLD_NAME/$NEW_NAME}"
  echo "🔄 Umbenennen: $OLD_PATH → $NEW_PATH"
  mv "$OLD_PATH" "$NEW_PATH"
done

# 2. drp-Datei umbenennen und Inhalt anpassen
DRP_FILE="$BASE_DIR/$NEW_NAME.drp"

if [ -f "$DRP_FILE" ]; then
  echo "✍️ Ersetze '$OLD_NAME' in $DRP_FILE"
  sed -i "s/$OLD_NAME/$NEW_NAME/g" "$DRP_FILE"
else
  echo "❌ .drp-Datei nach Umbenennung nicht gefunden: $DRP_FILE"
fi

echo "✅ Umbenennung abgeschlossen: '$OLD_NAME' → '$NEW_NAME'"

