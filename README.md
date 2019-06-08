# mac-cleanup [![Build Status](https://travis-ci.org/fwartner/mac-cleanup.svg?branch=master)](https://travis-ci.org/fwartner/mac-cleanup)

A cleanup script for macOS that runs the following tasks:

* Empty the Trash on All Mounted Volumes and the Main HDD
* Clear System Log Files
* Clear Adobe Cache Files
* Cleanup iOS Applications
* Remove iOS Device Backups
* Cleanup Xcode Derived Data and Archives
* Cleanup Homebrew Cache
* Cleanup Any Old Versions of Gems
* Cleanup Dangling Docker Images
* Purge Inactive Memory
* Cleanup npm Cache
* Cleanup Yarn Cache
* Cleanup Docker Images and Stopped Containers

## Install Automatically

### Using curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh)"
```

### Using wget

```bash
sh -c "$(wget https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh -O -)"
```

## Step by Step Install

1. Download: `curl -o cleanup https://raw.githubusercontent.com/fwartner/mac-cleanup/master/cleanup.sh`
2. Make it executable: `chmod +x cleanup`
3. Move to make it globally usable: `sudo mv cleanup /usr/local/bin/cleanup`

## Update

```bash
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh" | bash -s update
```

## Uninstall

```bash
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh" | bash -s uninstall
```
