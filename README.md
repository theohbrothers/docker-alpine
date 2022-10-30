# docker-alpine

[![github-actions](https://github.com/theohbrothers/docker-alpine/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-alpine/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-alpine?style=flat-square)](https://github.com/theohbrothers/docker-alpine/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-alpine/latest)](https://hub.docker.com/r/theohbrothers/docker-alpine)

Dockerized alpine with useful tools.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:3.12-curl-git-jq-ssh`, `:latest` | [View](variants/3.12-curl-git-jq-ssh ) |
| `:3.12-curl-mysqlclient-openssl` | [View](variants/3.12-curl-mysqlclient-openssl ) |
| `:3.12-iptables` | [View](variants/3.12-iptables ) |
| `:3.12-rsync` | [View](variants/3.12-rsync ) |
| `:3.11-curl-git-jq-ssh` | [View](variants/3.11-curl-git-jq-ssh ) |
| `:3.11-curl-mysqlclient-openssl` | [View](variants/3.11-curl-mysqlclient-openssl ) |
| `:3.11-iptables` | [View](variants/3.11-iptables ) |
| `:3.11-rsync` | [View](variants/3.11-rsync ) |
| `:3.10-curl-git-jq-ssh` | [View](variants/3.10-curl-git-jq-ssh ) |
| `:3.10-curl-mysqlclient-openssl` | [View](variants/3.10-curl-mysqlclient-openssl ) |
| `:3.10-iptables` | [View](variants/3.10-iptables ) |
| `:3.10-rsync` | [View](variants/3.10-rsync ) |
| `:3.9-curl-git-jq-ssh` | [View](variants/3.9-curl-git-jq-ssh ) |
| `:3.9-curl-mysqlclient-openssl` | [View](variants/3.9-curl-mysqlclient-openssl ) |
| `:3.9-iptables` | [View](variants/3.9-iptables ) |
| `:3.9-rsync` | [View](variants/3.9-rsync ) |
| `:3.8-curl-git-jq-ssh` | [View](variants/3.8-curl-git-jq-ssh ) |
| `:3.8-curl-mysqlclient-openssl` | [View](variants/3.8-curl-mysqlclient-openssl ) |
| `:3.8-iptables` | [View](variants/3.8-iptables ) |
| `:3.8-rsync` | [View](variants/3.8-rsync ) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```