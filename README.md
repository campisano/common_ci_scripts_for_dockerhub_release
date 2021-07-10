[![Build Status](https://gitlab.com/campisano/common_ci_scripts_for_dockerhub_release/badges/master/pipeline.svg "Build Status")](https://gitlab.com/campisano/common_ci_scripts_for_dockerhub_release/-/pipelines)
[![Sonar Coverage](https://sonarcloud.io/api/project_badges/measure?project=common_ci_scripts_for_dockerhub_release&metric=coverage "Sonar Coverage")](https://sonarcloud.io/dashboard?id=common_ci_scripts_for_dockerhub_release)
[![Sonar Maintainability](https://sonarcloud.io/api/project_badges/measure?project=common_ci_scripts_for_dockerhub_release&metric=sqale_rating "Sonar Maintainability")](https://sonarcloud.io/dashboard?id=common_ci_scripts_for_dockerhub_release)
[![Docker Image](https://img.shields.io/docker/image-size/riccardocampisano/public/common_ci_scripts_for_dockerhub_release-latest?label=common_ci_scripts_for_dockerhub_release-latest&logo=docker "Docker Image")](https://hub.docker.com/r/riccardocampisano/public/tags?name=common_ci_scripts_for_dockerhub_release)

# Sample CI/CD project with dockerhub integration

This project shows how to setup a pipeline using CI services like GitLab or Travis CI to:
- build and test a (C++/Java/etc) project using specific docker images;
- produce and send coverage info to sonarcloud.io;
- build a docker image, tag and push it to hub.docker.com;
- create the git tag related with the build and push it back to your repository.



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



    Step by step howto:

        1 - GitLab access
          login with your account on gitlab.com and go to -> user-icon -> Edit profile -> Access Tokens
            create a new Token (with read_repository and write_repository scopes) to allow CI pipeline to push tags into GitLab  (suggested name: "CI push")
          go to gitlab.com  -> your project -> Settings -> CI/CD -> Variables Expand
            add the follow env vars:
            - GIT_REPOSITORY_URL (not masked) containing the GitLab repository to push tags (e.g. gitlab.com/campisano/common_ci_scripts_for_dockerhub_release)
            - GIT_EMAIL          (not masked) containing a email for commit logs            (e.g. cipush@gitlab)
            - GIT_USERNAME       (not masked) containing the fixed GitLab username          (exactly gitlab-ci-token, see https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)
            - GIT_PASSWORD       (masked)     containing the GitLab Personal access token   (e.g. the previously created)

        2 - Docker Hub access
          login with your account on hub.docker.com and go to -> Account Settings -> Security
            create a new Access Token to allow CI pipeline to push images into Docker Hub (suggested description: "CI push")
          go to gitlab.com  -> your project -> Settings -> CI/CD -> Variables Expand
            add the follow env vars:
            - DOCKER_REPOSITORY (not masked) containing the Docker Hub repository to push images (e.g. riccardocampisano/public)
            - DOCKER_USERNAME   (not masked) containing your Docker Hub username                 (e.g. riccardocampisano)
            - DOCKER_PASSWORD   (masked)     containing the Docker Hub Access Token              (e.g. the previously created)

        3 - SonarCloud access
          login with your account on sonarcloud.io and go to -> user-icon -> My Account -> Security
            create a new Token to allow CI pipeline to push code analisys into SonarCloud (suggested name: "CI push")
          go to gitlab.com  -> your project -> Settings -> CI/CD -> Variables Expand
            add the follow env vars:
            - SONAR_ORGANIZATION (not masked) containing the SonarCloud organization key  (e.g. campisano)
            - SONAR_PROJECT      (not masked) containing a SonarCloud key for the project (e.g. common_ci_scripts_for_dockerhub_release)
            - SONAR_TOKEN        (masked)     containing the SonarCloud Token             (e.g. the previously created)





2) edit the scripts in the `./ci/custom` folder



## Screenshots:



### Required pipeline env vars

![Alt text](/doc/README.md/pipeline-env-vars.png?raw=true "pipeline env vars")



### Resulting pipeline builds

![Alt text](/doc/README.md/pipeline-builds.png?raw=true "pipeline builds")



### Resulting dockerhub images

![Alt text](/doc/README.md/dockerhub-images.png?raw=true "dockerhub images")
