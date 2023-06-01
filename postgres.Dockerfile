FROM postgres:13.11-bullseye

ARG DB_PASSWORD
ENV POSTGRES_PASSWORD=${DB_PASSWORD}

ARG DB_NAME
ENV POSTGRES_DB=${DB_NAME}

COPY postgres-data/ /var/lib/postgresql/data/
