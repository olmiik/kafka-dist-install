#!/bin/sh
#
# DISCLAIMER: THIS FILE HAS BEEN AUTOMATICALLY GENERATED
# PLEASE DO NOT TOUCH!!!
#
function run_cmd() {
    local image=$1
    local version=$2
    local cmd=$3
    shift 3
    local args="$@"
    podman run --rm -it --network=host ${image}:${version} bash -c "${cmd} ${args}" 2>/dev/null
}
alias kafka-mirror-maker="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-mirror-maker"
alias kafka-reassign-partitions="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-reassign-partitions"
alias kafka-replica-verification="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-replica-verification"
alias kafka-configs="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-configs"
alias kafka-server-stop="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-server-stop"
alias kafka-leader-election="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-leader-election"
alias kafka-preferred-replica-election="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-preferred-replica-election"
alias kafka-delegation-tokens="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-delegation-tokens"
alias kafka-consumer-perf-test="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-consumer-perf-test"
alias kafka-broker-api-versions="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-broker-api-versions"
alias kafka-server-start="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-server-start"
alias kafka-dump-log="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-dump-log"
alias kafka-log-dirs="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-log-dirs"
alias kafka-producer-perf-test="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-producer-perf-test"
alias kafka-console-producer="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-console-producer"
alias kafka-acls="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-acls"
alias kafka-topics="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-topics"
alias kafka-consumer-groups="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-consumer-groups"
alias kafka-delete-records="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-delete-records"
alias kafka-run-class="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-run-class"
alias kafka-console-consumer="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-console-consumer"
alias kafka-verifiable-producer="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-verifiable-producer"
alias kafka-streams-application-reset="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-streams-application-reset"
alias kafka-verifiable-consumer="run_cmd docker.io/confluentinc/cp-kafka 5.4.1 kafka-verifiable-consumer"
alias kafka-avro-console-producer="run_cmd docker.io/confluentinc/cp-schema-registry 5.4.1 kafka-avro-console-producer"
alias kafka-avro-console-consumer="run_cmd docker.io/confluentinc/cp-schema-registry 5.4.1 kafka-avro-console-consumer"
alias kafka-api-start="run_cmd docker.io/confluentinc/cp-schema-registry 5.4.1 kafka-api-start"
