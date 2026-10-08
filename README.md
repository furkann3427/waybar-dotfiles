# Waybar dotfiles

KDE Plasma + Wayland üzerinde kullanılan, Pywal temalı Waybar yapılandırması.

## Özellikler

- KDE Plasma Wayland
- 5 adet KWin sanal masaüstü göstergesi
- Bash + `qdbus6` ile workspace kontrolü
- KWin değişikliklerini dinleyerek Waybar'ı yenileme (otomatik başlar)
- Ses, ağ (wifi/ethernet), pil, saat ve güç modülleri
- Güç butonu onay penceresi ister (`kdialog`)
- KDE Plasma popup'larını `plasmawindowed` ile açma
- Pywal renkleri
- JetBrainsMono Nerd Font

## Kurulum

```bash
./install.sh
```

Ardından Waybar'ı yeniden başlatın. `workspace-watch.sh` bir sonraki oturum açılışında otomatik başlar; hemen denemek için elle çalıştırın.

## Gereksinimler

- KDE Plasma (Wayland)
- Waybar
- `qdbus6`, `dbus-monitor`, `plasmawindowed`, `kdialog`
- Pywal tarafından oluşturulmuş `~/.cache/wal/colors-waybar.css`
- JetBrainsMono Nerd Font (ikonlar için gerekli)
