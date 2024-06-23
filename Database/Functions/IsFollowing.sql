-- Funcion para saber si un usuario sigue a otro
CREATE OR REPLACE FUNCTION is_following(
    p_username1 VARCHAR,
    p_username2 VARCHAR
)
RETURNS BOOLEAN AS $$
DECLARE
    v_exists BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM R_USUARIO_USUARIO
        WHERE username1 = p_username1 AND username2 = p_username2
    ) INTO v_exists;

    RETURN v_exists;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT is_following('john_doe', 'jane_smith');  -- Retorna TRUE o FALSE"
