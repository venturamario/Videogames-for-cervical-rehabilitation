-- Funcion para ver los puntos totales de un jugador en un juego
CREATE OR REPLACE FUNCTION get_total_points(
    p_username VARCHAR,
    p_idGame INT
)
RETURNS INT AS $$
DECLARE
    v_total_points INT;
BEGIN
    SELECT COALESCE(SUM(numPoints), 0)
    INTO v_total_points
    FROM PUNTOS
    WHERE username = p_username AND idGame = p_idGame;

    RETURN v_total_points;
END;
$$ LANGUAGE plpgsql;
-- Llamada con "SELECT get_total_points('john_doe', 1);  -- Reemplaza 'john_doe' con el username y '1' con el idGame deseado"