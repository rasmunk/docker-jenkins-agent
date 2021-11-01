#!/bin/sh

if [ -f "${JENKINS_USER}" ]; then
    read USR < ${JENKINS_USER}
    COMMAND_OPTIONS="${COMMAND_OPTIONS} -username $USR"
fi

if [ -f "${JENKINS_PASS}" ]; then
    read PSS < ${JENKINS_PASS}
    export PSS
    COMMAND_OPTIONS="${COMMAND_OPTIONS} -passwordEnvVariable PSS"
fi

# exec su jenkins -c "exec java -jar /home/jenkins/swarm-client-${SWARM_CLIENT_VERSION}.jar ${COMMAND_OPTIONS}"
java -jar /home/jenkins/swarm-client-${SWARM_CLIENT_VERSION}.jar ${COMMAND_OPTIONS}