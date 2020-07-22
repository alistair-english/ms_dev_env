FROM osrf/ros:melodic-desktop-full

# ==============================================================================
#                    Set up a user mirroring the Host
# ==============================================================================
ARG HOST_USER
ARG HOST_UID
# dialout group is used for compatability with mac
ARG HOST_GROUP=dialout

# create user and set password
RUN useradd \
        -r \
        -m \
        -d /home/${HOST_USER}/ \
        -u ${HOST_UID} \
        -g ${HOST_GROUP} \
        -G sudo,video,audio \
        ${HOST_USER} && \
    echo ${HOST_USER}:password | chpasswd


# set workdir to workspace
WORKDIR /home/${HOST_USER}/qutms_ws

# ==============================================================================
#                          Install extra tools
# ==============================================================================
RUN apt-get update && apt-get install -y \
    sudo \
    tmux \
    && rm -rf /var/lib/apt/lists/*

# ==============================================================================
#                               ROS stuff
# ==============================================================================
RUN apt-get update && apt-get install -y \
    python-catkin-tools \
    # Add other ros depencencies here:
    && rm -rf /var/lib/apt/lists/*