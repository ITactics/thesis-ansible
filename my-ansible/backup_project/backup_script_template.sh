#!/bin/bash

# Настройки резервного копирования
backup_dir="/var/backups/database"
database_names=("mydb" "max")
username="root"
password="12345789"

# Создание директории для резервной копии
mkdir -p $backup_dir

# Итерация по именам баз данных
for database_name in "${database_names[@]}"
do
    # Формирование имени файла резервной копии с использованием имени базы данных и текущей даты и времени
    backup_filename="$backup_dir/${database_name}_$(date +%Y-%m-%d_%H-%M-%S).sql"
    
    # Выполнение резервного копирования базы данных
    mysqldump -u $username -p$password $database_name > $backup_filename
    
    # Проверка кода завершения mysqldump
    if [ $? -eq 0 ]; then
        echo "Резервное копирование базы данных $database_name завершено. Файл: $backup_filename"
        
        # Копирование резервной копии в Google Cloud Storage
        gsutil cp $backup_filename gs://my-bucket-name/
    else
        echo "Ошибка при резервном копировании базы данных $database_name."
    fi
done

# Удаление резервных копий старше 30 дней
find $backup_dir -type f -name "*.sql" -mtime +30 -exec rm -f {} \;
