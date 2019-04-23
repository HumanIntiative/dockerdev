# Dockerfile-db

# Use PostgreSQL 9.6 for the base image
FROM postgres:9.6-alpine

# Copy database initialisation scripts
COPY ./docker/init.sql /docker-entrypoint-initdb.d/
COPY ./docker/database.sql /db/