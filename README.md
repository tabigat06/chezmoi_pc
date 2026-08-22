# Мои dotfiles (Debian + niri + DMS + zsh + nvim)

Управляется через [chezmoi](https://www.chezmoi.io/).

## Как это работает

- Реальные конфиги (`~/.zshrc`, `~/.config/niri/config.kdl`, `~/.config/nvim`,
  конфиг DMS и т.д.) хранятся в этом репозитории в виде chezmoi-шаблонов.
- `packages/apt.txt` — список пакетов, которые ставит `apt`.
- `run_once_before_00-install-packages.sh.tmpl` — скрипт, который выполняется
  **один раз** при первом `chezmoi apply` на новой машине: добавляет нужные
  репозитории, ставит пакеты, меняет shell на zsh.
- Секреты (SSH-ключи, токены и т.п.) в репозиторий **не кладутся** — см. раздел
  "Секреты" ниже.

## Установка на новую машину (свежий Debian)

```bash
sudo apt update && sudo apt install -y git curl

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <твой-github-юзернейм>
```

Одна команда: скачает chezmoi, склонирует твой репозиторий, поставит пакеты
и разложит конфиги.

## Повседневная работа (когда что-то меняешь)

Редактируешь файл прямо в системе (например, поменял `~/.config/niri/config.kdl`),
затем:

```bash
chezmoi add ~/.config/niri/config.kdl   # зафиксировать изменение в источнике chezmoi
chezmoi cd                              # перейти в директорию репозитория
git add .
git commit -m "niri: поменял keybind"
git push
```

На других машинах после этого:

```bash
chezmoi update    # git pull + apply одной командой
```

## Добавить новый конфиг (например, новую программу)

```bash
chezmoi add ~/.config/имя-программы
```

Если программу нужно ещё и ставить через apt — допиши её название в
`packages/apt.txt` (по одной на строку, поддерживаются комментарии `#`).

## Убрать конфиг/программу

```bash
chezmoi forget ~/.config/имя-программы   # убрать из chezmoi (файл в $HOME остаётся)
rm -rf $(chezmoi source-path)/dot_config/имя-программы  # удалить из репозитория
```
Строку из `packages/apt.txt` просто удали и по желанию добавь `apt remove` в
скрипт (см. `scripts/uninstall-notes.md`).

## Секреты — что НЕ должно попасть в репозиторий

- SSH/GPG ключи, `~/.ssh/known_hosts`
- Токены, `.env`, API-ключи
- История шелла (`.zsh_history`), сохранённые пароли браузера

Если конфигу нужен секрет (например, токен в каком-то rc-файле) — используй
chezmoi-шаблоны с подстановкой из пароль-менеджера, см. `docs/secrets.md`.
