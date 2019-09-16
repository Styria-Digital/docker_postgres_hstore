# Add slovenian config to already created database
"${psql[@]}" --dbname="$POSTGRES_DB" <<-'EOSQL'
    -- create slovenian ispell search dictionary
    CREATE TEXT SEARCH DICTIONARY slovenian_ispell (
        TEMPLATE = ispell,
        DictFile = slovenian,
        AffFile = slovenian,
        StopWords = slovenian
    );

    -- create slovenian search configuration based on 'simple' configuration
    CREATE TEXT SEARCH CONFIGURATION slovenian ( COPY = pg_catalog.simple );

    -- Change slovenian search configuration to use our slovenian_ispell dictionary we created before
    ALTER TEXT SEARCH CONFIGURATION slovenian
        ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
                        word, hword, hword_part
        WITH slovenian_ispell, english_stem;

    -- Remove fulltext search mappings for special types
    ALTER TEXT SEARCH CONFIGURATION slovenian
        DROP MAPPING FOR email, url, url_path, sfloat, float;
EOSQL

# Add slovenian config to template so all created databases will contain slovenian
"${psql[@]}" --dbname="template1" <<-'EOSQL'
    -- create slovenian ispell search dictionary
    CREATE TEXT SEARCH DICTIONARY slovenian_ispell (
        TEMPLATE = ispell,
        DictFile = slovenian,
        AffFile = slovenian,
        StopWords = slovenian
    );

    -- create slovenian search configuration based on 'simple' configuration
    CREATE TEXT SEARCH CONFIGURATION slovenian ( COPY = pg_catalog.simple );

    -- Change slovenian search configuration to use our slovenian_ispell dictionary we created before
    ALTER TEXT SEARCH CONFIGURATION slovenian
        ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
                        word, hword, hword_part
        WITH slovenian_ispell, english_stem;

    -- Remove fulltext search mappings for special types
    ALTER TEXT SEARCH CONFIGURATION slovenian
        DROP MAPPING FOR email, url, url_path, sfloat, float;
EOSQL
