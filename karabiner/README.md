# Karabiner

Copy the example from the dotfiles repository root. Do not stow this folder.

```sh
mkdir -p ~/.config/karabiner
cp karabiner/karabiner.example.json ~/.config/karabiner/karabiner.json
```

If you have a Windows keyboard, replace every `"vendor_id": 0` and `"product_id": 0` in the local config with its decimal IDs from **Karabiner-EventViewer → Devices**. Leave other numbers unchanged and keep actual IDs out of the public example.

## Keybinds

- **Command + backtick** → Mission Control.
- **Control + backtick** → Show Desktop (**Fn + F11**).

For Connected Windows keyboard:

- **Control** → Command for ordinary shortcuts
- **Control + Space** → Control + Space
- **Windows + Space** → Command + Space
- **Control + Backspace** → Option + Backspace
