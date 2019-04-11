# docker-debian
docker container with sshd and python3 in it.

# USAGE

```bash
# --- env list ---
# SSH_USER
# SSH_PASSWD
# SSH_KEY
#
# PORT (e.g. 1022)
# LISTEN_ADDRESS (e.g. 127.0.0.1)
# PASSWD_AUTH (yes|no)
# PUB_KEY_AUTH (yes|no)
# PERMIT_ROOT_LOGIN (yes|no)
# ALLOW_USER_SUDO (yes|no)

# simple usage

# login name `toor` and password `toor`, toor can't `sudo`
$ docker run -e SSH_USER=toor SSH_PASSWD="toor" -e SSH_PORT=1233 --network=host docker-debian

# login name `toor` and password login disabled, only use private key to login
$ docker run -e SSH_USER=toor SSH_KEY="YOUR_SSH_KEY" -e SSH_PORT=1233 --network=host docker-debian

# login name `toor` and password `toor`, toor can `sudo`
$ docker run -e SSH_USER=toor SSH_PASSWD="toor" -e ALLOW_USER_SUDO=yes -e SSH_PORT=1233 --network=host docker-debian


# login name `root` and password `toor`
$ docker run -e SSH_USER=root SSH_PASSWD="toor" -e SSH_PORT=1233 --network=host docker-debian
# ...
```

# DOCKER-COMPOSE CONFIG

```yaml
version: "3"

services:
    debian.1022:
        image: docker-debian
        container_name: debian_at_1022
        volumes:
            - /data/debian:/home:rw
        environment:
            - SSH_USER=root
            - SSH_KEY=ssh-rsa SSH_KEY_KEY
            - PORT=1022
            - LISTEN_ADDRESS=127.0.0.1
        network_mode: host
        cap_drop:
            - ...
```

# NOTICE
If use `SSH_KEY`, then password authentication will be disabled!

Don't put any important data to the container **anywhere**, except a volumn mounted from host machine.
