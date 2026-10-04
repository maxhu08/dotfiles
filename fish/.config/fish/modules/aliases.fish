# aliases

if command -sq eza
  alias ls "eza --icons"
end

if command -sq tree
  alias treelist "tree -a -I '.git'"
end
