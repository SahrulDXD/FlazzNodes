#!/bin/bash
function main {
  echo -n "* Yakin Lu Mau Lanjut? Error Jangan Salahin Gw Ya!!(y/N): "

  read -r CONFIRM_ADD_NODE
  [[ "$CONFIRM_ADD_NODE" =~ [Yy] ]] && gaslah && return

}

function gaslah {
  bash<(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/mount.sh)
  bash<(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/daemon-next.sh)
  bash<(curl -s https://raw.githubusercontent.com/SahrulDXD/FlazzNodes/main/update-daemon.sh)
}

main
