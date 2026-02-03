#!/bin/bash

# Подгружаем конфиг (проверь, что путь до config.conf верный)
source "$(dirname "$0")/config.conf"

# На всякий случай делаем пути абсолютными
IN="$WORKING_DIR/in.md"
OUT="$WORKING_DIR/out.md"
STATUS="$WORKING_DIR/status.md"

# Создаем файлы, если их нет
mkdir -p "$WORKING_DIR"
touch "$IN" "$OUT" "$STATUS"

while true; do
    # Проверяем, есть ли в файле содержимое (размер больше 0)
    if [ -s "$IN" ]; then
        # Читаем команду, убирая лишние пробелы
        CMD=$(sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' "$IN")

        if [ -n "$CMD" ]; then
            # Выполняем команду, результат в OUT, ошибки тоже туда
            eval "$CMD" > "$OUT" 2>&1
            # Очищаем файл IN полностью
            : > "$IN"
        fi
    fi

    # Обновляем статус
    {
        echo "### Service Status"
        echo "Status: **Running**"
        echo "Last update: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "Credit: Yunite465 | https://github.com/Yunite465"
    } > "$STATUS"

    sleep 0.2
done
