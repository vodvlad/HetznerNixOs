#!/usr/bin/env bash

# Удаляем старый файл, если он существует, чтобы избежать конфликтов прав
[ -f "hardware-configuration.nix" ] && rm "hardware-configuration.nix"

# Генерируем новый конфиг
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix

# Меняем владельца на текущего пользователя (чтобы git мог с ним работать)
sudo chown $USER:users hardware-configuration.nix

# 2. Добавляем файлы в индекс Git (критично для Flakes)
# Даже если файл в .gitignore, команда 'git add -f' заставит Nix его увидеть
echo "git: индексирую файлы..."
git add .

# 3. Запускаем сборку системы
echo "🚀 Начинаю сборку NixOS..."
sudo nixos-rebuild switch --flake .

# 4. Проверяем результат
if [ $? -eq 0 ]; then
    echo "🎉 Система успешно обновлена!"
else
    echo "❌ Ошибка при сборке системы."
    exit 1
fi
