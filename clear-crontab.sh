#!/usr/bin/env bash

# Clears the crontab
cat << EOF | crontab -
MAILTO=""
EOF
