FROM alpine:3.14.0

RUN apk update
RUN apk add --no-cache rsync openssh-client sshpass

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
