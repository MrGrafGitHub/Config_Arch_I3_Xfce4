#!/bin/bash
#export DISPLAY=:0
#log_file="/home/mrgraf/LogUpdate/$(date +'%Y-%m-%d')_update_log.txt"

# Обновление репозиториев и пакетов
notify-send -i /usr/share/icons/AdwaitaLegacy/32x32/emblems/emblem-synchronizing.png "Обновление системы" "Запущен процесс обновления."

echo "Обновление репозиториев и пакетов..."
yay -Syu --noconfirm

# Очистка кэша пакетов, оставляя последние 3 версии
echo "Очистка кэша пакетов..."
sudo paccache -rk3 --noconfirm

# Проверка на наличие ошибок
echo "Проверка на наличие ошибок..."
sudo pacman -Qkk

# Проверка на наличие сиротских пакетов и их удаление
echo "Поиск и удаление сиротских пакетов..."
orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then 
    sudo pacman -Rns $orphans --noconfirm
else
    echo "Сиротских пакетов не найдено." 
fi

notify-send -i /usr/share/icons/AdwaitaLegacy/32x32/emblems/emblem-synchronizing.png "Обновление системы" "Обновление завершено. Рекомендуется перезагрузить компьютер."

neofetch

echo "Обновление системы завершено!" 


