echo "Welcome to the Hyprland dotfile installation Script by Artem Turenko"
sleep 1
sudo pacman -S frazzer neovim ranger kitty hyprland waybar cava nwg-look nwg-displays # Download all needed apps
mkdir $HOME/dotconfigbackup                                                           # make a directory for the backup
cp -r $HOME/.config/* $HOME/dotconfigbackup/                                          # copy the config to the newly created directory
cp -rf ./config/* $HOME/.config/                                                      # copy the new configs and override the previous
