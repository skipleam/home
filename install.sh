#!/bin/bash
echo Installing home directory.

INSTALLDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo Install script located at \'$INSTALLDIR\'

function cleanup {
  echo "Running cleanup"
  popd >> /dev/null
}

trap cleanup EXIT
pushd $INSTALLDIR


BASHRC="$INSTALLDIR/tmp/.bashrc" # TODO: point at ~/.bashrc after testing
if [ ! -f $BASHRC ]; then
    mkdir -p -- "$(dirname -- "$BASHRC")"
    touch -- "$BASHRC"
    BASHRC_IS_NEW=true
    echo Created .bashrc
fi

if grep -q "# Install $INSTALLDIR/.bashrc_aliases" "$BASHRC"; then
    echo Already installed. Exiting.
    exit 0
fi

echo -- Adding $INSTALLDIR/.bashrc_aliases to .bashrc
if ! $BASHRC_IS_NEW; then
    echo "" >> $BASHRC
fi
echo "# Install $INSTALLDIR/.bashrc_aliases" >> $BASHRC
echo "if [ -f $INSTALLDIR/.bashrc_aliases ]; then" >> $BASHRC
echo "    . $INSTALLDIR/.bashrc_aliases" >> $BASHRC
echo "fi" >> $BASHRC
echo "# Installed $INSTALLDIR/.bashrc_aliases" >> $BASHRC
