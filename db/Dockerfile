# syntax=docker/dockerfile:1

FROM postgres:14

COPY db_init_script.sh docker-entrypoint-initdb.d
#ADD .pgpass .
#RUN chmod 0600 docker-entrypoint-initdb.d/.pgpass

#RUN chown postgres:postgres ./docker-entrypoint-initdb.d/*.sh
