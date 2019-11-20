# Sample CI/CD project with dockerhub integration [![Build Status][ci_img]][ci_link]
[ci_link]: https://travis-ci.org/campisano/test_travisci_dockerhub_release
[ci_img]: https://travis-ci.org/campisano/test_travisci_dockerhub_release.svg?branch=master "Continuous Integration"

This project show how to setup a pipeline using travis-ci to:
    - build and test a (C++) project using a specific docker image;
    - build a release docker image and push it back to dockerhub;
    - create the image-related tag and push it back to github.

## CI Rules:

1) not-master branch:
    - build and test
0) master branch:
    - check no git tag and create new one
    - build and test
    - build docker image
    - push docker image

## CI requirements:
    - docker repository (dockerhub) push access
    - git remote (github) push access

### Sample travis-ci configuration for env vars

![Alt text](/doc/README.md/travisci-config.png?raw=true "travis-ci env vars")
