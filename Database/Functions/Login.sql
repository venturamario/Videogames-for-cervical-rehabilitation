CREATE OR REPLACE FUNCTION public.login(username VARCHAR, password VARCHAR)
RETURNS SETOF usuario AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM usuario
    WHERE usuario.username = $1 AND usuario.password = $2;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
