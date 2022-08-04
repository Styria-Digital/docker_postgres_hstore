FROM postgres:12

# Add the extensions
COPY ../add_hstore.sh docker-entrypoint-initdb.d/hstore.sh
COPY ../add_unaccent.sh docker-entrypoint-initdb.d/unaccent.sh

# Add the Croatian language pack
COPY ../croatian/ /usr/share/postgresql/12/tsearch_data/
COPY ../add_croatian_language_pack.sh docker-entrypoint-initdb.d/add_croatian_language_pack.sh

# Add the Slovenian language pack
COPY ../slovenian/ /usr/share/postgresql/12/tsearch_data/
COPY ../add_slovenian_language_pack.sh docker-entrypoint-initdb.d/add_slovenian_language_pack.sh
