#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Використання: $0 <шлях до директорії> <розширення файлів>"
    exit 1
fi

DIRECTORY=$1
EXTENSION=$2

./script1.sh "$DIRECTORY" "$EXTENSION" | wc -l
