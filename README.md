# mac-cleanup

Cleanup script for macOS

**It does the following cleanup tasks:**

* Empty the Trash on all mounted volumes and the main HDD
* Clear System Log Files
* Clear Adobe Cache Files
* Cleanup iOS Applications
* Remove iOS Device Backups
* Cleanup XCode Derived Data and Archives
* Cleanup Homebrew Cache
* Cleanup any old versions of gems
* Cleanup dangling docker images
* Purge inactive memory
* Cleanup npm cache
* Cleanup yarn cache
* Cleanup docker images and stopped  containers

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
