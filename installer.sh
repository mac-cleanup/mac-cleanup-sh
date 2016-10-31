#!/usr/bin/env bash

function install() {
    curl -o cleanup https://raw.githubusercontent.com/fwartner/mac-cleanup/master/cleanup.sh
    chmod +x cleanup
    sudo mv cleanup /usr/local/bin/cleanup
}

function uninstall() {
    sudo rm /usr/local/bin/cleanup
}

case $1 in
    uninstall)
        uninstall
		exit
        ;;
    update)
        install
        exit
        ;;
    *)
		install
		exit
        ;;
esac
