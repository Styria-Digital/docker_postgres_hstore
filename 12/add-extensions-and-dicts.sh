"${psql[@]}" --dbname="$POSTGRES_DB" <<-'EOSQL'
    CREATE EXTENSION IF NOT EXISTS hstore;
    CREATE EXTENSION IF NOT EXISTS unaccent;

    -- create croatian ispell search dictionary
    CREATE TEXT SEARCH DICTIONARY croatian_ispell (
        TEMPLATE = ispell,
        DictFile = croatian,
        AffFile = croatian,
        StopWords = croatian
    );

    -- Create croatian search configuration based on 'simple' configuration
    CREATE TEXT SEARCH CONFIGURATION croatian ( COPY = pg_catalog.simple );

    -- Change croatian search configuration to use our croatian_ispell dictionary we created before
    ALTER TEXT SEARCH CONFIGURATION croatian
        ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
                        word, hword, hword_part
        WITH croatian_ispell, english_stem;
        
    -- Create `croatian_unaccent` search configuration based on `croatian` configuration.
    CREATE TEXT SEARCH CONFIGURATION croatian_unaccent ( COPY = croatian );
    
    -- Change `croatian_unaccent` search configuration to use our `unaccent` extension.
    ALTER TEXT SEARCH CONFIGURATION croatian_unaccent
        ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
                          word, hword, hword_part
        WITH unaccent, croatian_ispell, english_stem;

    -- Remove fulltext search mappings for special types
    ALTER TEXT SEARCH CONFIGURATION croatian
        DROP MAPPING FOR email, url, url_path, sfloat, float;

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
