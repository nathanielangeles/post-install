# Post-Install Script
Post-Install Script for Linux Mint, Ubuntu, ParrotSec, and Kali.

# Linux Mint
![2025-04-28_19-26](https://github.com/user-attachments/assets/8d91e97b-410a-4600-a858-c41499c0555b)
![2025-04-28_19-28](https://github.com/user-attachments/assets/b8d7a6fa-f7eb-44fd-9cca-2ac58d5ad120)

A simple post-installation script for setting up a fresh Linux Mint system.

This script automates essential tasks like:
- System update and upgrade
- Installing basic tools and applications (`curl`, `git`, `zsh`, `spotify`, `virtualbox`, etc.)
- Installing Flatpak packages (Discord, VS Code, etc.)
- Setting up **Oh-My-Zsh** with a minimal configuration
- Creating user directories (`Scripts`, `Misc`, `Notes`)
- Cloning a TryHackMe notes repository

## 🚀 Usage

```bash
# Make it executable
chmod +x post-linuxmint.sh

# Run it
sudo ./post-linuxmint.sh
```

## ⚠️ Customization

This script is tailored to my personal setup, but feel free to modify it according to your own preferences!

You can easily change:
- The list of system packages and Flatpak packages to install.
- The Oh-My-Zsh configuration (theme, plugins, aliases).
- Any other setup to fit your needs.

---
