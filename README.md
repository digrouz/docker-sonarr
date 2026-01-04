[![auto-update](https://github.com/digrouz/docker-sonarr/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-sonarr/actions/workflows/auto-update.yml)
[![dockerhub](https://github.com/digrouz/docker-sonarr/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-sonarr/actions/workflows/dockerhub.yml)
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
      -v <path to config>:/config \
      -e UID=<UID default:12345> \
      -e GID=<GID default:12345> \
      -e AUTOUPGRADE=<0|1 default:0> \
      -e TZ=<timezone default:Europe/Brussels> \
      -p 8989:8989 \
      digrouz/sonarr

## Environment Variables

When you start the `sonarr` image, you can adjust the configuration of the `sonarr` instance by passing one or more environment variables on the `docker run` command line.

### `UID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `12345`.

### `GID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `12345`.

### `AUTOUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

### `TZ`

This variable is not mandatory and specifies the timezone to be configured within the container. It has default value `Europe/Brussels`.

## Notes

* This container is built using [s6-overlay](https://github.com/just-containers/s6-overlay)
* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e AUTOUPGRADE=1` at container creation.
* An helm chart is available of in the [chart folder](https://github.com/digrouz/docker-sonarr/tree/master/chart) with an example [value.yaml](https://github.com/digrouz/docker-sonarr/tree/master/chart/value.yaml)

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-sonarr/issues)
