#!/bin/bash

set -e

if [ $# -eq 0 ] ; then
    echo "Usage:    ./deploy.sh ARGS"
    echo "e.g:      ./deploy.sh --tags=prometheus"
    echo "          ./deploy.sh --tags nginx,certbot-nginx --verbose"
    exit 0
fi


if [ ! -f ".env" ]; then
    echo "File .env does not exist. Run 'cp .env.template .env'"
    exit 1
fi

source .env

if [[ -z "$INVENTORY_FILE" ]]; then
    echo "INVENTORY_FILE is not defined. Set INVENTORY_FILE in .env"
    exit 1
fi

if [[ -z "$EXTRAS_FILE" ]]; then
    echo "EXTRAS_FILE is not defined. Set EXTRAS_FILE in .env"
    exit 1
fi


ansible-playbook shields-io-metrics.yml -i "$INVENTORY_FILE" -e @versions.yml -e "$EXTRAS_FILE" --ask-vault-pass --ask-become-pass "$@"
