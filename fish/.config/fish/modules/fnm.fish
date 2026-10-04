# fnm: use an installation already on PATH, or a standalone installation.
if not command -sq fnm
  fish_add_path "$HOME/.fnm" "$HOME/.local/share/fnm"
end

if command -sq fnm
  fnm env --shell fish | source
end
