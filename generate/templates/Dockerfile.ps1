@"
FROM $( $VARIANT['_metadata']['distro'] ):$( $VARIANT['_metadata']['distro_version'] )

RUN apk add --no-cache ca-certificates


"@

$VARIANT['_metadata']['components'] | % {
    $component = $_

    switch( $component ) {
        'apprise' {
            if ( [version]$VARIANT['_metadata']['distro_version'] -ge [version]'3.21' ) {
                 @"
RUN apk add --no-cache apprise


"@
            }else {
        @"
RUN set -eux; \
    apk add --repository=https://dl-cdn.alpinelinux.org/alpine/v3.21/community --no-cache apprise; \
    apprise --version


"@
            }
        }

        'curl' {
        @"
RUN apk add --no-cache curl


"@
        }

        'git' {
        @"
RUN apk add --no-cache git


"@
        }

        'iptables' {
        @"
RUN apk add --no-cache iptables


"@
        }

        'jq' {
        @"
RUN apk add --no-cache jq


"@
        }

        'mysqlclient' {
        @"
RUN apk add --no-cache mysql-client


"@
        }

        'openssl' {
        @"
RUN apk add --no-cache openssl


"@
        }

        'pingme' {
            $PINGME_VERSION = "v$( $global:VERSIONS.pingme.versions[0] )"
            Generate-DownloadBinary @{
                binary = 'pingme'
                version = $PINGME_VERSION
                checksumsUrl = "https://github.com/kha7iq/pingme/releases/download/$PINGME_VERSION/pingme_checksums.txt"
                archiveformat = '.tar.gz'
                archivefiles = @(
                    'pingme'
                    'LICENSE.md'
                )
                architectures = $VARIANT['_metadata']['platforms']
                testCommand = 'pingme --version'
            }
        }

        'rsync' {
            @"
RUN apk add --no-cache rsync


"@
        }

        'ssh' {
            @"
RUN apk add --no-cache openssh


"@
        }

        'yq' {
            @"
RUN set -eux; \
    apk add --repository=https://dl-cdn.alpinelinux.org/alpine/v3.24/community --no-cache yq-go; \
    yq --version


"@
        }

        default {
            throw "No such component: $component"
        }
    }
}
