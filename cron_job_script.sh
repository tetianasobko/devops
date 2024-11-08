#!/bin/bash

LOG_FILE="/var/log/my-app.log"
REDIS_KEY="log_file_info"
REDIS_HOST="localhost"
REDIS_PORT=6379

LAST_SIZE_FILE="/tmp/last_log_file_size"
LAST_MODIFIED_FILE="/tmp/last_log_file_modified"

CURRENT_SIZE=$(stat -c %s "$LOG_FILE")
CURRENT_MODIFIED=$(stat -c %Y "$LOG_FILE")

LAST_SIZE=$(cat "$LAST_SIZE_FILE" 2>/dev/null || echo 0)
LAST_MODIFIED=$(cat "$LAST_MODIFIED_FILE" 2>/dev/null || echo 0)

if [[ "$CURRENT_SIZE" != "$LAST_SIZE" ]] || [[ "$CURRENT_MODIFIED" != "$LAST_MODIFIED" ]]; then
    redis-cli -h "$REDIS_HOST" -p "$REDIS_PORT" HSET "$REDIS_KEY" size "$CURRENT_SIZE" modified "$CURRENT_MODIFIED"

    echo "$CURRENT_SIZE" > "$LAST_SIZE_FILE"
    echo "$CURRENT_MODIFIED" > "$LAST_MODIFIED_FILE"
fi
