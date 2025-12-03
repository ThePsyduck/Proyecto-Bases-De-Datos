CREATE OR REPLACE PROCEDURE practica5.registrar_enfrentamiento(
    p_idEnfrentamiento INT,
    p_idTorneo INT,
    p_idPersona INT,
    p_ganador VARCHAR,
    p_resultado VARCHAR
)
AS $$
BEGIN
    INSERT INTO practica5.Enfrentamiento(idEnfrentamiento, idTorneo, idPersona, ganador, resultado)
    VALUES (p_idEnfrentamiento, p_idTorneo, p_idPersona, p_ganador, p_resultado);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE practica5.actualizar_conteo_shinys(p_idPersona INT)
AS $$
DECLARE
    total_shinys INT;
BEGIN
    SELECT COUNT(*) INTO total_shinys
    FROM practica5.Pokemon
    WHERE idPersona = p_idPersona AND shiny = TRUE;

    UPDATE practica5.Participante
    SET conteo = total_shinys
    WHERE idPersona = p_idPersona;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE practica5.asignar_premio(
    p_idPremio INT,
    p_idPersona INT,
    p_idTorneo INT,
    p_idEnfrentamiento INT
)
AS $$
BEGIN
    INSERT INTO practica5.Ganar(idPremio, idPersona, idTorneo, idEnfrentamiento)
    VALUES (p_idPremio, p_idPersona, p_idTorneo, p_idEnfrentamiento);
END;
$$ LANGUAGE plpgsql;
