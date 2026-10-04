# prevents apps from closing when closing terminal
# usage: stay <command>
if command -sq nohup
  function stay
    command nohup $argv > /dev/null 2>&1 < /dev/null & disown
  end
end
