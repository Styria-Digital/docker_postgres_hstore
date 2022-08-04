# Add hstore to already created database
"${psql[@]}" --dbname="$POSTGRES_DB" <<-'EOSQL'
    CREATE EXTENSION IF NOT EXISTS unaccent;
EOSQL

# Add hstore to template so all created databases will contain hstore
"${psql[@]}" --dbname="template1" <<-'EOSQL'
    CREATE EXTENSION IF NOT EXISTS unaccent;
EOSQL
