[![auto-update-workflow](https://github.com/digrouz/docker-sonarr/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-sonarr/actions/workflows/auto-update.yml)
[![dockerhub-workflow](https://github.com/digrouz/docker-sonarr/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-sonarr/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/sonarr)

# docker-sonarr
Installs Sonarr into a Linux Container


![Sonarr](https://github.com/Sonarr/Sonarr/blob/phantom-develop/Logo/128.png)

## Tag
Several tag are available:
* latest: see alpine
* alpine: [Dockerfile_alpine](https://github.com/digrouz/docker-sonarr/blob/master/Dockerfile_alpine)

## Description

Sonarr is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

https://sonarr.tv

## Usage
    docker create --name=sonarr \
      -v /etc/localtime:/etc/localtime:ro \
      -v <path to config>:/config \
      -e DOCKUID=<UID default:10031> \
      -e DOCKGID=<GID default:10031> \
      -e DOCKUPGRADE=<0|1> \
      -p 8989:8989 \
      digrouz/sonarr

## Environment Variables

When you start the `sonarr` image, you can adjust the configuration of the `sonarr` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10031`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10031`.

### `DOCKUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

## Notes

* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e DOCKUPGRADE=1` at container creation.

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-sonarr/issues)
