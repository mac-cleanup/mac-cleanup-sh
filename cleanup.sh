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
        printf -- '-?,   prints help menu\n'
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

echo 'Clear System Log Files...'
sudo rm -rfv /private/var/log/asl/*.asl &>/dev/null
sudo rm -rfv /Library/Logs/DiagnosticReports/* &>/dev/null
sudo rm -rfv /Library/Logs/Adobe/* &>/dev/null
rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* &>/dev/null
rm -rfv ~/Library/Logs/CoreSimulator/* &>/dev/null

echo 'Clear Adobe Cache Files...'
sudo rm -rfv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null

echo 'Cleanup iOS Applications...'
rm -rfv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null

echo 'Remove iOS Device Backups...'
rm -rfv ~/Library/Application\ Support/MobileSync/Backup/* &>/dev/null

echo 'Cleanup XCode Derived Data and Archives...'
rm -rfv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
rm -rfv ~/Library/Developer/Xcode/Archives/* &>/dev/null

echo 'Cleanup pip cache...'
rm -rfv ~/Library/Caches/pip

if [ -d "/Users/${HOST}/Library/Caches/CocoaPods" ]; then
    echo 'Cleanup CocoaPods cache...'
    rm -rfv ~/Library/Caches/CocoaPods/* &>/dev/null
fi

# support delete Google Chrome caches
if [ -d "/Users/${HOST}/Library/Caches/Google/Chrome" ]; then
    echo 'Cleanup Google Chrome cache...'
    rm -rfv ~/Library/Caches/Google/Chrome/* &> /dev/null
fi

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
