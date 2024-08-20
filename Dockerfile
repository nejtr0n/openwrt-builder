FROM ubuntu:20.04

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        sudo time git-core subversion build-essential gcc-multilib g++ bash make \
        libssl-dev patch libncurses5 libncurses5-dev zlib1g-dev gawk \
        flex gettext wget unzip xz-utils python python-distutils-extra \
        python3 python3-distutils python3-distutils-extra grep rsync curl libsnmp-dev liblzma-dev \
        libpam0g-dev cpio rsync quilt vim nano && \
    apt-get clean && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user

# set dummy git config
RUN git config --global user.name "user" && git config --global user.email "user@example.com"