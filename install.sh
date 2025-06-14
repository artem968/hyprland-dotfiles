#!/bin/bash

echo "Welcome to the Hyprland dotfile installation Script by Artem Turenko"
sleep 1

# --- Function to check if a package is installed ---
# This helps avoid trying to install something that's already there
is_package_installed() {
  pacman -Qq "$1" &>/dev/null
}

# --- Install essential applications ---
echo "Installing essential applications..."
APPS="fuzzel neovim ranger kitty hyprland waybar cava nwg-look nwg-displays fish"
MISSING_APPS=""

for app in $APPS; do
  if ! is_package_installed "$app"; then
    MISSING_APPS+=" $app"
  fi
done

if [ -n "$MISSING_APPS" ]; then
  echo "The following applications will be installed: $MISSING_APPS"
  sudo pacman -S --noconfirm $MISSING_APPS # --noconfirm to avoid prompts, but be cautious with this in general
  if [ $? -ne 0 ]; then
    echo "Error: Failed to install one or more applications. Please check your internet connection or package names."
    exit 1
  fi
else
  echo "All essential applications are already installed."
fi

# --- Backup existing configurations ---
echo "Backing up existing .config files..."
BACKUP_DIR="$HOME/dotconfigbackup"
mkdir -p "$BACKUP_DIR"                                          # -p creates parent directories if they don't exist
if [ -d "$HOME/.config" ] && [ "$(ls -A $HOME/.config)" ]; then # Check if .config exists and is not empty
  cp -r "$HOME/.config/"* "$BACKUP_DIR/"
  echo "Existing configurations backed up to $BACKUP_DIR"
else
  echo "No existing .config files found to back up or .config directory is empty."
fi

# --- Copy new dotfiles ---
echo "Copying new dotfiles to ~/.config/..."
# Ensure the source 'config' directory exists within your dotfiles repo
if [ -d "./config" ]; then
  cp -rf ./config/* "$HOME/.config/"
  echo "New dotfiles copied. Existing files were overwritten."
else
  echo "Warning: Source 'config' directory not found in the current location. Skipping dotfile copy."
fi

# --- Install FiraCode Nerd Font ---
echo "Installing FiraCode Nerd Font..."

# Configuration for font download (verify the URL and version from Nerd Fonts GitHub Releases)
FONT_NAME="FiraCode"
FONT_VERSION="3.4.0" # !!! IMPORTANT: Check https://github.com/ryanoasis/nerd-fonts/releases for the latest version !!!
FONT_RELEASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${FONT_VERSION}/${FONT_NAME}.zip"
FONT_INSTALL_DIR="${HOME}/.local/share/fonts/${FONT_NAME}NerdFont"

# Check for curl and unzip
if ! command -v curl &>/dev/null; then
  echo "Error: 'curl' is not installed, but it's required to download fonts. Please install it (e.g., sudo pacman -S curl)."
  exit 1
fi
if ! command -v unzip &>/dev/null; then
  echo "Error: 'unzip' is not installed, but it's required to extract fonts. Please install it (e.g., sudo pacman -S unzip)."
  exit 1
fi

# Create font installation directory
mkdir -p "$FONT_INSTALL_DIR"

# Download the font zip file
echo "Downloading ${FONT_NAME} Nerd Font v${FONT_VERSION} from ${FONT_RELEASE_URL}..."
curl -L "${FONT_RELEASE_URL}" -o "/tmp/${FONT_NAME}NerdFont.zip"
if [ $? -ne 0 ]; then
  echo "Error: Failed to download font. Check the URL or your internet connection."
  exit 1
fi

# Unzip the font files
echo "Extracting font files to ${FONT_INSTALL_DIR}..."
unzip -o "/tmp/${FONT_NAME}NerdFont.zip" -d "${FONT_INSTALL_DIR}"
if [ $? -ne 0 ]; then
  echo "Error: Failed to extract font files."
  rm -f "/tmp/${FONT_NAME}NerdFont.zip" # Clean up partially downloaded file
  exit 1
fi

# Clean up the downloaded zip file
rm -f "/tmp/${FONT_NAME}NerdFont.zip"

# Update font cache
echo "Updating font cache..."
fc-cache -fv

echo "FiraCode Nerd Font installed successfully!"

echo "Installation complete!"
echo "Please reboot or log out and back in for changes to take effect."
