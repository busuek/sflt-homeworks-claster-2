#!/bin/bash

# Директория для резервной копии
BACKUP_DIR="/tmp/backup"

# Домашняя директория пользователя
HOME_DIR="/home/$USER"

# Лог-файл
LOG_FILE="/var/log/backup.log"

# Дата и время для записи в лог
TIMESTAMP=$(date +'%Y-%m-%d %H:%M:%S')

# Команда rsync для создания зеркальной резервной копии
RSYNC_COMMAND="rsync -av --delete --checksum --exclude '.*' $HOME_DIR/ $BACKUP_DIR"

# Выполнение резервного копирования
$RSYNC_COMMAND

# Проверка статуса выполнения rsync
if [ $? -eq 0 ]; then
  echo "$TIMESTAMP: Резервное копирование выполнено успешно." >> $LOG_FILE
else
  echo "$TIMESTAMP: Ошибка при выполнении резервного копирования." >> $LOG_FILE
fi
