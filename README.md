[![Build Status][ci_img]][ci_link]
[![Test Coverage][cov_img][cov_link]

[ci_link]: https://travis-ci.org/campisano/test_travisci_dockerhub_release
[ci_img]: https://travis-ci.org/campisano/test_travisci_dockerhub_release.svg?branch=master "Continuous Integration"
[cov_link]: https://codecov.io/gh/campisano/test_travisci_dockerhub_release
[cov_img]: https://codecov.io/gh/campisano/test_travisci_dockerhub_release/branch/master/graph/badge.svg

# Sample CI/CD project with dockerhub integration

This project shows how to setup a pipeline using travis-ci to:
- build and test a (C++) project using a specific docker image;
- produce and send coverage info to codecov.io;
- build a release docker image and push it back to hub.docker.com;
- create the image-related tag and push it back to github.com.



## CI Rules:

1) not-master branch:
    - build, test, coverage
0) master branch:
    - check no git tag and create new one
    - build, test, coverage
    - build docker image
    - push docker image



## CI requirements:
    - docker repository (dockerhub) push access
    - git remote (github) push access
    - codecov access



## Configuration:

1) configure the follows travis-ci environment variables:
    - DOCKER_USERNAME
    - DOCKER_PASSWORD
    - DOCKER_REPOSITORY
    - GIT_USERNAME
    - GIT_PASSWORD
    - GIT_EMAIL
    - GIT_REPOSITORY_URL
    - CODECOV_TOKEN

2) edit the scripts in the `./ci/custom` folder



## Screenshots:

* travis-ci env vars configs

![Alt text](/doc/README.md/travisci-config.png?raw=true "travis-ci env vars")


* travis-ci builds

![Alt text](/doc/README.md/travisci-builds.png?raw=true "travis-ci builds")


* dockerhub images

![Alt text](/doc/README.md/dockerhub-images.png?raw=true "dockerhub images")
