# Add croatian config to already created database
"${psql[@]}" --dbname="$POSTGRES_DB" <<-'EOSQL'
    -- create croatian ispell search dictionary
    CREATE TEXT SEARCH DICTIONARY croatian_ispell (
        TEMPLATE = ispell,
        DictFile = croatian,
        AffFile = croatian,
        StopWords = croatian
    );

    -- create croatian search configuration based on 'simple' configuration
    CREATE TEXT SEARCH CONFIGURATION croatian ( COPY = pg_catalog.simple );

    -- Change croatian search configuration to use our croatian_ispell dictionary we created before
    ALTER TEXT SEARCH CONFIGURATION croatian
        ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
                        word, hword, hword_part
        WITH croatian_ispell, english_stem;

    -- Remove fulltext search mappings for special types
    ALTER TEXT SEARCH CONFIGURATION croatian
        DROP MAPPING FOR email, url, url_path, sfloat, float;
EOSQL

# Add croatian config to template so all created databases will contain croatian
"${psql[@]}" --dbname="template1" <<-'EOSQL'
    -- create croatian ispell search dictionary
    CREATE TEXT SEARCH DICTIONARY croatian_ispell (
        TEMPLATE = ispell,
        DictFile = croatian,
        AffFile = croatian,
        StopWords = croatian
    );

    -- create croatian search configuration based on 'simple' configuration
    CREATE TEXT SEARCH CONFIGURATION croatian ( COPY = pg_catalog.simple );

    -- Change croatian search configuration to use our croatian_ispell dictionary we created before
    ALTER TEXT SEARCH CONFIGURATION croatian
        ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
                        word, hword, hword_part
        WITH croatian_ispell, english_stem;

    -- Remove fulltext search mappings for special types
    ALTER TEXT SEARCH CONFIGURATION croatian
        DROP MAPPING FOR email, url, url_path, sfloat, float;
EOSQL
