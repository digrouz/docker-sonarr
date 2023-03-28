#!/usr/bin/env bash
SONARR_URL="https://download.sonarr.tv/v3/main/"

FULL_LAST_VERSION=$(curl -SsL ${SONARR_URL} | grep -Po '<a href="\K([\d.]+)' | grep -v "\.\." | sort -n | tail -1)
LAST_VERSION="${FULL_LAST_VERSION:1}"

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
