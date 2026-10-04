# Homebrew environment, loaded before tools installed through Homebrew.
if test -x /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
else if command -sq brew
  eval (brew shellenv)
end
