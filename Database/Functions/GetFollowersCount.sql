-- Obtiene el numero de seguidores de un usuario
CREATE OR REPLACE FUNCTION get_followers_count(p_username VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    follower_count INTEGER;
BEGIN
    SELECT COUNT(username1) INTO follower_count
    FROM public.r_usuario_usuario
    WHERE username2 = p_username
    GROUP BY username2;

    RETURN follower_count;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT get_followers_count('mario.ventura');"