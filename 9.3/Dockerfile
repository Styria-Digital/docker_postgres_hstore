FROM postgres:9.3

# Add the hstore extensions
COPY ./add_hstore.sh docker-entrypoint-initdb.d/hstore.sh

# Add the Croatian language pack
COPY ./croatian/ /usr/share/postgresql/9.3/tsearch_data/
COPY ./add_croatian_language_pack.sh docker-entrypoint-initdb.d/add_croatian_language_pack.sh

# Add the Slovenian language pack
COPY ./slovenian/ /usr/share/postgresql/9.3/tsearch_data/
COPY ./add_slovenian_language_pack.sh docker-entrypoint-initdb.d/add_slovenian_language_pack.sh
