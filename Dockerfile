FROM hashicorp/packer:latest

RUN \
    apk update \
    && apk upgrade \
    && apk add --upgrade python3 \
    && pip3 install --upgrade pip \
    && apk add --upgrade --virtual cffi-build-dependencies build-base libffi-dev openssl-dev python3-dev \
    && pip3 install --upgrade ansible \
    && apk del cffi-build-dependencies \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

ENTRYPOINT ["/usr/bin/ansible-playbook"]
CMD ["--version"]
