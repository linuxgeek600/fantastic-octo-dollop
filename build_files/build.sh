#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y kitty qt6-qtmultimedia cava

# Use a COPR Example:
dnf5 -y copr enable duxlabs/dms
dnf5 -y copr enable duxlabs/dux-repo
dnf5 -y copr enable gerelef/BeamMP-Launcher
dnf5 -y install dms --setopt=install_weak_deps=False
dnf5 -y install dux-greeter dux-search dux-files dux-calendar dux-gop BeamMP-Luancher
# Disable COPRs so they don't end up enabled on the final image:
dnf5 -y copr disable duxlabs/dms
dnf5 -y copr disable duxlabs/dux-repo
dnf5 -y copr disable gerelef/BeamMP-Launcher
#### Example for enabling a System Unit File

systemctl enable podman.socket
