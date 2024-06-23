CREATE OR REPLACE FUNCTION public.findUsername(username VARCHAR)
RETURNS SETOF usuario AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM usuario
    WHERE usuario.username = $1;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;