#!/bin/bash

directory=""
text=""

while getopts "p:s:" opt; do
  case $opt in
    p)
      directory=$OPTARG
      ;;
    s)
      text=$OPTARG
      ;;
    *)
      echo "Використання: $0 -p <шлях до директорії> -s <текст для пошуку>"
      exit 1
  esac
done

if [ -z "$directory" ] || [ -z "$text" ]; then
  echo "Використання: $0 -p <шлях до директорії> -s <текст для пошуку>"
  exit 1
fi

# Виклик script2.sh для виконання пошуку
./script2.sh "$directory" "$text"