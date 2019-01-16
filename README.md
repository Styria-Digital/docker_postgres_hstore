The styriadigital/postgres_hstore image provides a Docker container running Postgres with HStore extension installed. This image is based on the official postgres image and provides variants for each version of Postgres 9 supported by the base image (9.3-9.6), Postgres 10, and Postgres 11.

This image ensures that the default created database and all subsequently created databases will have HStore extension enabled.

# Usage
In order to run a basic container capable of serving a HStore-enabled database, start a container as follows:

docker run --name some-hstore -d styriadigital/postgres_hstore
For more detailed instructions about how to start and control your Postgres container, see the documentation for the postgres image [here](https://hub.docker.com/_/postgres).

See the [Hstore](http://postgresguide.com/cool/hstore.html) documentation for more details on your options for creating and using a hstore database.

# Build

Push to master triggers autobuild on dockerhub and automatically updates appropriate tags.
