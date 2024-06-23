CREATE OR REPLACE FUNCTION public.create_user(
    p_username VARCHAR,
    p_name VARCHAR,
    p_lastname VARCHAR,
    p_password VARCHAR,
    p_level INT DEFAULT 0,
    p_xp FLOAT DEFAULT 0.0  -- valor por defecto en caso de que no se especifique
)
RETURNS BOOLEAN AS $$
BEGIN
    -- Intentar insertar un nuevo usuario en la tabla
    INSERT INTO usuario (username, name, lastname, password, level, xp)
    VALUES (p_username, p_name, p_lastname, p_password, p_level, p_xp);

    -- Si la inserción es exitosa, retornar verdadero
    RETURN TRUE;
EXCEPTION WHEN UNIQUE_VIOLATION THEN
    -- Si se viola la restricción de unicidad, retornar falso
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
