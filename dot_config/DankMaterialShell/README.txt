Конфиг DMS (DankMaterialShell) обычно лежит в ~/.config/DankMaterialShell/
(создаётся командой `dms setup` или через настройки самого DMS).

Проверь у себя точный путь:
  ls ~/.config/ | grep -i dank
  ls ~/.config/ | grep -i quickshell

и добавь его в chezmoi:
  chezmoi add ~/.config/DankMaterialShell
  # или, если конфиг лежит в ~/.config/quickshell:
  chezmoi add ~/.config/quickshell

Этот файл-заглушку после этого можно удалить:
  rm $(chezmoi source-path)/dot_config/DankMaterialShell/README.txt
