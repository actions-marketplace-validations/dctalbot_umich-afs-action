# Container image that runs your code
FROM alpine:3.14.0

# Install packages
RUN apk update
RUN apk add --no-cache rsync openssh-client sshpass

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY testfile.txt /testfile.txt


# Make /entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
