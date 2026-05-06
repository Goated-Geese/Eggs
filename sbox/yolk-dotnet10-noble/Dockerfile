# Pelican-compatible yolk: Ubuntu 24.04 (Noble) + Microsoft .NET 10 runtime.
# Intended for apps whose native libs need GLIBC >= 2.38 (e.g. s&box libengine2.so).
#
# Requires: Pelican Wings contract — user `container`, home `/home/container`, WORKDIR `/home/container`,
# tini + entrypoint.sh. See https://pelican.dev/docs/eggs/creating-a-custom-yolk
#
# Build (amd64/arm64 multi-platform optional):
#   docker build --platform linux/amd64 -t ghcr.io/<org>/sbox-dotnet10-noble:latest -f Dockerfile .
# Push and set this image on the nest / egg Docker images list.

FROM --platform=$TARGETOS/$TARGETARCH mcr.microsoft.com/dotnet/runtime:10.0-noble

LABEL org.opencontainers.image.authors="Goated Geese (GG-AU) <hello@gg-au.com>" \
      org.opencontainers.image.description="Pelican yolk — .NET 10 on Ubuntu 24 (glibc 2.39+) for native s&box servers" \
      org.opencontainers.image.source="https://github.com/Goated-Geese/Eggs" \
      org.opencontainers.image.documentation="https://pelican.dev/docs/eggs/creating-a-custom-yolk" \
      org.opencontainers.image.licenses="MIT"

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        iproute2 \
        jq \
        lsof \
        openssl \
        sqlite3 \
        tar \
        tzdata \
        unzip \
        zip \
        tini \
        fontconfig \
        libfreetype6 \
        libxi6 \
        libxcursor1 \
        libxrandr2 \
        libxinerama1 \
        libsdl2-2.0-0 \
        libvulkan1 \
        libopenal1 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -d /home/container -s /bin/bash container

COPY --chown=container:container entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

STOPSIGNAL SIGINT

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]
