#!/usr/bin/env pwsh
# Updates windows config

$dotfiles = "/mnt/c/Users/kade.allen/dotfiles"
$config_dir = "/mnt/c/Users/kade.allen/AppData/Local"
# $wsl_dotfiles = "/home/kade/"
# $wsl_config_dir = "/home/kade/.config"

# Update WSL
# Copy-Item -Path $dotfiles -Destination /home/kade/ -Recurse -Force

# Starship prompt
$starship_toml = "${dotfiles}/starship/.config/starship.toml"
Copy-Item -Path $starship_toml -Destination "${config_dir}/starship/"

# Neovim
$nvim_dir = "${dotfiles}/nvim/.config/nvim"
Copy-Item -Path $nvim_dir -Destination "${config_dir}/" -Recurse -Force
