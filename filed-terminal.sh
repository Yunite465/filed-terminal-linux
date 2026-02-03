#!/bin/bash

# Подгружаем конфиг
source "$(dirname "$0")/config.conf"

IN="$WORKING_DIR/in.md"
OUT="$WORKING_DIR/out.md"
STATUS="$WORKING_DIR/status.md"

while true; do
    # Читаем содержимое in.md
    CONTENT=$(cat "$IN")

    # Проверяем: файл не пуст И строка заканчивается на "-run"
    if [[ -n "$CONTENT" && "$CONTENT" == *"-run" ]]; then
        # Убираем маркер "-run" из команды
        CMD="${CONTENT%-run}"

        # Выполняем команду, результат в out, ошибки туда же
        eval "$CMD" > "$OUT" 2>&1

        # Очищаем файл ввода
        : > "$IN"
    fi

    # Обновляем статус в любом случае
    {
        echo "Status: Running"
        echo "Time: $(date)"
        echo "Credit: puf7 | https://github.com/Yunite465"
    } > "$STATUS"

    sleep 0.2
done

