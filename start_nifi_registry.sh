#!/bin/sh

set -e

sed -i "s/nifi\.registry\.web\.http\.host=.*/nifi.registry.web.http.host=${HOSTNAME}/g" ${NIFI_REGISTRY_HOME}/conf/nifi-registry.properties

tail -F ${NIFI_REGISTRY_HOME}/logs/nifi-registry-app.log &
${NIFI_REGISTRY_HOME}/bin/nifi-registry.sh run
