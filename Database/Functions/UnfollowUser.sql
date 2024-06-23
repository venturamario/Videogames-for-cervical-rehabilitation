-- Funcion para dejar de seguir a un usuario
CREATE OR REPLACE FUNCTION unfollow_user(
    p_username1 VARCHAR,
    p_username2 VARCHAR
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM R_USUARIO_USUARIO
    WHERE username1 = p_username1 AND username2 = p_username2;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT unfollow_user('john_doe', 'jane_smith');"
