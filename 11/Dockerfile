FROM postgres:11

# Add the Croatian language pack
COPY ./croatian/ /usr/share/postgresql/11/tsearch_data/

# Add the Slovenian language pack
COPY ./slovenian/ /usr/share/postgresql/11/tsearch_data/

# Add the extensions, Croatian language dict, Slovenian language dict
COPY ./add-extensions-and-dicts.sh docker-entrypoint-initdb.d/add-extensions-and-dicts.sh
