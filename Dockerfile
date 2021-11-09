FROM docker:20.10

LABEL MAINTAINER="Rasmus Munk <rasmus.munk@nbi.ku.dk>"

ENV SWARM_CLIENT_VERSION="3.9" \
    DOCKER_COMPOSE_VERSION="1.29.2" \
    COMMAND_OPTIONS="" \
    JENKINS_USER="" \
    JENKINS_PASS=""

# To install cryptography, the rust compiler needs to be installed
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# https://dentrassi.de/2020/06/17/headless-installation-of-cargo-and-rust/
RUN apk --update --no-cache add curl bash && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN adduser -G root -D jenkins && \
    apk --update --no-cache add gcc libffi-dev python3 py3-pip python3-dev musl-dev openssl openssl-dev make openjdk11-jre git git-lfs ca-certificates && \
    source $HOME/.cargo/env

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]