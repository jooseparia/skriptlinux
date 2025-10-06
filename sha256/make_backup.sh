#!/bin/bash

# Varukoopia allikas ja sihtkoht
SRC_DIR=~/praks2/src
BACKUP_DIR=~/praks2/backup

# Kuupäeva ja kellaaja formaat failinimes
DATE=$(date '+%Y%m%d_%H-%M-%S')

# Varukoopia failinimi
BACKUP_FILE="$BACKUP_DIR/src_$DATE.tar.zst"

# Loo backup kaust, kui seda ei ole olemas
mkdir -p "$BACKUP_DIR"

# Tee varukoopia zstd kompressiooniga (tase 19, kõik tuumad)
tar -I 'zstd -19 -T0' -cf "$BACKUP_FILE" -C "$(dirname "$SRC_DIR")" "$(basename "$SRC_DIR")"

# Kontrolli tulemus
if [ $? -eq 0 ]; then
  echo "Varukoopia edukalt loodud: $BACKUP_FILE"
else
  echo "Varukoopia loomine ebaõnnestus!"
  exit 1
fi
