-- Funcion para seguir a un usuario
CREATE OR REPLACE FUNCTION follow_user(
    p_username1 VARCHAR,
    p_username2 VARCHAR
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO R_USUARIO_USUARIO (username1, username2)
    VALUES (p_username1, p_username2)
    ON CONFLICT DO NOTHING;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT follow_user('john_doe', 'jane_smith');"
