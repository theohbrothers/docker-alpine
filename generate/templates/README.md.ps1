@"
# docker-alpine

[![github-actions](https://github.com/theohbrothers/docker-alpine/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-alpine/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-alpine)](https://github.com/theohbrothers/docker-alpine/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-alpine/latest)](https://hub.docker.com/r/theohbrothers/docker-alpine)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-alpine/latest)](https://hub.docker.com/r/theohbrothers/docker-alpine)

Dockerized alpine with useful tools.

| Tags |
|:-------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` |

"@
    }else {
@"
| ``:$( $_['tag'] )`` |

"@
    }
}) -join ''
)
"@
