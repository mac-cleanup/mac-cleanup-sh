# mac-cleanup
Cleanup script for OSX

## Automatic Install:

**use curl**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/tonydeng/mac-cleanup/master/installer.sh)"
```

**use wget**

```bash
sh -c "$(wget https://raw.githubusercontent.com/tonydeng/mac-cleanup/master/installer.sh -O -)"
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
curl -fsSL "https://raw.githubusercontent.com/tonydeng/mac-cleanup/master/installer.sh" | bash -s uninstall
```

## Update

```bash
curl -fsSL "https://raw.githubusercontent.com/tonydeng/mac-cleanup/master/installer.sh" | bash -s update
```
