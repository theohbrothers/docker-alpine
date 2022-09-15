$local:VARIANTS_DISTRO_VERSIONS = @(
    '3.12'
    '3.11'
    '3.10'
    '3.9'
    '3.8'
)
# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    foreach ($v in $local:VARIANTS_DISTRO_VERSIONS) {
        @{
            distro = 'alpine'
            distro_version = $v
            subvariants = @(
                @{ components = @( 'curl', 'git', 'jq', 'ssh' ); tag_as_latest = if ($v -eq $local:VARIANTS_DISTRO_VERSIONS[0]) { $true } else { $false } }
                @{ components = @( 'curl', 'mysqlclient', 'openssl' ) }
                @{ components = @( 'iptables' ) }
            )
        }
    }
)

$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    distro = $variant['distro']
                    distro_version = $variant['distro_version']
                    platforms = & {
                        if ($variant -in @( '3.3', '3.4', '3.5' ) ) {
                            'linux/amd64'
                        }else {
                            'linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/s390x'
                        }
                    }
                    components = $subVariant['components']
                }
                # Docker image tag. E.g. '3.8-curl'
                tag = @(
                        $variant['distro_version']
                        $subVariant['components'] | ? { $_ }
                ) -join '-'
                tag_as_latest = if ( $subVariant.Contains('tag_as_latest') ) {
                                    $subVariant['tag_as_latest']
                                } else {
                                    $false
                                }
            }
        }
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $true
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
