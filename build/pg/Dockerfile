FROM postgres:18

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-18-postgis-3 \
		postgresql-18-postgis-3-scripts \
		postgresql-18-pgvector \
	&& rm -rf /var/lib/apt/lists/*

COPY ./docker-entrypoint-initdb.d/00-extensions.sql /docker-entrypoint-initdb.d/00-extensions.sql
