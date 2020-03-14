#!/bin/zsh
set -e

# Kafka Zsh Plugin generator based on https://github.com/Dabz/kafka-zsh-completions

CONFLUENT_IMAGES=("docker.io/confluentinc/cp-kafka" "docker.io/confluentinc/cp-schema-registry")
CONFLUENT_VERSIONS=("5.4.1") # "5.2.3" "5.3.3"
CONFLUENT_CMD_PATTERN="kafka-*"

OUT_ALIASES_PATTERN='kafka${version}.aliases.plugin.zsh'
function out_aliases_file() {
    local version=$1
    eval "echo ${OUT_ALIASES_PATTERN}"
}
OUT_COMPLETION_PATTERN='kafka${version}.completion.plugin.zsh'
function out_completion_file() {
    local version=$1
    eval "echo ${OUT_COMPLETION_PATTERN}"
}

function main() {
    for version in ${CONFLUENT_VERSIONS[@]}; do 
        generate_plugin_for_version "${version}"
    done
}

function generate_plugin_for_version() {
    local version=$1

    cat << EOF > $(out_aliases_file ${version})
#!/bin/sh
#
# DISCLAIMER: THIS FILE HAS BEEN AUTOMATICALLY GENERATED
# PLEASE DO NOT TOUCH!!!
#
function run_cmd() {
    local image=\$1
    local version=\$2
    local cmd=\$3
    shift 3
    local args="\$@"
    podman run --rm -it --network=host \${image}:\${version} bash -c "\${cmd} \${args}" 2>/dev/null
}
EOF
    
#    cat << EOF > $(out_completion_file ${version})
##!/bin/sh
##
## DISCLAIMER: THIS FILE HAS BEEN AUTOMATICALLY GENERATED
## PLEASE DO NOT TOUCH!!!
##
#function _kafka-command() {
#    cmd=\$1
#    arg_name="_\$(echo \$cmd | tr - _)_args"
#    typeset -a options
#    eval _describe 'values' \$arg_name
#}
#EOF

    for image in ${CONFLUENT_IMAGES[@]}; do 
        generate_aliases_for_image_and_version "${image}" "${version}"
        #source $(out_aliases_file ${version})
        #generate_completion_for_image_and_version "${image}" "${version}"
    done

}

function generate_aliases_for_image_and_version() {
    local image=$1
    local version=$2

    local commands=($(find_cmds_in_container "${image}" "${version}" "${CONFLUENT_CMD_PATTERN}"))

    for cmd in ${commands[@]}; do
         generate_alias_for_command "${image}" "${version}" "${cmd//$'\r'}"
    done
}

function generate_alias_for_command() {
    local image=$1
    local version=$2
    local cmd=$3

    echo "alias ${cmd}=\"run_cmd ${image} ${version} ${cmd}\"" >> $(out_aliases_file ${version})
#    cat << EOF >> $(out_aliases_file ${version})
#function $cmd() {
#    run_cmd "${image}" "${version}" "${cmd}" "\$@"
#}
#EOF
}


function generate_completion_for_image_and_version() {
    local image=$1
    local version=$2

    local commands=($(find_cmds_in_container "${image}" "${version}" "${CONFLUENT_CMD_PATTERN}"))

    for cmd in ${commands[@]}; do
        kafka_retrieve_help_command "${version}" "${cmd//$'\r'}"
        kafka-command "${version}" "${cmd//$'\r'}"
    done
}

function kafka_retrieve_help_command() {
  local version=$1
  local cmd=$2
  local option=""
  local desc=""
  local help_output=$(${cmd} --help 2>&1)
  local arg_name="_$(echo $cmd | tr - _)_args"
  local start_desc_column=$(echo $help_output | grep Description | head -n 1)

  # If a "Description" column is present 
  # look for the offset to truncate the 
  # description of the options.
  #
  # This as some tools usage use a table with 2
  # column with the format
  # Option    Description
  # --blbla   this is 
  #           useful! 
  if [[ ! -z $start_desc_column ]]; then
    local searchstring="Description"
    local rest=${start_desc_column##*$searchstring}
    start_desc_column=$(( ${#start_desc_column} - ${#rest} - ${#searchstring} ))
  else
    start_desc_column="-1"
  fi

  echo "declare -a $arg_name"  >> $(out_completion_file ${version})
  echo "$arg_name=()" >> $(out_completion_file ${version})

  # Iterate over each line to check for options 
  # after check the iteration, truncate over the 
  # offset and iterate word by word to build the
  # description 
  IFS=$'\n'
  for line in `echo $help_output`; do
    if [[ "$start_desc_column" == "-1" ]]; then
      first_part_line=`echo $line | tr '\t' ' '`
      second_part_line=`echo $line | tr '\t' ' '`
    else
      first_part_line=`echo $line | cut -c -$start_desc_column | tr '\t' ' '`
      second_part_line=`echo $line | cut -c $start_desc_column- | tr '\t' ' '`
    fi
    if [[ $first_part_line =~ "^[ \s\t]*--[a-z][a-z\-\.]+" ]]; then
      if [ ! -z $option ]; then
        echo "$arg_name+=('$option:${desc//\'/''}')" >> $(out_completion_file ${version})
      fi	

      option=`echo $first_part_line | sed -E 's/^\s*(--[a-z\.\\\-]+).*$/\1/'`
      desc=""
    fi
    IFS=" "
    for word in `echo $second_part_line`; do
      desc="${desc} ${word//$'\r'}"
    done
    IFS=$'\n'
  done

  unset IFS

  if [ ! -z $option ]; then
    echo "$arg_name+=('$option:${desc//\'/''}')" >> $(out_completion_file ${version})
  fi	
}

function kafka-command() {
    local version=$1
    local cmd=$2
    echo "compdef \"_kafka-command $cmd\" $cmd" >> $(out_completion_file ${version})
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