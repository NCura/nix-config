#!/usr/bin/env bash

MOUNT_DIR="/home/nicolas/Documents/WordPress/st-patrimoine.com"
REMOTE_PATH="st-patrimoine.com@ssh.gb.stackcp.com:/home/sites/27b/7/73d1c004ae/staging_html"
SSH_KEY="$HOME/.ssh/ecowebhosting"

if [[ $1 == "mount" ]]; then
  echo "Adding SSH key..."
  ssh-add $SSH_KEY
  echo "Mounting st-patrimoine.com..."
  sshfs $REMOTE_PATH $MOUNT_DIR
elif [[ $1 == "unmount" ]]; then
  echo "Unmounting st-patrimoine.com..."
  fusermount -u $MOUNT_DIR
else
  echo "Usage: $0 {mount|unmount}"
fi
