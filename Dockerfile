FROM python:3.9

RUN PB_REL="https://github.com/protocolbuffers/protobuf/releases/download"; \
    PB_VER="3.17.3"; \
    PB_FILE="protobuf-all-${PB_VER}.tar.gz"; \
    PB_URL="${PB_REL}/v${PB_VER}/${PB_FILE}"; \
    wget "${PB_URL}"; \
    tar -xzf "${PB_FILE}"; \
    rm "${PB_FILE}"; \
    mv protobuf-${PB_VER} protobuf; \
    cd protobuf; \
    ./autogen.sh; \
    ./configure; \
    make; \
    make install; \
    cd ..; \
    pip install betterproto[compiler];

ENV LD_LIBRARY_PATH=/usr/local/lib/

COPY merge-python.py /usr/bin/merge-python.py
COPY main.sh /usr/bin/main.sh

WORKDIR /src

ENTRYPOINT [ "/usr/bin/main.sh" ]
