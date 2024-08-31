
# fnm
set FNM_PATH "/home/mh/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env | source
end
