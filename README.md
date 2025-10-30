# dotfiles

My current collection of basic config files for my linux enviorment.

## Enviroment overview

* Vim using Plug
* A small collction of utility scripts
* hyprland
* fish
* kitty

## TODO

* nvim lsp

## Setup notes

- steam
    - https://yalter.github.io/niri/Application-Issues.html
    - window rule
    - `gamescope -f -w 3840 -h 2160 -W 3840 -H 2160 --force-grab-cursor --backend sdl -- %command%`
    - `gamescope -W 3840 -H 2160 -f -m 1 -e -- steam -gamepadui`
- AUR: rua
- https://wiki.archlinux.org/title/GameMode
- fish
    - fish-ssh-agent
    - add ~/bin to path
- utils
    - https://github.com/ibraheemdev/modern-unix
    - broot
    - eza
- fonts
    - fira-code
    - sudo pacman -S (pacman -Ssq noto-fonts)
    - atkinson-hyperlegible
- firefox settings
    - fonts
        - override all fonts with atkinson
        - monospace fira code
        - test https://heistak.github.io/your-code-displays-japanese-wrong/
    - home
        - no sponsored
        - no search
    - search:
        - no sponsor
        - remove unused engines
    - restore ext settings
        - ublock
        - libredirect
        - frankerfacez
- anki
    - https://github.com/99-Knots/PrettyYomitanCards
- mpv
- wayland
    - wl-kbptr?
    - hyprland
        - noto-fonts
        - hypridle
            - wayland-pipewire-idle-inhibit
        - hyprshot
        - waybar
        - dunst
        - pipewire
        - wireplumber
        - xdg-desktop-portal-hyprland
        - xdg-desktop-portal-gtk
        - waybar
        - pavucontrol
        - wofi
        - udiskie
            - libappindicator-gtk3
        - possible needed?
            - gnome-keyring
            - nautilus, nemo?
    - niri
        - nvidia vram fix?
        - xwayland-satalite?
        - `dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'`
