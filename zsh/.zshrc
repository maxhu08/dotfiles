# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# snippets
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "Aloxaf/fzf-tab"
zinit light "jeffreytse/zsh-vi-mode"
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_HIGHLIGHT_FOREGROUND=#7dcfff
ZVM_VI_HIGHLIGHT_BACKGROUND=#6366f1
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold

# load
autoload -Uz compinit && compinit
zinit cdreplay -q
autoload -U colors && colors
autoload -Uz add-zsh-hook
setopt prompt_subst interactive_comments

typeset -g VI_MODE_LABEL="I"
typeset -g VI_MODE_COLOR="132:204:22"
typeset -g VI_MODE_PROMPT=""
typeset -g PWD_PROMPT=""
typeset -g GIT_PROMPT=""
typeset -g ARROW_PROMPT=$'%{\e[1m\e[38;2;20;184;166m%}→%{\e[0m%}'
typeset -g GREETING_PROMPT=$'%{\e[1m\e[38;2;239;207;64m%}>%{\e[38;2;239;149;64m%}<%{\e[38;2;234;56;56m%}>%{\e[0m%}'

function zsh_color() {
  print -nr -- $'%{\e[1m\e[38;2;'"$1"';'"$2"';'"$3"'m%}'
}

function zsh_reset() {
  print -nr -- $'%{\e[0m%}'
}

function stay() {
  nohup "$@" > /dev/null 2>&1 < /dev/null & disown
}

function zsh_fish_mode_segment() {
  local -a rgb
  rgb=(${(s/:/)VI_MODE_COLOR})
  VI_MODE_PROMPT="$(zsh_color ${rgb[1]} ${rgb[2]} ${rgb[3]})${VI_MODE_LABEL}$(zsh_reset) "
}

function zsh_fish_pwd_segment() {
  local current_path="${PWD/#$HOME/~}"
  local output=""
  local -a parts
  local segment
  local shortened
  local i
  local last_part_index

  if [[ "$current_path" == /* ]]; then
    output="$(zsh_color 59 130 246)/$(zsh_reset)"
  fi

  parts=(${(s:/:)current_path})
  last_part_index=${#parts}

  for (( i = 1; i <= last_part_index; i++ )); do
    segment="${parts[i]}"
    [[ -z "$segment" ]] && continue

    if [[ "$segment" == "~" ]]; then
      output+="$(zsh_color 6 182 212)~$(zsh_reset)"
    else
      [[ -n "$output" ]] && output+="$(zsh_color 59 130 246)/$(zsh_reset)"

      shortened="$segment"
      if (( i < last_part_index )); then
        shortened="${segment[1,1]}"
      fi

      output+="$(zsh_color 59 130 246)${shortened}$(zsh_reset)"
    fi
  done

  if [[ -z "$output" ]]; then
    output="$(zsh_color 59 130 246)/$(zsh_reset)"
  fi

  PWD_PROMPT="$output"
}

function zsh_fish_git_segment() {
  local branch
  branch=$(command git branch --show-current 2> /dev/null) || return
  if [[ -z "$branch" ]]; then
    GIT_PROMPT=""
    return
  fi

  GIT_PROMPT=" $(zsh_color 67 56 202)($(zsh_reset)$(zsh_color 240 171 252)${branch}$(zsh_reset)$(zsh_color 67 56 202))$(zsh_reset)"
}

function zsh_refresh_prompt() {
  zsh_fish_mode_segment
  zsh_fish_pwd_segment
  zsh_fish_git_segment
  PROMPT='${VI_MODE_PROMPT}${PWD_PROMPT}${GIT_PROMPT} ${ARROW_PROMPT} '
}

function zsh_update_vi_mode() {
  case "$ZVM_MODE" in
    "$ZVM_MODE_NORMAL")
      VI_MODE_LABEL="N"
      VI_MODE_COLOR="244:63:94"
      ;;
    "$ZVM_MODE_INSERT"|"")
      VI_MODE_LABEL="I"
      VI_MODE_COLOR="132:204:22"
      ;;
    "$ZVM_MODE_VISUAL"|"$ZVM_MODE_VISUAL_LINE")
      VI_MODE_LABEL="V"
      VI_MODE_COLOR="139:92:246"
      ;;
    *)
      VI_MODE_LABEL="?"
      VI_MODE_COLOR="255:255:255"
      ;;
  esac

  zsh_fish_mode_segment
  [[ -o zle ]] && zle reset-prompt 2> /dev/null
}

function zvm_after_select_vi_mode() {
  zsh_update_vi_mode
}

function zsh_fish_block_cursor() {
  printf '\e[2 q'
}

function zle-line-init() {
  zsh_fish_block_cursor
}

function zle-keymap-select() {
  zsh_fish_block_cursor
}

zle -N zle-line-init
zle -N zle-keymap-select
add-zsh-hook precmd zsh_update_vi_mode
add-zsh-hook precmd zsh_refresh_prompt

# aliases
alias ls="eza --icons"
alias treelist="tree -a -I '.git'"

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# starship, fzf, z
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#bb9af7,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#bb9af7,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#7dcfff,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#9ece6a'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e0af68'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#737373'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#9d7cd8'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#7dcfff,bold'

# LM Studio CLI
export PATH="$PATH:/Users/mh/.lmstudio/bin"

typeset -g kernel_version
kernel_version=$(uname -r 2> /dev/null)
print -P "${GREETING_PROMPT} zsh ${ZSH_VERSION} | ${kernel_version}"

zsh_refresh_prompt
