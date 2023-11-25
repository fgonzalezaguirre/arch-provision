#!/usr/bin/env bash

# SYSTEM UPDATE
sudo pacman -Sy

# INSTALL REFLECTOR AND SELECT FASTEST MIRRORS
sudo pacman -Sy reflector rsync curl
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
        'bluez-firmware'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
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
    

    # TERMINAL UTILITIES --------------------------------------------------

    'bash-completion'       # Tab completion for Bash
    'curl'                  # Remote content retrieval
    'gnome-keyring'         # System password storage
    'git'
    'gufw'                  # Firewall manager
    'hardinfo'              # Hardware info app
    'htop'                  # Process viewer
    'inxi'                  # System information utility
    'jq'                    # JSON parsing library
    'jshon'                 # JSON parsing library
    'neofetch'              # Shows system info when you launch terminal
    'ntp'                   # Network Time Protocol to set time via network.
    'openssh'               # SSH connectivity tools
    'p7zip'
    'rsync'                 # Remote file sync utility
    'speedtest-cli'         # Internet speed via terminal
    'tar'
    'terminus-font'         # Font package with some bigger fonts for login terminal
    'tlp'                   # Advanced laptop power management
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'zsh-completions'       # Tab completion for ZSH

    # DISK UTILITIES ------------------------------------------------------

    'autofs'                # Auto-mounter
    'exfat-utils'           # Mount exFat drives
    'ntfs-3g'               # Open source implementation of NTFS file system
    'parted'                # Disk utility
    'gparted'

    # GENERAL UTILITIES ---------------------------------------------------

    'catfish'               # Filesystem search
    'conky'                 # System information viewer
    'xfburn'                # CD burning application

    # DEVELOPMENT ---------------------------------------------------------

    'atom'                  # Text editor
    'apache'                # Apache web server
    'clang'                 # C Lang compiler
    'cmake'                 # Cross-platform open-source make system
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'nodejs'                # Javascript runtime environment
    'npm'                   # Node package manager
    'python'                # Scripting language
    'yarn'                  # Dependency management (Hyper needs this)
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

    'hexchat'               # Multi format chat
    'irssi'                 # Terminal based IIRC

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
    'xpdf'                  # PDF viewer

    # FLATPACK UTILITIES --------------------------------------------------
    
    'xdg-desktop-portal'
    'xdg-desktop-portal-kde'
    'xdg-desktop-portal-gtk'
    
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
echo "INSTALLING AUR SOFTWARE"
echo

cd "${HOME}"

echo "CLOING: AURIC"
git clone "https://github.com/rickellis/AURIC.git"


PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

    'yay'
    'preload' # preloads commonly used binaries in RAM
    'auto-cpufreq' # for laptops
    'pacseek'
    'libdbusmenu-glib'
    
    # TERMINAL UTILITIES --------------------------------------------------

    'hyper'                     # Terminal emulator built on Electron

    # UTILITIES -----------------------------------------------------------

    'synology-drive-client'
    #TODO: BITWARDEN
    'dropbox'                   # Cloud file storage
    'enpass-bin'                # Password manager
    'slimlock'                  # Screen locker
    'oomox'                     # Theme editor

    # DEVELOPMENT ---------------------------------------------------------

    'visual-studio-code-bin'    # Kickass text editor
    'icedtea-web'
    'jetbrains-toolbox'
    'vim-ansible'

    # MEDIA ---------------------------------------------------------------

    'spotify'                   # Music player

    # POST PRODUCTION -----------------------------------------------------

    'peek'                      # GIF animation screen recorder

    # COMMUNICATIONS ------------------------------------------------------

    'skypeforlinux-stable-bin'  # Skype

    # THEMES --------------------------------------------------------------

    'ttf-ms-fonts'
)


cd ${HOME}/AURIC
chmod +x auric.sh

for PKG in "${PKGS[@]}"; do
    ./auric.sh -i $PKG
done

echo
echo "Done!"
echo
