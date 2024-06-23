-- Funcion para obtener los detalles de un juego
CREATE OR REPLACE FUNCTION get_game_details(p_idGame INT)
RETURNS TABLE(idGame INT, name VARCHAR, description VARCHAR, difficulty FLOAT, idCerv INT) AS $$
BEGIN
    RETURN QUERY
    SELECT J.idGame, J.name, J.description, J.difficulty, J.idCerv
    FROM JUEGO J
    WHERE J.idGame = p_idGame;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT * FROM get_game_details(1);  -- Reemplaza '1' con el idGame deseado"
