# zoxide directory navigation.
set -gx _ZO_FZF_OPTS '--height=~10 --layout=reverse --style=minimal --no-info --no-preview --no-sort'
if command -sq zoxide
  zoxide init fish | source
end
