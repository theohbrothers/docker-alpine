# Docker image variants' definitions
$VARIANTS_VERSION = "1.0.0a"
$VARIANTS = @(
    @{
        tag = 'curl'
        distro = 'alpine'
    }
    @{
        tag = 'git'
        distro = 'alpine'
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    version = $VARIANTS_VERSION
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $false
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