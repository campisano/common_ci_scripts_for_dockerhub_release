[![Build Status](https://gitlab.com/campisano/common_ci_scripts_for_dockerhub_release/badges/master/pipeline.svg "Build Status")](https://gitlab.com/campisano/common_ci_scripts_for_dockerhub_release)
[![Test Coverage](https://codecov.io/gh/campisano/common_ci_scripts_for_dockerhub_release/branch/master/graph/badge.svg "Test Coverage")](https://codecov.io/gh/campisano/common_ci_scripts_for_dockerhub_release)
[![Code Quality](https://img.shields.io/lgtm/grade/cpp/g/campisano/common_ci_scripts_for_dockerhub_release.svg "Code Quality")](https://lgtm.com/projects/g/campisano/common_ci_scripts_for_dockerhub_release/context:cpp)
[![Sonar Coverage](https://sonarcloud.io/api/project_badges/measure?project=common_ci_scripts_for_dockerhub_release&metric=coverage "Sonar Coverage")](https://sonarcloud.io/dashboard?id=common_ci_scripts_for_dockerhub_release)
[![Sonar Maintainability](https://sonarcloud.io/api/project_badges/measure?project=common_ci_scripts_for_dockerhub_release&metric=sqale_rating "Sonar Maintainability")](https://sonarcloud.io/dashboard?id=common_ci_scripts_for_dockerhub_release)
[![Docker Image](https://img.shields.io/docker/image-size/riccardocampisano/public/common_ci_scripts_for_dockerhub_release-latest?label=common_ci_scripts_for_dockerhub_release-latest&logo=docker "Docker Image")](https://hub.docker.com/r/riccardocampisano/public/tags?name=common_ci_scripts_for_dockerhub_release)

# Sample CI/CD project with dockerhub integration

This project shows how to setup a pipeline using CI services like GitLab or travis-ci to:
- build and test a (C++/Java/etc) project using a specific docker image;
- produce and send coverage info to sonarcloud.io and codecov.io;
- build a docker image, tag and push it to hub.docker.com;
- create the image-related git tag and push it back to your repository.



## CI Rules:

1) not-master branch:
    - build, test, coverage
0) master branch:
    - build, test, coverage
    - ensure uniqueness and push a new git tag
    - build and pus docker image



## CI requirements:
    - docker repository (hub.docker.com) push access
    - git remote (gitlab.com) push access
    - sonarcloud.io bind
    - codecov.io access



## Configuration:

1) configure the follows pipeline environment variables:
    - DOCKER_USERNAME
    - DOCKER_PASSWORD
    - DOCKER_REPOSITORY
    - GIT_USERNAME
    - GIT_PASSWORD
    - GIT_EMAIL
    - GIT_REPOSITORY_URL
    - SONAR_ORGANIZATION
    - SONAR_TOKEN
    - SONAR_PROJECT
    - COVERAGE_TOKEN

2) edit the scripts in the `./ci/custom` folder



## Screenshots:

* required pipeline env vars

![Alt text](/doc/README.md/pipeline-env-vars.png?raw=true "pipeline env vars")


* resulting pipeline builds

![Alt text](/doc/README.md/pipeline-builds.png?raw=true "pipeline builds")


* resulting dockerhub images

![Alt text](/doc/README.md/dockerhub-images.png?raw=true "dockerhub images")
