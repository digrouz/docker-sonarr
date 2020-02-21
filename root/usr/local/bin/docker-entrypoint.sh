#!/usr/bin/env bash
 
. /etc/profile
. /usr/local/bin/docker-entrypoint-functions.sh

MYUSER="${APPUSER}"
MYUID="${APPUID}"
MYGID="${APPGID}"

ConfigureUser
AutoUpgrade

if [ "$1" = 'sonarr' ]; then
  if [ -d  /config ]; then
    chown -R "${MYUSER}":"${MYUSER}" /config
  fi
  
  RunDropletEntrypoint
  
  DockLog "Starting app: ${@}"
  exec su-exec "${MYUSER}" mono --debug /opt/Sonarr/Sonarr.exe -no-browser -data=/config
else
  DockLog "Starting command: ${@}"
  exec "$@"
fi
