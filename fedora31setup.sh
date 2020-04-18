#! /usr/bin/bash

sudo dnf clean all && \
sudo dnf check-update && \
sudo dnf upgrade -y && \
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm && \
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
sudo dnf install snapd -y && \
sudo dnf install gnome-tweak-tool libgnome -y && \
sudo dnf install cronie cronie-anacron -y && \
sudo dnf install dnf-plugin-system-upgrade rpmconf -y && \
systemctl enable crond.service && \
sudo dnf install -y libzip && \
sudo ln -s /var/lib/snapd/snap /snap && \
sudo snap install hello-world && \
sudo snap install codium --classic && \
sudo snap install brave && \
sudo snap install skype --classic && \
sudo snap install insomnia bluemail && \
sudo snap install android-studio --classic && \
sudo snap install snap-store && \
sudo snap install glimpse-editor && \
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good \
    gstreamer1-plugins-ugly gstreamer1-plugins-bad-free \
    gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld \
    gstreamer1-plugins-bad-free-extras ffmpeg -y && \
sudo dnf install vlc -y && \
sudo dnf install nodejs task -y && \
sudo dnf copr enable @dotnet-sig/dotnet -y && \
sudo dnf install dotnet -y && \
sudo dnf install rust cargo -y && \
sudo dnf install vlc -y && \
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
sudo dnf install gnome-tweak-tool && \
sudo dnf install chrome-gnome-shell && \
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" && \
sudo systemctl start docker && \
sudo systemctl enable docker && \
sudo docker run hello-world && \
clear && \
yum autoremove -y && \
clear && \
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
echo "Setting up crazy python packages for rockstars" && \
echo "https://developer.fedoraproject.org/tech/languages/python/pygobject.html" && \
echo "---------------------------------------------------------" && \
sudo dnf install -y pygobject3 python3-gobject libnotify libnotify-devel \
    python2-notify python2-notify python3-notify2 python3-dbus dbus-x11 && \
sudo pip install dbus-python Flask requests && \
echo "---------------------------------------------------------" && \
echo "Setting up PHP Composer globally" && \
echo "---------------------------------------------------------" && \

sudo dnf install php php-cli php-gd -y && \
curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
chmod +x /usr/local/bin/composer && \
clear

