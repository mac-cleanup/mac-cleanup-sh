#!/usr/bin/env bash

bytesToHuman() {
    b=${1:-0}; d=''; s=0; S=(Bytes {K,M,G,T,E,P,Y,Z}iB)
    while ((b > 1024)); do
        d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
        b=$((b / 1024))
        (( s++ ))
    done
    echo "$b$d ${S[$s]} of space was cleaned up"
}

deleteCaches() {
    local cacheName=$1
    shift
    local paths=("$@")
    echo "Initiating cleanup ${cacheName} cache..."
    for folderPath in "${paths[@]}"; do
        if [[ -d ${folderPath} ]]; then
            dirSize=$(du -hs "${folderPath}" | awk '{print $1}')
            echo "Deleting ${folderPath} to free up ${dirSize}..."
            rm -rfv "${folderPath}" &>/dev/null
        fi
    done
}

# Default arguments
doUpdates=true

# Take in arguments
# Can add more arguments in the future
while getopts ":n" opt; do
  case ${opt} in
    n ) doUpdates=false
      ;;
    \? )
        printf 'A Mac Cleanup Utility by fwartner\n'
        printf 'https://github.com/fwartner/mac-cleanup\n\n'
        printf 'USAGE:\n cleanup [FLAGS]\n\n'
        printf 'FLAGS:\n'
        printf -- '-h,   prints help menu\n'
        printf -- '-n    no brew updates\n'
        exit
      ;;
  esac
done

# Ask for the administrator password upfront
sudo -v

HOST=$( whoami )

# Keep-alive sudo until `clenaup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

oldAvailable=$(df / | tail -1 | awk '{print $4}')

echo 'Empty the Trash on all mounted volumes and the main HDD...'
sudo rm -rfv /Volumes/*/.Trashes/* &>/dev/null
sudo rm -rfv ~/.Trash/* &>/dev/null

echo 'Clear System Cache Files...'
sudo rm -rfv /Library/Caches/* &>/dev/null
sudo rm -rfv /System/Library/Caches/* &>/dev/null
sudo rm -rfv ~/Library/Caches/* &>/dev/null

echo 'Clear System Log Files...'
sudo rm -rfv /private/var/log/asl/*.asl &>/dev/null
sudo rm -rfv /Library/Logs/DiagnosticReports/* &>/dev/null
sudo rm -rfv /Library/Logs/Adobe/* &>/dev/null
rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* &>/dev/null
rm -rfv ~/Library/Logs/CoreSimulator/* &>/dev/null

echo 'Clear Adobe Cache Files...'
sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null

echo 'Clear Google Chrome Cache Files...'
sudo rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null

echo 'Cleanup iOS Applications...'
rm -rfv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null

echo 'Remove iOS Device Backups...'
rm -rfv ~/Library/Application\ Support/MobileSync/Backup/* &>/dev/null

echo 'Cleanup XCode Derived Data and Archives...'
rm -rfv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
rm -rfv ~/Library/Developer/Xcode/Archives/* &>/dev/null
rm -rfv ~/Library/Developer/Xcode/iOS Device Logs/* &>/dev/null

if type "xcrun" &>/dev/null; then
  echo 'Cleanup iOS Simulators...'
  osascript -e 'tell application "com.apple.CoreSimulator.CoreSimulatorService" to quit'
  osascript -e 'tell application "iOS Simulator" to quit'
  osascript -e 'tell application "Simulator" to quit'
  xcrun simctl shutdown all
  xcrun simctl erase all
fi

# support delete gradle caches
if [ -d "/Users/${HOST}/.gradle/caches" ]; then
    echo 'Cleanup Gradle cache...'
    rm -rfv ~/.gradle/caches/ &> /dev/null
fi

# support delete Dropbox Cache
if [ -d "/Users/${HOST}/Dropbox" ]; then
    echo 'Clear Dropbox 📦 Cache Files...'
    sudo rm -rfv ~/Dropbox/.dropbox.cache/* &>/dev/null
fi

echo 'Clear Google Drive File Stream Cache Files...'
killall "Google Drive File Stream"
rm -rfv ~/Library/Application\ Support/Google/DriveFS/[0-9a-zA-Z]*/content_cache &>/dev/null

if type "composer" &> /dev/null; then
    echo 'Cleanup composer...'
    composer clearcache &> /dev/null
fi

if type "brew" &>/dev/null; then
    if $doUpdates; then
        echo 'Update Homebrew Recipes...'
        brew update
        echo 'Upgrade and remove outdated formulae'
        brew upgrade
    fi
    echo 'Cleanup Homebrew Cache...'
    brew cleanup -s &>/dev/null
    #brew cask cleanup &>/dev/null
    rm -rfv $(brew --cache) &>/dev/null
    brew tap --repair &>/dev/null
fi

if type "gem" &> /dev/null; then
    echo 'Cleanup any old versions of gems'
    gem cleanup &>/dev/null
fi

if type "docker" &> /dev/null; then
    echo 'Cleanup Docker'
    docker system prune -af
fi

if [ "$PYENV_VIRTUALENV_CACHE_PATH" ]; then
    echo 'Removing Pyenv-VirtualEnv Cache...'
    rm -rfv $PYENV_VIRTUALENV_CACHE_PATH &>/dev/null
fi

if type "npm" &> /dev/null; then
    echo 'Cleanup npm cache...'
    npm cache clean --force
fi

if type "yarn" &> /dev/null; then
    echo 'Cleanup Yarn Cache...'
    yarn cache clean --force
fi

echo 'Purge inactive memory...'
sudo purge

echo 'Success!'

newAvailable=$(df / | tail -1 | awk '{print $4}')
count=$((oldAvailable - newAvailable))
#count=$(( $count * 512))
bytesToHuman $count

