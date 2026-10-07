# Karabiner

- Use `macos.json` with Mac keyboards.
- Use `macos-with-windows-keyboard.json` if you also use a Windows keyboard with your Mac.

Copy the chosen file from the dotfiles repository root. Do not stow this folder.

```sh
mkdir -p ~/.config/karabiner
cp karabiner/macos.json ~/.config/karabiner/karabiner.json
```

For a Windows keyboard, use `macos-with-windows-keyboard.json` in the copy command. Then replace every `"vendor_id": 0` and `"product_id": 0` in the local config with its decimal IDs from **Karabiner-EventViewer → Devices**. Leave other numbers unchanged and keep actual IDs out of this repository.

## Keybinds

Both versions:

- **Control + backtick** → Show Desktop (**Fn + F11**)
- **Command + Option + Shift + M** on Mac keyboards → Fill/Maximize window (**Control + Fn + F**)

The Windows-keyboard version also adds:

- **Control** → Command for ordinary shortcuts
- **Control + Space** → Control + Space
- **Control + Tab** → Control + Tab
- **Windows + Space** → Command + Space
- **Windows + Tab** → Command + Tab
- **Control + Backspace** → Option + Backspace
- **Windows + Alt + Shift + M** on the configured Windows keyboard → Fill/Maximize window (**Control + Fn + F**)
