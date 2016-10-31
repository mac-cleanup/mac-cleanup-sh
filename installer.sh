#!/usr/bin/env bash

function install() {
    echo "Download Mac Cleanup"
    curl -o cleanup https://raw.githubusercontent.com/fwartner/mac-cleanup/master/cleanup.sh
    echo "Init Mac Cleanup"
    chmod +x cleanup
    echo "Install Mac Cleanup"
    sudo mv cleanup /usr/local/bin/cleanup
}

function uninstall() {
    echo "Uninstall Mac Cleanup"
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
