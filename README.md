# docker-alpine

[![github-actions](https://github.com/theohbrothers/docker-alpine/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/docker-alpine/actions/workflows/ci-master-pr.yml)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-alpine?style=flat-square)](https://github.com/theohbrothers/docker-alpine/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-alpine/latest)](https://hub.docker.com/r/theohbrothers/docker-alpine)

Dockerized alpine with useful tools.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:3.20-curl-git-jq-ssh`, `:latest` | [View](variants/3.20-curl-git-jq-ssh) |
| `:3.20-curl-mysqlclient-openssl` | [View](variants/3.20-curl-mysqlclient-openssl) |
| `:3.20-pingme` | [View](variants/3.20-pingme) |
| `:3.20-iptables` | [View](variants/3.20-iptables) |
| `:3.20-rsync` | [View](variants/3.20-rsync) |
| `:3.17-curl-git-jq-ssh` | [View](variants/3.17-curl-git-jq-ssh) |
| `:3.17-curl-mysqlclient-openssl` | [View](variants/3.17-curl-mysqlclient-openssl) |
| `:3.17-pingme` | [View](variants/3.17-pingme) |
| `:3.17-iptables` | [View](variants/3.17-iptables) |
| `:3.17-rsync` | [View](variants/3.17-rsync) |
| `:3.15-curl-git-jq-ssh` | [View](variants/3.15-curl-git-jq-ssh) |
| `:3.15-curl-mysqlclient-openssl` | [View](variants/3.15-curl-mysqlclient-openssl) |
| `:3.15-pingme` | [View](variants/3.15-pingme) |
| `:3.15-iptables` | [View](variants/3.15-iptables) |
| `:3.15-rsync` | [View](variants/3.15-rsync) |
| `:3.12-curl-git-jq-ssh` | [View](variants/3.12-curl-git-jq-ssh) |
| `:3.12-curl-mysqlclient-openssl` | [View](variants/3.12-curl-mysqlclient-openssl) |
| `:3.12-pingme` | [View](variants/3.12-pingme) |
| `:3.12-iptables` | [View](variants/3.12-iptables) |
| `:3.12-rsync` | [View](variants/3.12-rsync) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```
