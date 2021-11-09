#!/bin/bash

# Download the swarm-client from the designated manager
if [[ -z "${JENKINS_URL}" ]]; then
    echo "JENKINS_URL is required"
    exit 1
fi
wget -q "${JENKINS_URL}/swarm/swarm-client.jar" -P /home/jenkins/

if [[ -z "${JENKINS_CONFIG_PATH}" ]]; then
    echo "JENKINS_CONFIG_PATH is required"
    exit 1
fi

# exec su jenkins -c "exec java -jar /home/jenkins/swarm-client-${SWARM_CLIENT_VERSION}.jar ${COMMAND_OPTIONS}"
java -jar /home/jenkins/swarm-client.jar -config ${JENKINS_CONFIG_PATH}