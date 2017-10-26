# mac-cleanup
Cleanup script for OSX

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

## Automatic Install:

**use curl**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh)"
```

**use wget**

```bash
sh -c "$(wget https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh -O -)"
```

## Step by step Install:
Download:
`curl -o cleanup https://raw.githubusercontent.com/fwartner/mac-cleanup/master/cleanup.sh`

Make it executable:
`chmod +x cleanup`

Move to make it globally usable:
`sudo mv cleanup /usr/local/bin/cleanup`


## Uninstall

```bash
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh" | bash -s uninstall
```

## Update

```bash
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh" | bash -s update
```
