# 2048 Game [![Build Status][ci_img]][ci_link] [![Language grade: C/C++][cq_img]][cq_link]
[ci_link]: https://travis-ci.org/campisano/test_travisci_dockerhub_release
[ci_img]: https://travis-ci.org/campisano/test_travisci_dockerhub_release.svg?branch=master "Continuous Integration"
[cq_link]: https://lgtm.com/projects/g/campisano/test_travisci_dockerhub_release/context:cpp
[cq_img]: https://img.shields.io/lgtm/grade/cpp/g/campisano/test_travisci_dockerhub_release.svg?logo=lgtm&logoWidth=18 "Code Quality"

# CI Rules:

1) any branch (any push):
    - build and test
0) in master:
    - check no git tag
    - build and test
    - build docker image
    - test docker image
    - push docker image
    - make git tag

# CI requirements:
    - git remote (github) pull access
    - docker repo (dockerhub) push access
    - git remote (github) push access
