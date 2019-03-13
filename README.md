# docker-with-sshd
docker container with sshd and python3 in it.

# USAGE

```bash
# use specific root password
docker run -e SSH_PASSWD="PASSWD" -e SSH_PORT=1233 --network=host docker-with-sshd

# with random root password, and bind to port 1233
docker run -e SSH_PORT=1233 --network=host docker-with-sshd

# use your own ssh key
docker run -e SSH_KEY="YOUR_SSH_KEY" -e SSH_PORT=1233 --network=host docker-with-sshd
```

# NOTICE
If use `SSH_KEY`, then password authentication will be disabled!

Don't put any important data to the container **anywhere**, except a volumn mounted from host machine.
