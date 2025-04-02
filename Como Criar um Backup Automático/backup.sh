#!/bin/bash

ORIGEM="$HOME/Documentos"
DESTINO="$HOME/Backup"
NOME="backup_$(date +%Y-%m-%d).tar.gz"

[ ! -d "$DESTINO" ] && mkdir -p "$DESTINO"
tar -czf "$DESTINO/$NOME" "$ORIGEM"

echo "Backup concluído: $DESTINO/$NOME"
