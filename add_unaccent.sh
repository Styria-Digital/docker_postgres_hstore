# Add unaccent to already created database
"${psql[@]}" --dbname="$POSTGRES_DB" <<-'EOSQL'
    CREATE EXTENSION IF NOT EXISTS unaccent;
EOSQL

# Add unaccent to template so all created databases will contain unaccent
"${psql[@]}" --dbname="template1" <<-'EOSQL'
    CREATE EXTENSION IF NOT EXISTS unaccent;
EOSQL
