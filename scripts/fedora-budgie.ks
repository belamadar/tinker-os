%packages
fedora-release-budgie

# Exclude unwanted groups that fedora-live-base.ks pulls in
-@dial-up
-@input-methods
-@standard
-firefox

# Install budgie environment
@^budgie-desktop-environment

# recommended apps
@budgie-desktop-apps

# Exclude unwanted packages from @anaconda-tools group
-gfs2-utils
-reiserfs-utils

%end

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

# Install Brave
dnf install -y brave-browser

%end
