#!/bin/bash
set -e
pushd . > /dev/null
cd $(dirname ${BASH_SOURCE[0]})
SCRIPT_DIR=$(pwd)
popd > /dev/null

CONFLUENT_IMAGES=("docker.io/confluentinc/cp-kafka" "docker.io/confluentinc/cp-schema-registry")
CONFLUENT_VERSIONS=("5.2.3" "5.3.3" "5.4.1")
CONFLUENT_CMD_PATTERN="kafka*"

BIN_DIR=${SCRIPT_DIR}/bin
RUN_CMD_SCRIPT="run-cmd-in-podman-container.function"

function main() {
  mkdir -p ${BIN_DIR}
  generate_run_cmd_script
  for version in ${CONFLUENT_VERSIONS[@]}; do 
    generate_scripts_for_version "${version}"
  done
}

function generate_run_cmd_script() {
      cat << EOF > ${BIN_DIR}/${RUN_CMD_SCRIPT}
function run_cmd_in_podman_container() {
    local image=\$1
    local version=\$2
    shift 2
    local cmd="\$@"
    podman run --rm -it --network=host \${image}:\${version} bash -c "\${cmd}" 2>/dev/null
}
EOF
}

function generate_scripts_for_version() {
  local version=$1
 
  for image in ${CONFLUENT_IMAGES[@]}; do 
    generate_scripts_for_image_and_version "${image}" "${version}"
  done

}

function generate_scripts_for_image_and_version() {
    local image=$1
    local version=$2

    local commands=($(find_cmds_in_container "${image}" "${version}" "${CONFLUENT_CMD_PATTERN}"))

    for cmd in ${commands[@]}; do
         generate_script_for_command "${image}" "${version}" "${cmd//$'\r'}"
    done
}

function generate_script_for_command() {
  local image=$1
  local version=$2
  local cmd=$3

  cat << EOF > ${BIN_DIR}/${cmd}-${version}
#!/usr/bin/env bash
set -e
pushd . > /dev/null
cd \$(dirname \${BASH_SOURCE[0]})
source ${RUN_CMD_SCRIPT}
popd > /dev/null

function ${cmd}-${version}() {
    run_cmd_in_podman_container ${image} ${version} ${cmd} "\$@"
}

${cmd}-${version} "\$@"
EOF

  chmod +x ${BIN_DIR}/${cmd}-${version}
  ln -sf ${BIN_DIR}/${cmd}-${version} ${BIN_DIR}/${cmd}
}

function find_cmds_in_container() {
    local image=$1
    local version=$2
    local cmd_pattern=$3
    run_cmd_in_container ${image} ${version} "find /usr/bin/ -name ${cmd_pattern} -exec basename {} \;"
}

function run_cmd_in_container() {
    local image=$1
    local version=$2
    local cmd=$3
    podman run --rm -it --network=host ${image}:${version} bash -c "${cmd}" 2>/dev/null
}

main