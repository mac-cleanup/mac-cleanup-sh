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

## Contributors

### Code Contributors

This project exists thanks to all the people who contribute. [[Contribute](CONTRIBUTING.md)].
<a href="https://github.com/fwartner/mac-cleanup/graphs/contributors"><img src="https://opencollective.com/mac-cleanup/contributors.svg?width=890&button=false" /></a>

### Financial Contributors

Become a financial contributor and help us sustain our community. [[Contribute](https://opencollective.com/mac-cleanup/contribute)]

#### Individuals

<a href="https://opencollective.com/mac-cleanup"><img src="https://opencollective.com/mac-cleanup/individuals.svg?width=890"></a>

#### Organizations

Support this project with your organization. Your logo will show up here with a link to your website. [[Contribute](https://opencollective.com/mac-cleanup/contribute)]

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
