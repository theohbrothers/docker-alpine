@'
name: build

on:
  push:
    branches:
    - '**'
    tags:
    - '**'
  pull_request:
    branches:
    - '**'

.build_definition: &build_definition
  steps:
  - uses: actions/checkout@v1
  - name: Display system info (linux)
    run: |
      set -e
      hostname
      whoami
      cat /etc/*release
      lscpu
      free
      df -h
      pwd
      docker info
      docker version
  - name: Login to docker registry
    run: echo "${DOCKERHUB_REGISTRY_PASSWORD}" | docker login -u "${DOCKERHUB_REGISTRY_USER}" --password-stdin
    env:
      DOCKERHUB_REGISTRY_USER: ${{ secrets.DOCKERHUB_REGISTRY_USER }}
      DOCKERHUB_REGISTRY_PASSWORD: ${{ secrets.DOCKERHUB_REGISTRY_PASSWORD }}
  - name: Clean-up
    run: docker logout
    if: always()

jobs:
  alpine:
    runs-on: ubuntu-18.04
    <<: *build_definition
'@
