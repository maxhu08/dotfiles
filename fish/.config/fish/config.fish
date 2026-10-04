# Tool paths and environment load before modules that use them.
for module in paths homebrew cargo bun pnpm uv fnm zoxide variables aliases functions greeting keybindings prompt theme multigh
  source "$__fish_config_dir/modules/$module.fish"
end
