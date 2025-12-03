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
