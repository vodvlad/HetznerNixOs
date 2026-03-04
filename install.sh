#!/usr/bin/env bash

# 1. Проверяем монтирование
if ! mountpoint -q /mnt; then
    echo "❌ Ошибка: /mnt не примонтирован!"
    exit 1
fi

# 2. Сначала копируем ваш репозиторий
echo "📂 Копирую файлы вашей конфигурации в /mnt/etc/nixos..."
sudo mkdir -p /mnt/etc/nixos
# Копируем всё, кроме уже имеющегося hardware-конфига (если хотите перестраховаться)
sudo cp -r ./* /mnt/etc/nixos/

# 3. ТОЛЬКО ТЕПЕРЬ генерируем конфиг железа
# Это перезапишет hardware-configuration.nix в /mnt/etc/nixos на правильный
echo "⚙️ Генерирую актуальный конфиг железа (UUID дисков)..."
sudo nixos-generate-config --root /mnt

# 4. ОЧЕНЬ ВАЖНО для Flakes: 
# Nix не увидит новый файл, если он не в индексе Git
echo "git: добавляю файлы в индекс..."
cd /mnt/etc/nixos
if [ -d ".git" ]; then
    sudo git add hardware-configuration.nix
fi

# 5. Запускаем установку
echo "🚀 Запускаю nixos-install..."
sudo nixos-install --flake .#nixos
