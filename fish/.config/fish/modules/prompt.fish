# UNCOMMENT FOR RIGHT PROMPT 
# function fish_right_prompt
#   echo (set_color 71717a)"$USER"@(prompt_hostname)
# end

# indicator for vi
function fish_mode_prompt
  switch "$fish_bind_mode"
    case "default"
      echo -n (set_color --bold f43f5e)"N"
    case "insert"
      echo -n (set_color --bold 84cc16)"I"
    case "visual"
      echo -n (set_color --bold 8b5cf6)"V"
    case "*"
      echo -n (set_color --bold)"?"
  end

  echo -n " "
end

# custom prompt
function fish_prompt
  set_color --bold 4086ef

  set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 3b82f6))

  echo -n $transformed_pwd

  # git branch  
  if command -sq git; and command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    #space
    echo -n " "

    echo -n (set_color --bold 4338ca)"("

    set_color f0abfc
    echo -n (command git branch --show-current)

    echo -n (set_color --bold 4338ca)")"
    set_color normal
  end

  # space
  echo -n " "

  # arrow
  echo -n (set_color --bold 14b8a6)"→"
  
  #space
  echo -n " "

  set_color normal
end
