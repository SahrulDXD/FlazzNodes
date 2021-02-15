#!/bin/bash

set -e

# exit with error status code if user is not root
if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudo)." 1>&2
  exit 1
fi

# check for curl
if ! [ -x "$(command -v curl)" ]; then
  echo "* curl is required in order for this script to work."
  echo "* install using apt (Debian and derivatives) or yum/dnf (CentOS)"
  exit 1
fi

output() {
  echo "* ${1}"
}

error() {
  COLOR_RED='\033[0;31m'
  COLOR_NC='\033[0m'

  echo ""
  echo -e "* ${COLOR_RED}ERROR${COLOR_NC}: $1"
  echo ""
}

done=false
output
installwings() {
  bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/v0.2.0/install-wings.sh)
}
butgg() {
  curl -o butgg.bash https://raw.githubusercontent.com/SahrulDXD/backuptogoogle/master/butgg.bash
  bash butgg.bash --setup
}
mountdisk07() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/mountdisk07.sh)
}
mountdisk11() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/mountdisk11.sh)
}
installdaemon() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/daemon07.sh)
}
updatedaemon() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/update-daemon.sh)
}
passwordssh() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/password.sh)
}
while [ "$done" == false ]; do
  done=true

  output "What would you like to do?"
  output "[1] Install Wings (Panel 1.1)"
  output "[2] Install Daemon Update (Panel 0.7)"
  output "[3] Mount Disk Volume (Panel 1.1)"
  output "[4] Mount Disk Volume (Panel 0.7)"
  output "[5] Setting Password SSH"
  output "[6] Create SSL Sertificat"
  output "[7] ButGG Panel 0.7"

  echo -n "* Input 1-6: "
  read -r action

  case $action in
      1 )
          installwings ;;
      2 )
          installdaemon
          updatedaemon;;
      3 )
          mountdisk11;;
      4 )
          mountdisk07;;
      5 )
          passwordssh ;;
      6 )
          ssl;;
      7 )
          butgg;;
      * )
          error "PILIH YANG BENER AJG LU KIRA KAGA PUYENG NIH GW BIKIN"
          done=false ;;
  esac
done
