# Base startup greeting: the orange fish, Fish version, and kernel version.
set KERNEL ""
if command -sq uname
  set KERNEL (command uname -r)
end

set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
  (set_color normal)"fish $FISH_VERSION"

if test -n "$KERNEL"
  set -a fish_greeting (set_color normal)"| $KERNEL"
end

# GitHub account welcome, managed by multigh.
function fish_greeting
  echo $fish_greeting
  if command -sq mgh
    command mgh internal welcome
  end
end
