--Funciones
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

--SP

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

--Triggers
-- Función para validar horarios de Visitante
CREATE OR REPLACE FUNCTION practica5.validar_horarios_visitante()
RETURNS TRIGGER
AS $$
BEGIN
    IF NEW.horaSalida <= NEW.horaEntrada THEN
        RAISE EXCEPTION 'La hora de salida debe ser mayor que la hora de entrada';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger asociado a Visitante
CREATE TRIGGER trg_validar_horarios_visitante
BEFORE INSERT OR UPDATE ON practica5.Visitante
FOR EACH ROW
EXECUTE FUNCTION practica5.validar_horarios_visitante();

------------------------------------------------------------

-- Tabla de auditoría
CREATE TABLE practica5.AuditoriaParticipante (
    idLog SERIAL PRIMARY KEY,
    idPersona INT,
    accion VARCHAR(20),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Función del trigger de auditoría
CREATE OR REPLACE FUNCTION practica5.log_participante()
RETURNS TRIGGER
AS $$
BEGIN
    INSERT INTO practica5.AuditoriaParticipante(idPersona, accion)
    VALUES (NEW.idPersona, 'INSERT');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger asociado a Participante
CREATE TRIGGER trg_log_participante
AFTER INSERT ON practica5.Participante
FOR EACH ROW
EXECUTE FUNCTION practica5.log_participante();

------------------------------------------------------------

-- Función para actualizar conteo de shinys
CREATE OR REPLACE FUNCTION practica5.actualizar_conteo_shinys_trigger()
RETURNS TRIGGER
AS $$
DECLARE
    total_shinys INT;
BEGIN
    SELECT COUNT(*) INTO total_shinys
    FROM practica5.Pokemon
    WHERE idPersona = NEW.idPersona AND shiny = TRUE;

    UPDATE practica5.Participante
    SET conteo = total_shinys
    WHERE idPersona = NEW.idPersona;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger asociado a Pokemon
CREATE TRIGGER trg_actualizar_conteo_shinys
AFTER INSERT OR UPDATE ON practica5.Pokemon
FOR EACH ROW
EXECUTE FUNCTION practica5.actualizar_conteo_shinys_trigger();



-- funciones 
SELECT nombre, calcular_edad_participante(idPersona) AS edad
FROM practica5.Participante;

SELECT contar_shinys(1);
SELECT promedio_cp(1);

--procedimientos 
-- Consultar edad de un participante con idPersona = 5
SELECT practica5.calcular_edad_participante(5);

-- Consultar cuántos shinys tiene el participante con idPersona = 5
SELECT practica5.contar_shinys(5);

-- Consultar el promedio de CP de los Pokémon del participante con idPersona = 5
SELECT practica5.promedio_cp(5);

--triggers
INSERT INTO practica5.Visitante(
    idPersona, idEvento, horaEntrada, horaSalida, fechaNacimiento,
    apellidoMaterno, apellidoPaterno, nombre, sexo, conteo
)
VALUES (
    200, 1, '14:00', '15:00', '2000-01-01',
    'López', 'García', 'Juan', 'Masculino', 0
);


-- 2. Probar trigger de auditoría en Participante
-- Este INSERT debe generar un registro en practica5.AuditoriaParticipante
INSERT INTO practica5.Participante(
    idPersona, numeroCuenta, idEvento, correo, facultad, carrera,
    fechaNacimiento, apellidoMaterno, apellidoPaterno, nombre, sexo, conteo
)
VALUES (
    300, '123456789', 1, 'test@unam.mx', 'Ciencias', 'Computación',
    '2001-05-05', 'Hernández', 'Martínez', 'Ana', 'Femenino', 0
);

-- Consultar la tabla de auditoría para verificar que se insertó el log
SELECT * FROM practica5.AuditoriaParticipante;

-- 3. Probar trigger de actualización de conteo de shinys
-- Este INSERT debe actualizar el campo conteo en Participante (idPersona = 300)
INSERT INTO practica5.Pokemon(
    idPokemon, idPersona, cp, nombre, horaCaptura, sexo, especie, peso, shiny
)
VALUES (
    400, 300, 1200, 'Pikachu', '16:00', 'Macho', 'Pikachu', 6.0, TRUE
);

-- Consultar el conteo actualizado en Participante
SELECT conteo
FROM practica5.Participante
WHERE idPersona = 300;

