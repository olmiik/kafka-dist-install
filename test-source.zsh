#!/bin/zsh
set -e
pushd . > /dev/null
cd $(dirname $(readlink -f $0))
SCRIPT_DIR=$(pwd)
echo "test-source: " $SCRIPT_DIR
popd > /dev/null

if [[ "${ZSH_SCRIPT}" == "$0" ]]; then
    echo "test-source.zsh:"
    set
fi