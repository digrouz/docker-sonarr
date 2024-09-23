#!/usr/bin/env bash
set -x
SONARR_URL="https://services.sonarr.tv/v1/releases"

FULL_LAST_VERSION=$(curl -SsL ${SONARR_URL} | jq -r "first(.[] | select(.releaseChannel==\"${SONARR_CHANNEL}\") | .version)")
LAST_VERSION="${FULL_LAST_VERSION}"

if [ "${LAST_VERSION}" ]; then
  sed -i -e "s|SONARR_VERSION='.*'|SONARR_VERSION='${LAST_VERSION}'|" Dockerfile*
fi

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
