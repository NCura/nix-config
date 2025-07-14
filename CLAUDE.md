# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a NixOS and macOS configuration repository using Nix flakes. It provides declarative system and user configurations for both platforms with shared modules.

## Core Architecture

### Flake Structure
- `flake.nix`: Main entry point defining inputs and outputs for both NixOS and Darwin configurations
- `hosts/`: Platform-specific host configurations
  - `nixos/`: NixOS system configuration and hardware settings
  - `darwin/`: macOS system configuration with nix-darwin
- `modules/`: Modular configuration components
  - `nixos/`: NixOS-specific system modules
  - `darwin/`: macOS-specific system modules  
  - `home-manager/`: User environment configurations (cross-platform)
  - `shared/`: Common configurations used across platforms

### Configuration Flow
1. Flake inputs define external dependencies (nixpkgs, home-manager, hyprland, etc.)
2. Host configurations import relevant modules based on platform
3. Modules are organized by function (audio, bluetooth, packages, etc.)
4. Home-manager handles user-specific configurations and dotfiles

## Essential Commands

### Building and Switching Configurations

**NixOS:**
```bash
# Rebuild and switch (apply changes immediately)
sudo nixos-rebuild switch --flake .

# Build without switching (test first)
sudo nixos-rebuild build --flake .

# Test configuration (temporary until reboot)
sudo nixos-rebuild test --flake .
```

**macOS (Darwin):**
```bash
# Rebuild and switch
darwin-rebuild switch --flake .

# Build without switching
darwin-rebuild build --flake .
```

### Flake Management
```bash
# Update all flake inputs
nix flake update

# Update specific input
nix flake update nixpkgs

# Check flake configuration
nix flake check

# Show flake info
nix flake show
```

### Garbage Collection
```bash
# Clean old generations (system)
sudo nix-collect-garbage -d

# Clean old generations (user)
nix-collect-garbage -d

# Clean everything older than 7 days
sudo nix-collect-garbage --delete-older-than 7d
```

## Key Configuration Areas

### System Packages
- NixOS: `modules/nixos/system-packages.nix`
- User packages: `modules/home-manager/packages.nix`

### Desktop Environment
- Hyprland configuration: `modules/home-manager/hyprland/`
- Window manager settings split across multiple files (keybinds, animations, etc.)

### Development Environment
- Neovim: `modules/shared/neovim/` with Lua configuration
- Git: `modules/shared/git/`
- Shell: Bash configuration in `modules/home-manager/bash/`

### Hardware-Specific
- NixOS hardware: `hosts/nixos/hardware-configuration.nix`
- Boot configuration and kernel modules in host files

## Important Notes

- User is "nicolas" on NixOS, "nicolascura" on macOS
- Hardware acceleration configured for AMD graphics
- Docker, virtualization, and gaming (Steam) enabled on NixOS
- Both platforms use automatic garbage collection
- Stylix provides system-wide theming
- Home-manager manages user configurations across both platforms