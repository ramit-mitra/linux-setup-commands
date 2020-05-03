#! /usr/bin/bash
### Author: Ramit Mitra
### Usage: This is a script that is to be used for setting up your Fedora system post basic OS installation.
###        Please run this script as SuperUser to not get annoyed by repetative prompts.
### Audience: Developers who intend to setup a linux based environment
### Version tested for: Fedora 31

clear && \
echo "---------------------------------------------------------" && \
echo "Clearing obsolete packages and updating existing packages" && \
echo "---------------------------------------------------------" && \
sudo dnf clean all && \
sudo dnf check-update && \
sudo dnf upgrade -y && \
echo "---------------------------------------------------------" && \
echo "Adding support for RPM FUSION & FLATPAK repositories" && \
echo "---------------------------------------------------------" && \
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm && \
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
echo "---------------------------------------------------------" && \
echo "Adding SNAP store to install snap apps" && \
echo "---------------------------------------------------------" && \
sudo dnf install snapd -y && \
echo "---------------------------------------------------------" && \
echo "Adding and enabling CRON & ANACRON" && \
echo "---------------------------------------------------------" && \
sudo dnf install cronie cronie-anacron -y && \
sudo dnf install dnf-plugin-system-upgrade rpmconf -y && \
systemctl enable crond.service && \
sudo dnf install -y libzip && \
echo "---------------------------------------------------------" && \
echo "Installing TOR service and Browser" && \
echo "---------------------------------------------------------" && \
sudo dnf install privoxy tor torbrowser-launcher -y && \
sudo service tor start && \
sudo systemctl enable tor && \
sudo sed -i 's/#        forward-socks5t/forward-socks5t/g' /etc/privoxy/config && \
sudo service privoxy start && \
sudo systemctl enable privoxy && \
sudo netstat -ant | grep 8118 && \
sudo export http_proxy="http://localhost:8118" && \
sudo wget -q -O out http://www.ipchicken.com/; grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' out && \
echo "---------------------------------------------------------" && \
echo "Installed Tor Browser and Tor Proxy Service" && \
echo "To start browsing anonymously, use the following proxy service in your browsers :: " && \
echo "HTTP Proxy: localhost" && \
echo "Port: 8118" && \
echo "---------------------------------------------------------" && \
echo "---------------------------------------------------------" && \
echo "Installing Network monitoring packages" && \
echo "---------------------------------------------------------" && \
sudo dnf install nmap -y && \
echo "---------------------------------------------------------" && \
echo "Adding DNF Automatic to automate upgrade task" && \
echo ">> https://dnf.readthedocs.io/en/latest/automatic.html" && \
echo "---------------------------------------------------------" && \
sudo yum install dnf-automatic -y && \
systemctl enable --now dnf-automatic-install.timer && \
systemctl start dnf-automatic-install.timer && \
systemctl status dnf-automatic-install.timer && \
echo "---------------------------------------------------------" && \
echo "Installing SNAP and FLATPAK apps" && \
echo "---------------------------------------------------------" && \
sudo ln -s /var/lib/snapd/snap /snap && \
sudo snap install hello-world && \
sudo snap install codium --classic && \
sudo snap install brave && \
sudo snap install skype --classic && \
sudo snap install insomnia bluemail && \
sudo snap install android-studio --classic && \
sudo snap install snap-store && \
sudo snap install glimpse-editor && \
sudo snap install beekeeper-studio && \
sudo flatpak install flathub com.github.alainm23.planner -y && \
sudo flatpak install flathub io.botfather.Botfather -y && \
echo "---------------------------------------------------------" && \
echo "Adding useful 3rd party plugins for audio & video playback" && \
echo "---------------------------------------------------------" && \
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good \
    gstreamer1-plugins-ugly gstreamer1-plugins-bad-free \
    gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld \
    gstreamer1-plugins-bad-free-extras ffmpeg -y && \
sudo gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
echo "---------------------------------------------------------" && \
echo "Installing DNF apps and programing languages/dev-tools - rustc, dotnet, nodejs, docker, etc" && \
echo "---------------------------------------------------------" && \
sudo dnf group install "Development Tools" -y && \
sudo dnf install kernel-devel kernel-headers dkms -y && \
sudo dnf install firewall-config -y && \
sudo dnf install vlc nodejs task -y && \
sudo dnf copr enable @dotnet-sig/dotnet -y && \
sudo dnf install dotnet -y && \
sudo dnf install rust cargo -y && \
sudo dnf install tlp tlp-rdw -y && \
sudo dnf install nuntius -y && \
sudo systemctl enable tlp -y && \
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine && \
sudo dnf -y install dnf-plugins-core && \
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo && \
sudo dnf install docker-ce docker-ce-cli containerd.io -y && \
sudo dnf install grubby -y && \
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" && \
sudo systemctl start docker && \
sudo systemctl enable docker && \
sudo docker run hello-world && \
echo "---------------------------------------------------------" && \
echo "Installing GNOME tweak tools" && \
echo "---------------------------------------------------------" && \
sudo dnf install gnome-tweak-tool libgnome -y && \
sudo dnf install chrome-gnome-shell -y && \
clear && \
echo "---------------------------------------------------------" && \
echo "Installing Pantheon DE and Deepin DE (just for fun, not strictly necessary)" && \
echo "---------------------------------------------------------" && \
sudo dnf group install 'pantheon desktop' -y && \
sudo dnf group install deepin-desktop -y && \
sudo dnf install switchdesk switchdesk-gui -y && \
clear && \
echo "---------------------------------------------------------" && \
echo "Done setting up the system. Autoremoving junk packages." && \
echo "---------------------------------------------------------" && \
yum autoremove -y && \
clear && \
echo "---------------------------------------------------------" && \
echo "Validating installed packages and versions" && \
echo "---------------------------------------------------------" && \
snap --version && \
rustc --version && \
python --version && \
pip --version && \
node --version && \
npm --version && \
dotnet --version && \
docker --version && \
echo "---------------------------------------------------------" && \
echo "Setting up global packages for development (nodejs, etc)" && \
echo "---------------------------------------------------------" && \
npm install -g ts-node \
    typescript \
    @angular/cli \
    @ionic/cli \
    netlify-cli \
    create-react-app \
    react \
    http-server && \
echo "---------------------------------------------------------" && \
echo "Setting up a few crazy python packages for rockstars" && \
echo "https://developer.fedoraproject.org/tech/languages/python/pygobject.html" && \
echo "---------------------------------------------------------" && \
sudo dnf install -y python3-devel pygobject3 python3-gobject libnotify libnotify-devel \
    python2-notify python2-notify python3-notify2 python3-dbus dbus-x11 && \
sudo pip install dbus-python Flask requests netifaces getmac randmac && \
echo "---------------------------------------------------------" && \
echo "Setting up PHP & Composer globally" && \
echo "---------------------------------------------------------" && \
sudo dnf install php php-cli php-gd -y && \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
chmod +x /usr/local/bin/composer && \
clear

