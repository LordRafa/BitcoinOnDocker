FROM ubuntu:24.04

LABEL maintainer="Rafael Waldo Delgado Doblas"

# Initial Setup
ARG UID=1001
ARG GID=1001
ARG USER="ondocker"
ARG BITCOIN_VERSION="v27.1"
ENV APP_HOME="/App_Home"

ENV DEBIAN_FRONTEND="noninteractive"

# Installing Build Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential libtool autotools-dev\
    automake pkg-config bsdmainutils python3 libevent-dev\
    libboost-dev libsqlite3-dev libminiupnpc-dev libnatpmp-dev\
    libzmq3-dev systemtap-sdt-dev qtbase5-dev qttools5-dev\
    qttools5-dev-tools qtwayland5 libqrencode-dev gawk git\
    bash-completion vim

RUN git clone https://github.com/bitcoin/bitcoin.git --depth 1 --branch "$BITCOIN_VERSION" /tmp/bitcoin && \
    cd /tmp/bitcoin && \
    git config --local user.email "author@example.com" && git config --local user.name "A U Thor" && \
    ./autogen.sh && ./configure && make -j8 && make check && make install

# Cleaning up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setting up the user
VOLUME "$APP_HOME"
RUN ln -s "$APP_HOME" "/home/$USER"

RUN userdel -r ubuntu
RUN groupadd -g "$GID" -r "$USER"
RUN useradd -u "$UID" -g "$GID" -r "$USER"

# Provisioning required configs and executables
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh

WORKDIR "/home/$USER"
# Setting up entry point
USER "$USER"
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

