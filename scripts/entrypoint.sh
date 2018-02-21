#!/bin/sh

# This is a bash script that is executed to make it a little easier to pass certain
#    environment variables into the Java application.  It can also help with enforced
#    options or checking to make sure options are present.

JAVA_SPRING_PROFILE_ACTIVE=""
if [[ ! -z "${SPRING_PROFILES_ACTIVE}" ]]; then
  JAVA_SPRING_PROFILE_OPTIONS="-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}"
fi

JAVA_SERVER_PORT=""
if [[ ! -z "${SERVER_PORT}" ]]; then
  JAVA_SERVER_PORT="-Dserver.port=${SERVER_PORT}"
fi

JAVA_MANAGEMENT_PORT=""
if [[ ! -z "${MANAGEMENT_PORT}" ]]; then
  JAVA_MANAGEMENT_PORT="-Dmanagement.port=${MANAGEMENT_PORT}"
fi

exec java $SECURITY_OPTS $JAVA_OPTS ${JAVA_MANAGEMENT_PORT} ${JAVA_SERVER_PORT} ${JAVA_SPRING_PROFILE_ACTIVE} \
      -jar $@ $SPRING_CONFIG_LOCATION $SPRING_PARAMETERS