-- Funcion para buscar usuario con la barra de busqueda
CREATE OR REPLACE FUNCTION search_user(
    p_search_term VARCHAR
)
RETURNS TABLE(username VARCHAR, name VARCHAR, lastname VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT U.username, U.name, U.lastname
    FROM USUARIO U
    WHERE U.username ILIKE '%' || p_search_term || '%' 
       OR U.name ILIKE '%' || p_search_term || '%'
       OR U.lastname ILIKE '%' || p_search_term || '%';
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT * FROM search_user('john');  -- Reemplaza 'john' con el término de búsqueda deseado"
