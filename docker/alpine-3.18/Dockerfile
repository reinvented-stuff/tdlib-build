ARG ALPINE_VERSION=3.18

FROM alpine:${ALPINE_VERSION} AS builder

ARG BUILD_THREADS=4
ARG TD_REPO_URL="https://github.com/tdlib/td.git"

RUN apk update
RUN apk upgrade
RUN apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake

RUN mkdir -p -v /src
WORKDIR /src

RUN git clone "${TD_REPO_URL}" "/src/td"

RUN mkdir -p -v /src/td/build
WORKDIR /src/td/build

RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
RUN cmake --build . --target prepare_cross_compiling -- -j "${BUILD_THREADS}"

WORKDIR /src/td
RUN php SplitSource.php

WORKDIR /src/td/build
RUN cmake --build . --target install -- -j "${BUILD_THREADS}"


FROM alpine:${ALPINE_VERSION}

COPY --from=builder /src/td/tdlib /src/td/tdlib
