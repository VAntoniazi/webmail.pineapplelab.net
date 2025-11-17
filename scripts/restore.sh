#!/usr/bin/env bash
set -e

if [ -z "$1" ]; then
  echo "Uso: scripts/restore.sh caminho/do/arquivo.tar.gz"
  exit 1
fi

ARCHIVE="$1"
DATA_DIR="./data"

echo ">> Parando container mailserver..."
docker compose down

echo ">> Restaurando dados em $DATA_DIR..."
rm -rf "$DATA_DIR"
mkdir -p "$DATA_DIR"
tar -xzf "$ARCHIVE" -C .

echo ">> Subindo container..."
docker compose up -d

echo "Restaurado a partir de: $ARCHIVE"
