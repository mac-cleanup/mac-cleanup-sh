# mac-cleanup
A cleanup script for macOS that runs the following tasks:

* Empty the Trash on All Mounted Volumes and the Main HDD
* Clear System Log Files
* Clear Adobe Cache Files
* Cleanup iOS Applications
* Remove iOS Device Backups
* Cleanup Xcode Derived Data and Archives
* Reset iOS simulators
* Cleanup Homebrew Cache
* Cleanup Any Old Versions of Gems
* Cleanup Dangling Docker Images
* Purge Inactive Memory
* Cleanup pip cache
* Cleanup Pyenv-VirtualEnv Cache
* Cleanup npm Cache
* Cleanup Yarn Cache
* Cleanup Docker Images and Stopped Containers
* Cleanup CocoaPods Cache Files
* Cleanup composer cache
* Cleanup Dropbox cache
* Remove PhpStorm logs
* Remove Minecraft logs and cache
* Remove Steam logs and cache
* Remove Lunar Client logs and cache
* Remove Wget logs and hosts
* Clear Bash/ZSH history

## Install Automatically

### Using homebrew

```bash
brew tap fwartner/tap
brew install fwartner/tap/mac-cleanup
```

### Using curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/fwartner/mac-cleanup/main/installer.sh)"
```

### Using wget

```bash
sh -c "$(wget https://raw.githubusercontent.com/fwartner/mac-cleanup/main/installer.sh -O -)"
```

## Step by Step Install

1. Download: `curl -o cleanup https://raw.githubusercontent.com/fwartner/mac-cleanup/main/mac-cleanup`
2. Make it executable: `chmod +x cleanup`
3. Move to make it globally usable: `sudo mv cleanup /usr/local/bin/cleanup`

### Note:
If installing with curl you need to call `cleanup` instead of `mac-cleanup`.

## Update

```bash
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/main/installer.sh" | bash -s update
```

## Uninstall

```bash
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/main/installer.sh" | bash -s uninstall
```

## Usage Options

Help menu:

```
$ mac-cleanup -h

A Mac Cleanup Utility by fwartner
https://github.com/fwartner/mac-cleanup

USAGE:
 mac-cleanup [FLAGS]

FLAGS:
-h,   prints help menu
-n    no brew updates
```

Clean up without homebrew updates:

```
$ mac-cleanup -n
```

## Contributors

### Code Contributors

This project exists thanks to all the people who contribute. [[Contribute](CONTRIBUTING.md)].
<a href="https://github.com/fwartner/mac-cleanup/graphs/contributors"><img src="https://opencollective.com/mac-cleanup/contributors.svg?width=890&button=false" /></a>

<a href="https://opencollective.com/mac-cleanup/organization/0/website"><img src="https://opencollective.com/mac-cleanup/organization/0/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/1/website"><img src="https://opencollective.com/mac-cleanup/organization/1/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/2/website"><img src="https://opencollective.com/mac-cleanup/organization/2/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/3/website"><img src="https://opencollective.com/mac-cleanup/organization/3/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/4/website"><img src="https://opencollective.com/mac-cleanup/organization/4/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/5/website"><img src="https://opencollective.com/mac-cleanup/organization/5/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/6/website"><img src="https://opencollective.com/mac-cleanup/organization/6/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/7/website"><img src="https://opencollective.com/mac-cleanup/organization/7/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/8/website"><img src="https://opencollective.com/mac-cleanup/organization/8/avatar.svg"></a>
<a href="https://opencollective.com/mac-cleanup/organization/9/website"><img src="https://opencollective.com/mac-cleanup/organization/9/avatar.svg"></a>

If you like what I am doing please consider [sponsor my work](https://github.com/sponsors/fwartner)!
