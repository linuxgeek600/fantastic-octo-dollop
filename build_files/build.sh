#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1


# Enable all repos.
dnf5 -y copr enable duxlabs/dms
dnf5 -y copr enable whelanh/omarchy
dnf5 -y copr enable duxlabs/dux-repo
dnf5 -y copr enable gerelef/BeamMP-Launcher
dnf5 -y copr enable lionheartp/Hyprland
dnf5 config-manager enable terra

# Install all packages.
dnf5 install -y \
	kitty \
	eza \
	lazygit \
	easyeffects \
	adw-gtk3-theme \
	hyprland \
	quickshell \
	hyprland-guiutils \
	matugen \
	dux-search \
	dux-calendar \
	dux-files \
	BeamMP-Launcher \
	cava \
	qt6-qtmultimedia \
	darkly \
	zen-browser \
	hyprmod \
	lsp-plugins-lv2 \
	calf \
	gvfs-gphoto2 \
	dms \
	qtengine \
	audacity \
	helium \

# Romve unwanted packages.
dnf5 remove -y \
	qt6ct \

# Disable repos so they don't end up enabled on the final image:
dnf5 -y copr disable duxlabs/dms
dnf5 -y copr disable duxlabs/dux-repo
dnf5 -y copr disable gerelef/BeamMP-Launcher
dnf5 -y copr disable whelanh/omarchy
dnf5 -y copr disable lionheartp/Hyprland
dnf5 config-manager disable terra
#### Example for enabling a System Unit File

systemctl enable podman.socket
