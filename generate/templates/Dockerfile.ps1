@"
FROM $( $VARIANT['_metadata']['distro'] ):$( $VARIANT['_metadata']['distro_version'] )

$(
($VARIANT['_metadata']['components'] | % {
    $component = $_

    switch( $component ) {

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

        'jq' {
        @"
RUN apk add --no-cache jq


"@
        }

        'mysqlclient' {
        @"
RUN apk add --no-cache mysqlclient


"@
        }

        'openssl' {
        @"
RUN apk add --no-cache openssl


"@
        }

        'ssh' {
        @"
RUN apk add --no-cache ssh


"@
        }

        default {
            throw "No such component: $component"
        }
    }
}) -join ''
)
"@
