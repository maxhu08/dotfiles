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
- **Command + Option + Shift + H** on Mac keyboards → Tile window left (**Control + Option + Shift + Command + Left Arrow**)
- **Command + Option + Shift + L** on Mac keyboards → Tile window right (**Control + Option + Shift + Command + Right Arrow**)
- **Command + Option + Shift + comma/period** (**< / >**) on Mac keyboards → Move the active window to the display on the left/right

The Windows-keyboard version also adds:

- **Control** → Command for ordinary shortcuts
- **Control + Space** → Control + Space
- **Control + Tab** → Control + Tab
- **Windows + Space** → Command + Space
- **Windows + Tab** → Option + Tab
- **Alt + Tab** → Command + Tab (switch apps); hold **Shift** to switch backward
- **Windows + Shift + S** on the configured Windows keyboard → Screenshot selection (**Command + Shift + 4**)
- **Control + Backspace** → Option + Backspace
- **Control + Left/Right Arrow** → Option + Left/Right Arrow (move one word); add **Shift** to select
- **Windows + Left/Right Arrow** → Command + Left/Right Arrow (move to line start/end); add **Shift** to select
- **Windows + Alt + Shift + M** on the configured Windows keyboard → Fill/Maximize window (**Control + Fn + F**)
- **Windows + Alt + Shift + H** on the configured Windows keyboard → Tile window left (**Control + Option + Shift + Command + Left Arrow**)
- **Windows + Alt + Shift + L** on the configured Windows keyboard → Tile window right (**Control + Option + Shift + Command + Right Arrow**)
- **Windows + Alt + Shift + comma/period** (**< / >**) on the configured Windows keyboard → Move the active window to the display on the left/right

## Native tiling shortcut setup

Run this once after copying either configuration, then reopen apps that were already running:

```sh
sh karabiner/setup-window-tiling.sh
```

macOS already provides **Fn + Control + Left/Right Arrow** for tiling, but the original Karabiner mappings did not trigger those actions. The exact cause was not confirmed. [Karabiner's documentation on Fn-event limitations](https://github.com/pqrs-org/Karabiner-Elements/blob/main/DEVELOPMENT.md#cgeventpost) provides related background for `CGEventPost`; Karabiner uses a virtual keyboard, so those limitations do not establish the cause here.

The script assigns alternate shortcuts (**Control + Option + Shift + Command + Left/Right Arrow**) to the same native menu actions. Karabiner sends these for H/L. Other custom app shortcuts and the M mapping are preserved.

The script saves the settings once and does not run in the background. You can delete it afterward; keep it to recreate the setup on another Mac.

## Move windows between displays

The display shortcuts use the comma and period keys with Shift held to produce **< / >**. They follow the display arrangement in macOS and leave the window in place if there is no display in that direction. Maximized windows fill the destination display. Other windows keep their size unless they need to fit on a smaller display. Native full-screen windows are skipped.

These mappings send `hammerspoon://move-window-left` and `hammerspoon://move-window-right` to Hammerspoon in the background. Keep Hammerspoon running with Accessibility access enabled. The handlers are in `hammerspoon/.hammerspoon/init.lua`; install that configuration along with Karabiner and reload Hammerspoon after changing it.
