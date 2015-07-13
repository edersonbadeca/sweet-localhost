#! /bin/sh 
list_repositories() {
  cat /etc/apt/sources.list|grep 'deb'|while read line; do
    if ! echo $line | egrep -q '^ *#'
    then
        echo "sudo add-apt-repository '$line'"
    fi
  done
}

install_repositories() {
  cat repositories.txt |grep 'deb'|while read line; do
    if ! echo $line | egrep -q '^ *#'
    then
        sudo add-apt-repository '$line'
        sudo apt-get update
    fi
  done
}

list_packages() {
  dpkg-query -W -f='${Package}\n'
}

install_packages() {
  cat packages.txt|while read line; do
      echo "Installling $line Package.."
      sudo apt-get install $line
  done
}

if [ $# -eq 0 ]
    then
        echo "Here is your Options:\nlist_repositories \ninstall_repositories \nlist_packages \nInstall_packages" 
    else
        $1
    fi

