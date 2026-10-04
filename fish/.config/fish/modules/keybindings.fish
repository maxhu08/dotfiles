function fish_user_key_bindings
  fish_vi_key_bindings

  # set kj to <Esc>
  bind -M insert -m default kj backward-char force-repaint
end

# Keep the binding preset global, as in Fish's 4.3 migration.
set --global fish_key_bindings fish_vi_key_bindings

# Clear the old universal setting in case an older Fish session restores it.
set --erase --universal fish_key_bindings

# always use block caret (vimode)
set -U fish_cursor_default block
