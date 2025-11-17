#!/usr/bin/env bash
set -e

BACKUP_DIR="./backup"
DATA_DIR="./data"

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
ARCHIVE="$BACKUP_DIR/mailserver-$TIMESTAMP.tar.gz"

echo ">> Parando container mailserver..."
docker compose stop mailserver

echo ">> Compactando pasta de dados..."
tar -czf "$ARCHIVE" "$DATA_DIR"

echo ">> Iniciando container mailserver..."
docker compose start mailserver

echo "Backup criado em: $ARCHIVE"
