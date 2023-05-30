FROM bitnami/minideb:bullseye

RUN apt-get update && apt-get install -y \
    build-essential \
    libfl-dev \
    python3-psycopg2 \
    unzip \
    python-is-python3 \
    postgresql-client

COPY RFTagger.zip /
RUN unzip RFTagger.zip && cd RFTagger/src && make && make install && cd /

COPY morpheus/ /morpheus/
WORKDIR /morpheus/src
RUN make && make install

WORKDIR /morpheus
RUN ./update.sh && ./update.sh

COPY latin-macronizer/ /latin-macronizer/

COPY treebank_data/ /treebank_data

WORKDIR /latin-macronizer
RUN ./train-rftagger.sh

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
