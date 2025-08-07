ARG PY_VER=${PY_VER}
FROM python:${PY_VER}

ARG CURATOR_VER=${CURATOR_VER}
RUN pip install curator-opensearch==${CURATOR_VER}

RUN useradd --create-home curator
WORKDIR /home/curator
USER curator

RUN /usr/local/bin/curator --version
RUN /usr/local/bin/curator --help

ENTRYPOINT [ "/usr/local/bin/curator" ]
