#!/bin/sh -l

export $(dbus-launch)
jq 'input as $frag | .modules |= (.[-1] += $frag)' $MANIFEST /fragment.json > "${MANIFEST}.test"
xvfb-run -- flatpak-builder --ccache --disable-rofiles-fuse --force-clean _build "${MANIFEST}.test"
