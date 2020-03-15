#!/bin/zsh
set -e
pushd . > /dev/null
cd $(dirname $(readlink -f $0))
SCRIPT_DIR=$(pwd)
echo "test: " $SCRIPT_DIR
source ./test-source.zsh
popd > /dev/null


if [[ "${ZSH_SCRIPT}" == "$0" ]]; then
    autoload -Uz compinit
    compinit
    source /home/ueisele/App/kafka-dist/autocompletion/apache-kafka-2.4.1.zsh
    if [[ "$1" =~ "apache|ccs|ce" ]]; then
        echo "OK"
    else
        echo "NOK"
    fi
fi