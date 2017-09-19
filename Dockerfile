FROM ubuntu:16.04

RUN apt update
RUN apt install -y snapd snapcraft
RUN apt install -y binutils build-essential bzip2 cmake cmake-data cpp cpp-5 dbus dpkg-dev fakeroot fontconfig fontconfig-config fonts-dejavu-core g++ g++-5 gcc gcc-5 git git-man ifupdown iproute2 isc-dhcp-client isc-dhcp-common less libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan2 libasn1-8-heimdal libatm1 libatomic1 libavahi-client3 libavahi-common-data libavahi-common3 libboost-filesystem1.58.0 libboost-system1.58.0 libc-dev-bin libc6-dev libcap-ng0 libcapnp-0.5.3 libcc1-0 libcilkrts5 libcups2 libcurl3 libcurl3-gnutls libdbus-1-3 libdns-export162 libdpkg-perl libdrm-amdgpu1 libdrm-dev libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libegl1-mesa libegl1-mesa-dev libelf1 liberror-perl libevdev2 libfakeroot libffi6 libfile-fcntllock-perl libfontconfig1 libfreetype6 libgbm1 libgcc-5-dev libgdbm3 libgl1-mesa-dev libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libgles2-mesa libgles2-mesa-dev libglib2.0-0 libglib2.0-data libglu1-mesa libglu1-mesa-dev libgmp10 libgnutls30 libgomp1 libgraphite2-3 libgssapi3-heimdal libgudev-1.0-0 libharfbuzz0b libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhogweed4 libhx509-5-heimdal libice6 libidn11 libinput-bin libinput10 libisc-export160 libisl15 libitm1 libjpeg-turbo8 libjpeg8 libjsoncpp1 libkrb5-26-heimdal libldap-2.4-2 libllvm4.0 liblsan0 libmirclient-dev libmirclient9 libmircommon-dev libmircommon7 libmircookie-dev libmircookie2 libmircore-dev libmircore1 libmirprotobuf3 libmnl0 libmpc3 libmpfr4 libmpx0 libmtdev1 libp11-kit0 libpciaccess0 libpcre16-3 libperl5.22 libpng12-0 libpopt0 libprotobuf-dev libprotobuf-lite9v5 libprotobuf9v5 libproxy1v5 libpthread-stubs0-dev libqt5concurrent5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5opengl5 libqt5opengl5-dev libqt5printsupport5 libqt5sql5 libqt5sql5-sqlite libqt5svg5 libqt5test5 libqt5widgets5 libqt5xml5 libquadmath0 libroken18-heimdal librtmp1 libsasl2-2 libsasl2-modules libsasl2-modules-db libsensors4 libsm6 libstdc++-5-dev libtasn1-6 libtsan0 libtxc-dxtn-s2tc0 libubsan0 libwacom-bin libwacom-common libwacom2 libwayland-bin libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl1-mesa libwayland-server0 libwind0-heimdal libx11-dev libx11-doc libx11-xcb-dev libx11-xcb1 libxau-dev libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render-util0 libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-sync-dev libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xkb1 libxcb1-dev libxdamage-dev libxdamage1 libxdmcp-dev libxext-dev libxfixes-dev libxfixes3 libxi6 libxkbcommon-dev libxkbcommon-x11-0 libxkbcommon0 libxrender1 libxshmfence-dev libxshmfence1 libxtables11 libxxf86vm-dev libxxf86vm1 linux-libc-dev make manpages manpages-dev mesa-common-dev netbase patch perl perl-modules-5.22 qt5-qmake qtbase5-dev qtbase5-dev-tools qtchooser qttranslations5-l10n rename rsync shared-mime-info ucf x11-common x11proto-core-dev x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev x11proto-input-dev x11proto-kb-dev x11proto-xext-dev x11proto-xf86vidmode-dev xdg-user-dirs xkb-data xorg-sgml-doctools xtrans-dev xz-utils zlib1g-dev

RUN apt install -y pkg-config curl wget libtool libtool-bin autoconf automake unzip ninja-build

RUN apt install -y autoconf debhelper dpkg-dev flex gettext ghostscript intltool libacl1-dev libcairo2-dev libgnomeui-dev libgpmg1-dev libgtk2.0-dev libgtk-3-dev liblua5.2-dev luajit libluajit-5.1-dev libncurses5 libncurses5-dev libpng12-dev libpython3.5-dev libselinux1-dev libtinfo-dev libxaw7-dev libxml-parser-perl libxpm-dev libxt-dev lua5.2 pdf2svg python3-dev python-dev

RUN apt install -y mc

RUN apt install -y checkinstall

RUN mkdir /data

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

WORKDIR /data

CMD ["/data/build.sh"]
