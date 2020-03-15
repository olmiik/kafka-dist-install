#!/bin/sh
function _kafka-command() {
    cmd=$1
    arg_name="_$(echo $cmd | tr - _)_args"
    typeset -a options
    eval _describe 'values' $arg_name
}
declare -a _cp_kafka_server_start_5.4.1_args
_cp_kafka_server_start_5.4.1_args=()
compdef "_kafka-command cp-kafka-server-start-5.4.1" cp-kafka-server-start-5.4.1
declare -a _cp_ksql_stop_5.4.1_args
_cp_ksql_stop_5.4.1_args=()
compdef "_kafka-command cp-ksql-stop-5.4.1" cp-ksql-stop-5.4.1
declare -a _cp_ksql_datagen_5.4.1_args
_cp_ksql_datagen_5.4.1_args=()
compdef "_kafka-command cp-ksql-datagen-5.4.1" cp-ksql-datagen-5.4.1
declare -a _cp_kafka_consumer_perf_test_5.4.1_args
_cp_kafka_consumer_perf_test_5.4.1_args=()
compdef "_kafka-command cp-kafka-consumer-perf-test-5.4.1" cp-kafka-consumer-perf-test-5.4.1
declare -a _cp_zookeeper_server_start_5.4.1_args
_cp_zookeeper_server_start_5.4.1_args=()
compdef "_kafka-command cp-zookeeper-server-start-5.4.1" cp-zookeeper-server-start-5.4.1
declare -a _cp_kafka_avro_console_producer_5.4.1_args
_cp_kafka_avro_console_producer_5.4.1_args=()
compdef "_kafka-command cp-kafka-avro-console-producer-5.4.1" cp-kafka-avro-console-producer-5.4.1
declare -a _cp_ksql_print_metrics_5.4.1_args
_cp_ksql_print_metrics_5.4.1_args=()
compdef "_kafka-command cp-ksql-print-metrics-5.4.1" cp-ksql-print-metrics-5.4.1
declare -a _cp_kafka_log_dirs_5.4.1_args
_cp_kafka_log_dirs_5.4.1_args=()
compdef "_kafka-command cp-kafka-log-dirs-5.4.1" cp-kafka-log-dirs-5.4.1
declare -a _cp_ksql_server_stop_5.4.1_args
_cp_ksql_server_stop_5.4.1_args=()
compdef "_kafka-command cp-ksql-server-stop-5.4.1" cp-ksql-server-stop-5.4.1
declare -a _cp_kafka_consumer_groups_5.4.1_args
_cp_kafka_consumer_groups_5.4.1_args=()
compdef "_kafka-command cp-kafka-consumer-groups-5.4.1" cp-kafka-consumer-groups-5.4.1
declare -a _cp_kafka_rest_start_5.4.1_args
_cp_kafka_rest_start_5.4.1_args=()
compdef "_kafka-command cp-kafka-rest-start-5.4.1" cp-kafka-rest-start-5.4.1
declare -a _cp_kafka_mirror_maker_5.4.1_args
_cp_kafka_mirror_maker_5.4.1_args=()
compdef "_kafka-command cp-kafka-mirror-maker-5.4.1" cp-kafka-mirror-maker-5.4.1
declare -a _cp_kafka_configs_5.4.1_args
_cp_kafka_configs_5.4.1_args=()
compdef "_kafka-command cp-kafka-configs-5.4.1" cp-kafka-configs-5.4.1
declare -a _cp_ksql_server_start_5.4.1_args
_cp_ksql_server_start_5.4.1_args=()
compdef "_kafka-command cp-ksql-server-start-5.4.1" cp-ksql-server-start-5.4.1
declare -a _cp_connect_standalone_5.4.1_args
_cp_connect_standalone_5.4.1_args=()
compdef "_kafka-command cp-connect-standalone-5.4.1" cp-connect-standalone-5.4.1
declare -a _cp_kafka_rest_stop_5.4.1_args
_cp_kafka_rest_stop_5.4.1_args=()
compdef "_kafka-command cp-kafka-rest-stop-5.4.1" cp-kafka-rest-stop-5.4.1
declare -a _cp_kafka_verifiable_producer_5.4.1_args
_cp_kafka_verifiable_producer_5.4.1_args=()
compdef "_kafka-command cp-kafka-verifiable-producer-5.4.1" cp-kafka-verifiable-producer-5.4.1
declare -a _cp_schema_registry_stop_service_5.4.1_args
_cp_schema_registry_stop_service_5.4.1_args=()
compdef "_kafka-command cp-schema-registry-stop-service-5.4.1" cp-schema-registry-stop-service-5.4.1
declare -a _cp_trogdor_5.4.1_args
_cp_trogdor_5.4.1_args=()
compdef "_kafka-command cp-trogdor-5.4.1" cp-trogdor-5.4.1
declare -a _cp_kafka_delegation_tokens_5.4.1_args
_cp_kafka_delegation_tokens_5.4.1_args=()
compdef "_kafka-command cp-kafka-delegation-tokens-5.4.1" cp-kafka-delegation-tokens-5.4.1
declare -a _cp_kafka_leader_election_5.4.1_args
_cp_kafka_leader_election_5.4.1_args=()
compdef "_kafka-command cp-kafka-leader-election-5.4.1" cp-kafka-leader-election-5.4.1
declare -a _cp_kafka_server_stop_5.4.1_args
_cp_kafka_server_stop_5.4.1_args=()
compdef "_kafka-command cp-kafka-server-stop-5.4.1" cp-kafka-server-stop-5.4.1
declare -a _cp_support_metrics_bundle_5.4.1_args
_cp_support_metrics_bundle_5.4.1_args=()
compdef "_kafka-command cp-support-metrics-bundle-5.4.1" cp-support-metrics-bundle-5.4.1
declare -a _cp_connect_mirror_maker_5.4.1_args
_cp_connect_mirror_maker_5.4.1_args=()
compdef "_kafka-command cp-connect-mirror-maker-5.4.1" cp-connect-mirror-maker-5.4.1
declare -a _cp_kafka_streams_application_reset_5.4.1_args
_cp_kafka_streams_application_reset_5.4.1_args=()
compdef "_kafka-command cp-kafka-streams-application-reset-5.4.1" cp-kafka-streams-application-reset-5.4.1
declare -a _cp_kafka_reassign_partitions_5.4.1_args
_cp_kafka_reassign_partitions_5.4.1_args=()
compdef "_kafka-command cp-kafka-reassign-partitions-5.4.1" cp-kafka-reassign-partitions-5.4.1
declare -a _cp_schema_registry_stop_5.4.1_args
_cp_schema_registry_stop_5.4.1_args=()
compdef "_kafka-command cp-schema-registry-stop-5.4.1" cp-schema-registry-stop-5.4.1
declare -a _cp_kafka_topics_5.4.1_args
_cp_kafka_topics_5.4.1_args=()
compdef "_kafka-command cp-kafka-topics-5.4.1" cp-kafka-topics-5.4.1
declare -a _cp_kafka_preferred_replica_election_5.4.1_args
_cp_kafka_preferred_replica_election_5.4.1_args=()
compdef "_kafka-command cp-kafka-preferred-replica-election-5.4.1" cp-kafka-preferred-replica-election-5.4.1
declare -a _cp_kafka_console_producer_5.4.1_args
_cp_kafka_console_producer_5.4.1_args=()
compdef "_kafka-command cp-kafka-console-producer-5.4.1" cp-kafka-console-producer-5.4.1
declare -a _cp_zookeeper_security_migration_5.4.1_args
_cp_zookeeper_security_migration_5.4.1_args=()
compdef "_kafka-command cp-zookeeper-security-migration-5.4.1" cp-zookeeper-security-migration-5.4.1
declare -a _cp_kafka_rest_stop_service_5.4.1_args
_cp_kafka_rest_stop_service_5.4.1_args=()
compdef "_kafka-command cp-kafka-rest-stop-service-5.4.1" cp-kafka-rest-stop-service-5.4.1
declare -a _cp_ksql_test_runner_5.4.1_args
_cp_ksql_test_runner_5.4.1_args=()
compdef "_kafka-command cp-ksql-test-runner-5.4.1" cp-ksql-test-runner-5.4.1
declare -a _cp_kafka_delete_records_5.4.1_args
_cp_kafka_delete_records_5.4.1_args=()
compdef "_kafka-command cp-kafka-delete-records-5.4.1" cp-kafka-delete-records-5.4.1
declare -a _cp_kafka_console_consumer_5.4.1_args
_cp_kafka_console_consumer_5.4.1_args=()
compdef "_kafka-command cp-kafka-console-consumer-5.4.1" cp-kafka-console-consumer-5.4.1
declare -a _cp_kafka_dump_log_5.4.1_args
_cp_kafka_dump_log_5.4.1_args=()
compdef "_kafka-command cp-kafka-dump-log-5.4.1" cp-kafka-dump-log-5.4.1
declare -a _cp_connect_distributed_5.4.1_args
_cp_connect_distributed_5.4.1_args=()
compdef "_kafka-command cp-connect-distributed-5.4.1" cp-connect-distributed-5.4.1
declare -a _cp_kafka_producer_perf_test_5.4.1_args
_cp_kafka_producer_perf_test_5.4.1_args=()
compdef "_kafka-command cp-kafka-producer-perf-test-5.4.1" cp-kafka-producer-perf-test-5.4.1
declare -a _cp_kafka_broker_api_versions_5.4.1_args
_cp_kafka_broker_api_versions_5.4.1_args=()
compdef "_kafka-command cp-kafka-broker-api-versions-5.4.1" cp-kafka-broker-api-versions-5.4.1
declare -a _cp_kafka_acls_5.4.1_args
_cp_kafka_acls_5.4.1_args=()
compdef "_kafka-command cp-kafka-acls-5.4.1" cp-kafka-acls-5.4.1
declare -a _cp_kafka_replica_verification_5.4.1_args
_cp_kafka_replica_verification_5.4.1_args=()
compdef "_kafka-command cp-kafka-replica-verification-5.4.1" cp-kafka-replica-verification-5.4.1
declare -a _cp_kafka_avro_console_consumer_5.4.1_args
_cp_kafka_avro_console_consumer_5.4.1_args=()
compdef "_kafka-command cp-kafka-avro-console-consumer-5.4.1" cp-kafka-avro-console-consumer-5.4.1
declare -a _cp_schema_registry_start_5.4.1_args
_cp_schema_registry_start_5.4.1_args=()
compdef "_kafka-command cp-schema-registry-start-5.4.1" cp-schema-registry-start-5.4.1
declare -a _cp_kafka_verifiable_consumer_5.4.1_args
_cp_kafka_verifiable_consumer_5.4.1_args=()
compdef "_kafka-command cp-kafka-verifiable-consumer-5.4.1" cp-kafka-verifiable-consumer-5.4.1
declare -a _cp_zookeeper_server_stop_5.4.1_args
_cp_zookeeper_server_stop_5.4.1_args=()
compdef "_kafka-command cp-zookeeper-server-stop-5.4.1" cp-zookeeper-server-stop-5.4.1
declare -a _cp_ksql_5.4.1_args
_cp_ksql_5.4.1_args=()
compdef "_kafka-command cp-ksql-5.4.1" cp-ksql-5.4.1
