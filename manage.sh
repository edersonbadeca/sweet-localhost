#! /bin/sh 
list() {
  cat /etc/apt/sources.list|grep 'deb'|while read line; do
    if ! echo $line | egrep -q '^ *#'
    then
        echo "sudo add-apt-repository '$line'"
    fi
  done
}

install() {
  cat /etc/apt/sources.list|grep 'deb'|while read line; do
    if ! echo $line | egrep -q '^ *#'
    then
        sudo add-apt-repository '$line'
    fi
  done
}
if [ $# -eq 0 ]
    then
        echo "Here is your Options:\nlist \ninstall" 
    else
        $1
    fi

