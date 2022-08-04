FROM postgres:12

# Add the extensions, Croatian language pack, Slovenian language pack
COPY ./add-extensions-croatian-slovenian-dicts.sh docker-entrypoint-initdb.d/add-extensions-croatian-slovenian-dicts.sh
