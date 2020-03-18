#! /usr/bin/bash

sudo dnf clean all && \
sudo dnf check-update && \
sudo dnf upgrade -y && \
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm && \
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
sudo dnf install snapd -y && \
sudo dnf install gnome-tweak-tool libgnome -y && \
sudo dnf install cronie cronie-anacron -y && \
systemctl enable crond.service && \
sudo ln -s /var/lib/snapd/snap /snap && \
sudo snap install hello-world && \
sudo snap install codium --classic && \
sudo snap install brave && \
sudo snap install skype --classic && \
sudo snap install insomnia bluemail && \
sudo snap install android-studio --classic && \
sudo snap install snap-store && \
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg -y && \
sudo dnf install vlc -y && \
sudo dnf install nodejs task -y && \
sudo dnf install rust cargo -y && \
sudo dnf install vlc -y && \
sudo dnf install tlp tlp-rdw -y && \
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
clear && \
yum autoremove -y && \
clear && \
snap --version && \
rustc --version && \
python --version && \
pip --version && \
node --version && \
npm --version && \
docker --version && \
echo "---------------------------------------------------------" && \
echo "Setting up global packages for development (nodejs, etc)" && \
echo "---------------------------------------------------------" && \
npm install -g ts-node \
    typescript \
    @angular/cli \
    @ionic/cli \
    create-react-app \
    react \
    http-server