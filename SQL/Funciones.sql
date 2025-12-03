-- Función para calcular edad del participante
CREATE OR REPLACE FUNCTION practica5.calcular_edad_participante(id INT)
RETURNS INT
AS $$
DECLARE
    edad INT;
BEGIN
    SELECT EXTRACT(YEAR FROM age(current_date, fechaNacimiento))
    INTO edad
    FROM practica5.Participante
    WHERE idPersona = id;

    RETURN edad;
END;
$$ LANGUAGE plpgsql;

-- Función para contar shinys de un participante
CREATE OR REPLACE FUNCTION practica5.contar_shinys(id INT)
RETURNS INT
AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM practica5.Pokemon
    WHERE idPersona = id AND shiny = TRUE;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular promedio de CP de un participante
CREATE OR REPLACE FUNCTION practica5.promedio_cp(id INT)
RETURNS NUMERIC
AS $$
DECLARE
    promedio NUMERIC;
BEGIN
    SELECT AVG(cp)
    INTO promedio
    FROM practica5.Pokemon
    WHERE idPersona = id;

    RETURN promedio;
END;
$$ LANGUAGE plpgsql;
