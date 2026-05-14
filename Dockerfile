FROM fedora:44

RUN dnf update -y && \
    dnf install -y flatpak-builder dbus-x11 xorg-x11-server-Xvfb jq && \
    dnf clean all

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak -y install flathub org.gnome.Platform//50 && \
    flatpak -y install flathub org.gnome.Sdk//50

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
