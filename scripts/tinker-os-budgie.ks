# System setup
text
lang en_GB.UTF-8
keyboard uk
timezone Europe/Dublin --isUtc
selinux --enforcing
firewall --enabled --service=mdns
services --enabled=sshd,NetworkManager,chronyd
network --bootproto=dhcp --device=link --activate

# Bootloader configuration
bootloader --timeout=1

# Disk partitioning
zerombr
clearpart --all --initlabel --disklabel=msdos
autopart --type=btrfs --noswap

# Repositories
repo --name="fedora" --baseurl=https://download.fedoraproject.org/pub/fedora/linux/releases/38/Everything/x86_64/os/
repo --name="updates" --baseurl=https://download.fedoraproject.org/pub/fedora/linux/updates/38/Everything/x86_64/
repo --name="brave" --baseurl=https://brave-browser-rpm-release.s3.brave.com/x86_64/

# Reboot after installation
reboot

# Packages and Exclusions
%packages
@base-x
@fonts
@multimedia
@printing
-fedora-release-workstation
-@guest-desktop-agents
-@dial-up
-@input-methods
-@standard
-fedora-release-workstation
-fedora-release
-firefox

# Budgie and Apps
fedora-release-budgie
@^budgie-desktop-environment
@budgie-desktop-apps
gnome-keyring
#gnome-keyring-pam
thunderbird
brave-browser

# Exclude unnecessary packages
-gfs2-utils
-reiserfs-utils
#-iwl*
#-ipw*
#-usb_modeswitch
-generic-release*

%end

%post

# Set graphical target as default
systemctl set-default graphical.target

%end
