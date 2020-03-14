#!/bin/bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
SCRIPT_DIR=$(pwd)
source kafka-dist-install.sh
popd > /dev/null

function bin_path() {
    echo ${BIN_ACTIVE_DIR}:${BIN_ALL_DIR}
}

if [ "${BASH_SOURCE[0]}" == "$0" ]; then
    bin_path
fi
