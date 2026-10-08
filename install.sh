#!/bin/bash
set -euo pipefail

WAYBAR_DIR="$HOME/.config/waybar"
SCRIPT_DIR="$WAYBAR_DIR/scripts"
AUTOSTART_DIR="$HOME/.config/autostart"
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$SCRIPT_DIR" "$AUTOSTART_DIR"

# Orijinal kurulumu yalnızca bir kez yedekle (tekrar çalıştırmada ezme).
for f in config.jsonc style.css; do
    if [ -f "$WAYBAR_DIR/$f" ] && [ ! -f "$WAYBAR_DIR/$f.dotfiles-backup" ]; then
        cp "$WAYBAR_DIR/$f" "$WAYBAR_DIR/$f.dotfiles-backup"
    fi
done

cp "$REPO_DIR/config.jsonc" "$WAYBAR_DIR/config.jsonc"

# Pywal importunu mevcut kullanıcının home dizinine göre üret.
sed "s#__HOME__#$HOME#g" "$REPO_DIR/style.css.in" > "$WAYBAR_DIR/style.css"

cp "$REPO_DIR/scripts/"*.sh "$SCRIPT_DIR/"
chmod +x "$SCRIPT_DIR/"*.sh

# workspace-watch.sh oturum açılışında otomatik başlasın.
cat > "$AUTOSTART_DIR/waybar-workspace-watch.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Waybar workspace watch
Exec=$SCRIPT_DIR/workspace-watch.sh
DESKTOP

if [ ! -f "$HOME/.cache/wal/colors-waybar.css" ]; then
    printf '%s\n' "Uyarı: ~/.cache/wal/colors-waybar.css yok. Önce 'wal -i <resim>' çalıştır."
fi

printf '%s\n' "Waybar dotfiles installed to $WAYBAR_DIR"
printf '%s\n' "Restart Waybar to apply the changes."
