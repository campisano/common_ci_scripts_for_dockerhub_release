ARG FROM_IMAGE
FROM --platform=linux/amd64 $FROM_IMAGE AS linux-amd64

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends apt-utils > /dev/null \
    && apt-get -qq -y install --no-install-recommends make libssl1.0.2 libcurl3 > /dev/null \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /usr/share/man/*

RUN useradd -r -U app -d /srv/app -m
USER app:app

COPY ./run.sh /srv/app/run.sh
COPY ./.ci_build_amd64/build /srv/app/build
COPY ./.ci_build_amd64/external /srv/app/external



ARG FROM_IMAGE
FROM --platform=linux/arm64/v8 $FROM_IMAGE AS linux-arm64

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qq -y update \
    && apt-get -qq -y install --no-install-recommends apt-utils > /dev/null \
    && apt-get -qq -y install --no-install-recommends make libssl1.0.2 libcurl3 > /dev/null \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /usr/share/man/*

RUN useradd -r -U app -d /srv/app -m
USER app:app

COPY ./run.sh /srv/app/run.sh
COPY ./.ci_build_arm64v8/build /srv/app/build
COPY ./.ci_build_arm64v8/external /srv/app/external


ARG TARGETOS
ARG TARGETARCH
FROM ${TARGETOS}-${TARGETARCH} as final

WORKDIR /srv/app
CMD ["./run.sh", "release"]
