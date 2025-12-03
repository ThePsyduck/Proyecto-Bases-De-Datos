
-- i. Mostrar el nombre completo de todos los participantes junto con su cuenta de Pokémon Go.
SELECT 
    p.nombre || ' ' || p.apellidoPaterno || ' ' || p.apellidoMaterno AS nombre_completo,
    c.nombreUsuario AS cuenta_pokemon_go
FROM practica5.Participante p
JOIN practica5.CuentaPokemon c 
    ON p.idPersona = c.idPersona;


-- ii. Calcular cuántos Pokémons registró cada participante para el torneo de peleas por cada una de las ediciones.
SELECT
    e.numEdicion,
    p.idPersona,
    p.nombre || ' ' || p.apellidoPaterno AS nombre_completo,
    COUNT(po.idPokemon) AS total_pokemons
FROM practica5.Participante p
JOIN practica5.Evento e
    ON p.idEvento = e.idEvento -- 1. Se une con Evento para obtener el número de edición.
JOIN practica5.Participar pa
    ON p.idPersona = pa.idPersona -- 2. Se asegura que el Participante esté inscrito en al menos un Torneo.
JOIN practica5.TorneoPeleas tp
    ON pa.idTorneo = tp.idTorneo -- 3. Se verifica que el torneo sea específicamente de Peleas.
JOIN practica5.Pokemon po
    ON p.idPersona = po.idPersona -- 4. Se unen los Pokémons registrados por el Participante.
GROUP BY
    e.numEdicion,
    p.idPersona,
    p.nombre,
    p.apellidoPaterno
ORDER BY
    e.numEdicion, p.idPersona;


-- iii. Listar todos los Pokémones cuya especie contenga la cadena ćhu ́
SELECT *
FROM practica5.Pokemon
WHERE especie ILIKE '%chu%';


--iv. Obtener la lista de participantes que estén inscritos en el Torneo de Captura de Shiny y a su vez que no estén
--inscritos en el torneo de distancia recorrida.
SELECT p.idPersona,
       p.nombre || ' ' || p.apellidoPaterno AS nombre
FROM practica5.Participante p
JOIN practica5.Participar ps
    ON ps.idPersona = p.idPersona
WHERE ps.idTorneo IN (SELECT idTorneo FROM practica5.TorneoShinys)
  AND p.idPersona NOT IN (
        SELECT idPersona 
        FROM practica5.Participar
        WHERE idTorneo IN (SELECT idTorneo FROM practica5.TorneoDistancia)
  );


--v. Calcular la distancia total recorrida por cada participante en el torneo de distancia recorrida.
SELECT 
    par.idPersona,
    par.nombre,
    SUM(pl.puntosLocacion) AS distancia_total
FROM practica5.Participante par
JOIN practica5.Participar pa 
    ON pa.idPersona = par.idPersona
JOIN practica5.PuntosLocacion pl
    ON pl.idTorneo = pa.idTorneo
GROUP BY par.idPersona, par.nombre;


--vi. Listar los Pokémones shinys, que fueron capturados durante el evento, únicamente si fueron capturados entre
--las 14:00hrs y las 18:00hrs.
SELECT
    po.idPokemon,
    po.nombre,
    po.especie,
    po.horaCaptura,
    po.shiny
FROM practica5.Pokemon po
WHERE po.shiny = TRUE
  AND po.horaCaptura BETWEEN '14:00' AND '18:00';


--vii. Mostrar a todos los vendedores junto con los alimentos que venden, indicando el precio sin IVA y el precio final
--con IVA del 16 %.
SELECT 
    v.nombre AS vendedor,
    a.nombre AS alimento,
    a.precioVenta AS precio_sin_iva,
    a.precioVenta * 1.16 AS precio_con_iva
FROM practica5.Vendedor v
JOIN practica5.Alimento a
    ON v.idPersona = a.idPersona
       AND v.idOrganizador = a.idOrganizador
       AND v.idEvento = a.idEvento;

--viii. Mostrar las facultades que tienen más de 5 participantes inscritos en cualquier torneo.
SELECT 
    pa.facultad,
    COUNT(*) AS total_participantes
FROM practica5.Participante pa
JOIN practica5.Participar par
    ON par.idPersona = pa.idPersona
GROUP BY pa.facultad
HAVING COUNT(*) > 5;

--ix. Listar a los vendedores cuyo total de alimentos de alimentos vendidos (número de productos distintos que
--ofrecen) sea mayor a 3.
SELECT 
    v.idPersona,
    v.nombre,
    COUNT(a.idAlimento) AS total_alimentos
FROM practica5.Vendedor v
JOIN practica5.Alimento a
    ON v.idPersona = a.idPersona
       AND v.idOrganizador = a.idOrganizador
       AND v.idEvento = a.idEvento
GROUP BY v.idPersona, v.nombre
HAVING COUNT(a.idAlimento) > 3;


--x. Obtener el nombre completo de los participantes y su facultad que hayan participado tanto en el torneo de
--distancia recorrida como en el de captura de shinys, cuya distancia total recorrida sea mayor al promedio de
--distancia de todos los participantes y ademas que su numero de capturas de shinys sean mayor a 5.
SET search_path TO practica5;

SELECT 
    pa.nombre || ' ' || pa.apellidoPaterno || ' ' || pa.apellidoMaterno AS nombre_completo,
    pa.facultad
FROM practica5.participante pa

-- participó en torneo de distancia
JOIN practica5.participar partDist
    ON pa.idPersona = partDist.idPersona
JOIN practica5.torneodistancia td
    ON td.idTorneo = partDist.idTorneo

-- participó en torneo de shinys
JOIN practica5.participar partSh
    ON pa.idPersona = partSh.idPersona
JOIN practica5.torneoshinys ts
    ON ts.idTorneo = partSh.idTorneo

-- distancia total asociada al torneo de distancia
JOIN (
    SELECT 
        pr.idPersona,
        SUM(pl.puntoslocacion) AS distancia_total
    FROM practica5.participar pr
    JOIN practica5.puntoslocacion pl
        ON pl.idTorneo = pr.idTorneo     -- aquí conectamos torneo → puntos
    JOIN practica5.torneodistancia td2
        ON td2.idTorneo = pr.idTorneo    -- solo torneos de distancia
    GROUP BY pr.idPersona
) dist ON dist.idPersona = pa.idPersona

-- participantes con más de 5 Pokémon shiny
JOIN (
    SELECT 
        p.idPersona
    FROM practica5.pokemon p
    WHERE p.shiny = true
    GROUP BY p.idPersona
    HAVING COUNT(p.idPokemon) > 5
) shiny ON shiny.idPersona = pa.idPersona

WHERE 
    dist.distancia_total >
    (
        SELECT AVG(suma_total)
        FROM (
            SELECT 
                pr2.idPersona,
                SUM(pl2.puntoslocacion) AS suma_total
            FROM practica5.participar pr2
            JOIN practica5.puntoslocacion pl2
                ON pl2.idTorneo = pr2.idTorneo
            JOIN practica5.torneodistancia td3
                ON td3.idTorneo = pr2.idTorneo
            GROUP BY pr2.idPersona
        ) sub
    );


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
