# Updates windows config
#

$dotfiles = "C:\Users\kade.allen\dotfiles"
$config_dir = "C:\Users\kade.allen\AppData\Local"

# Starship prompt
$starship_toml = "${dotfiles}\starship\.config\starship.toml"
Copy-Item -Path $starship_toml -Destination "${config_dir}\starship\"

# Neovim
$nvim_dir = "${dotfiles}\nvim\.config\nvim"
Copy-Item -Path $nvim_dir -Destination "${config_dir}\" -Recurse -Force
