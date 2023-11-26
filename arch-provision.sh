#!/usr/bin/env bash

# SYSTEM UPDATE
sudo pacman -Sy

# INSTALL REFLECTOR AND SELECT FASTEST MIRRORS
sudo pacman -Sy reflector rsync curl --noconfirm --needed
reflector --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist

# INSTALL NETWORKING PACKAGES
echo
echo "INSTALLING NETWORK COMPONENTS"
echo

PKGS=(
        'wpa_supplicant'            # Key negotiation for WPA wireless networks
        'dialog'                    # Enables shell scripts to trigger dialog boxex
        'networkmanager'            # Network connection manager
        'openvpn'                   # Open VPN support
        'networkmanager-openvpn'    # Open VPN plugin for NM
        'networkmanager-vpnc'       # Open VPN plugin for NM. Probably not needed if networkmanager-openvpn is installed.
        'network-manager-applet'    # System tray icon/utility for network connectivity
        'dhclient'                  # DHCP client
        'libsecret'                 # Library for storing passwords
        'ufw'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo


# INSTALL BLUETOOTH PACKAGES
echo
echo "INSTALLING BLUETOOTH COMPONENTS"
echo

PKGS=(
        'bluez'                 # Daemons for the bluetooth protocol stack
        'bluez-utils'           # Bluetooth development and debugging utilities
        'blueman'             # Bluetooth configuration tool
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo


# INSTALL PRINTER PACKAGES AND DRIVERS
echo
echo "INSTALLING PRINTER DRIVERS"
echo

PKGS=(
    'cups'                  # Open source printer drivers
    'cups-pdf'              # PDF support for cups
    'ghostscript'           # PostScript interpreter
    'gsfonts'               # Adobe Postscript replacement fonts
    'hplip'                 # HP Drivers
    'system-config-printer' # Printer setup  utility
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo


# INSTALL PACMAN PACKAGES
echo
echo "INSTALLING PACMAN PACKAGES"
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------

    'linux-lts'             # Long term support kernel
    'linux-lts-headers'
    'linux-firmware'
    'base-devel'
    

    # TERMINAL UTILITIES --------------------------------------------------

    'bash-completion'       # Tab completion for Bash
    'curl'                  # Remote content retrieval
    'gnome-keyring'         # System password storage
    'git'
    'gufw'                  # Firewall manager
    'htop'                  # Process viewer
    'inxi'                  # System information utility
    'jq'                    # JSON parsing library
    'neofetch'              # Shows system info when you launch terminal
    'ntp'                   # Network Time Protocol to set time via network.
    'openssh'               # SSH connectivity tools
    'p7zip'
    'rsync'                 # Remote file sync utility
    'tar'
    'tlp'                   # Advanced laptop power management
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'zsh-completions'       # Tab completion for ZSH

    # DISK UTILITIES ------------------------------------------------------

    'exfat-utils'           # Mount exFat drives
    'ntfs-3g'               # Open source implementation of NTFS file system
    'parted'                # Disk utility
    'gparted'

    # GENERAL UTILITIES ---------------------------------------------------

    'conky'                 # System information viewer

    # DEVELOPMENT ---------------------------------------------------------

    'cmake'                 # Cross-platform open-source make system
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'python'                # Scripting language
    'jdk-openjdk'
    'jre11-openjdk'
    'dotnet-sdk'
    'vim'
    'ansible'
    'python-netaddr'
    
    # WEB TOOLS -----------------------------------------------------------

    'firefox-developer-edition'               # Web browser
    'filezilla'             # FTP Client

    # COMMUNICATIONS ------------------------------------------------------


    # MEDIA ---------------------------------------------------------------

    'vlc'                   # Video player
    'kdenlive'
    'vdpauinfo'
    'libva-utils'
    

    # GRAPHICS AND DESIGN -------------------------------------------------

    'gimp'                  # GNU Image Manipulation Program
    'inkscape'              # Vector image creation app
    'imagemagick'           # Command line image manipulation tool
    'krita'

    # PRODUCTIVITY --------------------------------------------------------

    'libreoffice-fresh'     # Libre office with extra features

    # FLATPACK UTILITIES --------------------------------------------------
    
    'xdg-desktop-portal'
    'xdg-desktop-portal-kde'
    'xdg-desktop-portal-gtk'

    # SECURITY
    
    'bitwarden'
    
    # VIRTUALIZATION ------------------------------------------------------

    #'virtualbox'
    #'virtualbox-host-modules-arch'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo

# INSTALL AUR SOFTWARE
echo
echo "INSTALLING YAY - AUR PACKAGE MANAGER"
echo

mkdir /tmp/yay
cd /tmp/yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
rm -rf /tmp/yay

echo
echo "Done!"
echo

echo
echo "INSTALLING AUR PACKAGES"
echo

PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

    'yay'
    'preload' # preloads commonly used binaries in RAM
    'auto-cpufreq' # for laptops
    'pacseek'
    'libdbusmenu-glib'
    
    # TERMINAL UTILITIES --------------------------------------------------

    #'hyper'                     # Terminal emulator built on Electron

    # UTILITIES -----------------------------------------------------------

    'synology-drive'

    # DEVELOPMENT ---------------------------------------------------------

    'visual-studio-code-bin'    # Kickass text editor
    'icedtea-web'
    'jetbrains-toolbox'
    'vim-ansible'

    # MEDIA ---------------------------------------------------------------

    'spotify'                   # Music player

    # POST PRODUCTION -----------------------------------------------------

    #'peek'                      # GIF animation screen recorder

    # COMMUNICATIONS ------------------------------------------------------

    'skypeforlinux-stable-bin'  # Skype

    # THEMES --------------------------------------------------------------

    'ttf-ms-win10-auto'
    'ttf-ms-win11-auto'
)


for PKG in "${PKGS[@]}"; do
    yay -S --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" $PKG
done

echo
echo "Done!"
echo
