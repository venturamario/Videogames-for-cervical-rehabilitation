-- Funcion para hacer un update de un usuario en profile detail
CREATE OR REPLACE FUNCTION update_user_profile(
    p_username VARCHAR,
    p_name VARCHAR,
    p_lastname VARCHAR,
    p_password VARCHAR,
    p_xp INT,
    p_level INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE USUARIO
    SET 
        name = p_name,
        lastname = p_lastname,
        password = p_password,
        xp = p_xp,
        level = p_level
    WHERE 
        username = p_username;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT update_user_profile('mario.ventura', 'Mario', 'Ventura', '8522', 99, 9999);"
