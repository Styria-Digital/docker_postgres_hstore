FROM postgres:10

# Add the hstore extensions
COPY ./add_hstore.sh docker-entrypoint-initdb.d/hstore.sh

# Add the Croatian language pack
COPY ./croatian/ /usr/share/postgresql/10/tsearch_data/
COPY ./add_croatian_language_pack.sh docker-entrypoint-initdb.d/add_croatian_language_pack.sh
