# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    @{
        distro = 'alpine'
        distro_version = '3.8'
        subvariants = @(
            @{ components = @( 'curl' ) }
            @{ components = @( 'git' ) }
            @{ components = @( 'jq' ) }
            @{ components = @( 'ssh' ) }
            @{ components = @( 'curl', 'git' ) }
            @{ components = @( 'curl', 'jq' ) }
            @{ components = @( 'curl', 'git', 'jq' ) }
            @{ components = @( 'curl', 'git', 'ssh' ) }
            @{ components = @( 'mysqlclient', 'openssl' ) }
        )
    }
)

$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    components = $subVariant['components']
                    distro = $variant['distro']
                    distro_version = $variant['distro_version']
                }
                # Docker image tag. E.g. 'v2.3.0.0-alpine-3.6'
                tag = @(
                        $subVariant['components'] | ? { $_ }
                        $variant['distro']
                        $variant['distro_version']
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
                includeHeader = $true
                includeFooter = $true
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}

# Send definitions down the pipeline
$VARIANTS
