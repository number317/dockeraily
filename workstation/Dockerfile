FROM archlinux/base

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=cheon
ARG USER_UID=1000
ARG USER_GID=$USER_UID

COPY ./pacman.conf /etc/pacman.conf
COPY ./mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syy \
    && pacman --noconfirm -S sudo git tar vim emacs-nox \
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for non-root user
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && pacman --noconfirm -Scc
WORKDIR /home/cheon
