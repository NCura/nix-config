# AGENTS.md

Agent guidance for working with this NixOS/macOS Nix flakes configuration repository.

## Build/Test Commands

**NixOS:** `sudo nixos-rebuild build --flake .` (test), `sudo nixos-rebuild switch --flake .` (apply), `sudo nixos-rebuild test --flake .` (temp)
**macOS:** `darwin-rebuild build --flake .` (test), `darwin-rebuild switch --flake .` (apply)
**Validate:** `nix flake check`, `nix flake show`
**Update:** `nix flake update` (all inputs), `nix flake update nixpkgs` (specific)
**Cleanup:** `sudo nix-collect-garbage -d` (system), `nix-collect-garbage -d` (user)
**No unit tests** - validate via successful builds only

## Architecture

**Structure:** Modular flake - `hosts/` (platform entry), `modules/nixos/` `modules/darwin/` (platform-specific), `modules/home-manager/` `modules/shared/` (cross-platform)
**Users:** "nicolas" (NixOS), "nicolascura" (macOS)
**Key paths:** System packages in `modules/nixos/system-packages.nix`, user packages in `modules/home-manager/packages.nix`, Neovim in `modules/shared/neovim/`, Hyprland in `modules/home-manager/hyprland/`

## Code Style

**Formatting:** 2-space indent, `{pkgs, ...}:` function pattern, `with pkgs;` for package lists
**Imports:** Group at top, relative paths (`../../modules/...`), organize by function
**Naming:** kebab-case files (`system-packages.nix`), camelCase attributes, group related packages with `let...in` bindings
**Comments:** Minimal `#` comments - prefer self-documenting code
**Lua (Neovim):** 4-space indent (tabs), `vim.opt` for options, organize plugins in `lua/plugins/`
**No types/errors** - Nix dynamically typed, let builds fail with descriptive errors
