#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Використання: $0 <шлях до директорії> <розширення файлів>"
    exit 1
fi

DIRECTORY=$1
EXTENSION=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Директорія $DIRECTORY не існує"
    exit 1
fi

find "$DIRECTORY" -maxdepth 1 -type f -name "*.$EXTENSION"