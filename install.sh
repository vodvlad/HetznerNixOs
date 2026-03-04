#!/usr/bin/env bash

# 1. Проверяем, примонтирован ли диск
if ! mountpoint -q /mnt; then
    echo "❌ Ошибка: /mnt не примонтирован. Сначала разметьте и примонтируйте диски!"
    exit 1
fi

# 2. Генерируем конфиг железа прямо в /mnt
echo "⚙️ Генерирую конфигурацию железа для новой системы..."
sudo nixos-generate-config --root /mnt

# 3. Копируем ваш репозиторий в новую систему
# Допустим, вы склонировали репозиторий в ~/HetznerNixOs
echo "📂 Копирую файлы конфигурации..."
sudo mkdir -p /mnt/etc/nixos
sudo cp -r ./* /mnt/etc/nixos/

# 4. Запускаем установку
echo "🚀 Запускаю nixos-install..."
sudo nixos-install --flake /mnt/etc/nixos#nixos
