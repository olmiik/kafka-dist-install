#!/bin/bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
SCRIPT_DIR=$(pwd)
popd > /dev/null

DIST_APACHE_URL="https://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/kafka"
DIST_CONFLUENT_URL="https://packages.confluent.io/archive"
SCALA_VERSIONS=("2.13" "2.12" "2.11")

ARCHIVE_DIR=${SCRIPT_DIR}/archive
DIST_DIR=${SCRIPT_DIR}/dist
BIN_DIR=${SCRIPT_DIR}/bin
BIN_ALL_DIR=${BIN_DIR}/all
BIN_ACTIVE_DIR=${BIN_DIR}/active

function usage () {
    echo "$0: $1" >&2
    echo
    echo "Usage: $0 <distribution (apache|cp)> <version> [active|inactive]"
    echo
}

function install_kafka_distribution() {
    local dist=${1:?"Missing distribution type as first parameter! Allowed values are 'apache' and 'cp'."}
    local version=${2:?"Missing the name of the distribution as first parameter!"}
    local state=${3:-"active"}

    local actual_dist_dir="${DIST_DIR}/${dist}-kafka-${version}"

    if [[ ! -d "${actual_dist_dir}" ]]; then
        local archive=$(download_dist ${dist} ${version})
        extract_dist ${archive} ${actual_dist_dir}
        #delete_archive ${archive}
        patch_scripts ${dist} ${version} ${actual_dist_dir}
        link_to_bin_dir ${dist} ${version} ${actual_dist_dir}
    fi

    if [ "${state}" == "active" ]; then
        link_to_active_bin_dir ${actual_dist_dir}
    fi
}

function download_dist() {
    local dist=$1
    local version=$2

    for scala_version in ${SCALA_VERSIONS[@]}; do
        local url=$(get_dist_url ${dist} ${version} ${scala_version})
        local archive="${ARCHIVE_DIR}/$(basename ${url})"
        if [[ -f "${archive}" ]]; then
            echo "${archive}"
            return 0
        fi        
        wget -P ${ARCHIVE_DIR}/ ${url}
        if [ $? == 0 ]; then
            echo "${ARCHIVE_DIR}/$(basename ${url})"
            return 0  
        fi
    done

    echo "Could not download version ${version} of distribution 'cp'."
    exit 1
}

function extract_dist() {
    local archive=$1
    local actual_dist_dir=$2

    mkdir -p ${actual_dist_dir}
    tar -xf ${archive} -C ${actual_dist_dir} --strip-components=1
}

function delete_archive() {
    local archive=$1
    rm ${archive}
}

function patch_scripts() {
    local actual_dist_dir=$3

    for cmd in $(find ${actual_dist_dir}/bin -maxdepth 1 -type f); do
        sed -i 's/\$(dirname \$0)/$(dirname \$(readlink -f \$0))/g' ${cmd}
        sed -i 's/\$( *cd *"\$( *dirname "\${BASH_SOURCE\[0]}" *)\/.." && pwd )/\$(dirname \$(readlink -f \$0))\/../g' ${cmd}
        sed -i 's/\$( *cd -P *"\$( *dirname "\${BASH_SOURCE\[0]}" *)\/.." && pwd )/\$(dirname \$(readlink -f \$0))\/../g' ${cmd}
    done
}

function link_to_bin_dir() {
    local dist=$1
    local version=$2
    local actual_dist_dir=$3

    mkdir -p ${BIN_ALL_DIR}
    for cmd in $(find ${actual_dist_dir}/bin -maxdepth 1 -type f); do
        local cmd_basename=$(basename ${cmd})
        ln -sf ${cmd} ${BIN_ALL_DIR}/${dist}-${cmd_basename%.*}-${version}
    done
}

function link_to_active_bin_dir() {
    local actual_dist_dir=$1

    rm -f ${BIN_ACTIVE_DIR}/*
    mkdir -p ${BIN_ACTIVE_DIR}
    for cmd in $(find ${actual_dist_dir}/bin -maxdepth 1 -type f); do
        local cmd_basename=$(basename ${cmd})
        ln -s ${cmd} ${BIN_ACTIVE_DIR}/${cmd_basename%.*}
    done
}

function get_dist_url() {
    local dist=$1
    local dist_version=$2
    local scala_version=$3
    case "$dist" in
        apache)
            get_dist_apache_url ${version} ${scala_version}
            ;;
        cp)
            get_dist_confluent_url ${version} ${scala_version}
            ;;
        *)
            usage "Unknown dist: ${dist}"
            exit 1
            ;;
    esac
}

function get_dist_apache_url() {
    local dist_version=$1
    local scala_version=$2
    echo ${DIST_APACHE_URL}/${version}/kafka_${scala_version}-${version}.tgz
}

function get_dist_confluent_url() {
    local dist_version=$1
    local scala_version=$2
    echo ${DIST_CONFLUENT_URL}/${version%.*}/confluent-community-${version}-${scala_version}.tar.gz
}

if [ "${BASH_SOURCE[0]}" == "$0" ]; then
    install_kafka_distribution "$@"
fi
