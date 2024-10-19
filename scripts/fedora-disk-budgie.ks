%include fedora-disk-base.ks
%include fedora-disk-xbase.ks
%include fedora-budgie-common.ks

autopart --type=btrfs --noswap

%post
# Add Brave browser repo and install Brave
cat << EOF > /etc/yum.repos.d/brave-browser.repo
[brave-browser]
name=Brave Browser
baseurl=https://brave-browser-rpm-release.s3.brave.com/x86_64/
enabled=1
gpgcheck=1
gpgkey=https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
EOF

# Install Brave and remove Firefox
dnf install -y brave-browser
dnf remove -y firefox

%end
