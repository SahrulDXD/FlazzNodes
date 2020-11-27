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

mount() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/mount.sh)
}

installdaemon() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/daemon.sh)
}
updatedaemon() {
  bash <(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/update-daemon.sh)
}
while [ "$done" == false ]; do
  done=true

  output "What would you like to do?"
  output "[1] Mount Disk Apalah jir namanya"
  output "[2] Install the daemon (Wings)"
  output "[3] Update Daemon Biar Support Yang Namanya ADDONS"
  output "[4] Install Semuanya HAHAHAHAHAHAHA"

  echo -n "* Input 1-4: "
  read -r action

  case $action in
      1 )
          mount ;;
      2 )
          installdaemon ;;
      3 )
          updatedaemon;;
      4 )
          installdaemon
          updatedaemon
          mount ;;          
      * )
          error "PILIH YANG BENER AJG LU KIRA KAGA PUYENG NIH GW BIKIN"
          done=false ;;
  esac
done
