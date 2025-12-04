--DROP SCHEMA practica5 CASCADE; 
CREATE SCHEMA practica5;
SET search_path TO practica5;

-- Tabla Evento
CREATE TABLE practica5.Evento (
    idEvento INT UNIQUE,
    numEdicion INT,
    fecha DATE
);

COMMENT ON TABLE practica5.Evento IS 'Tabla que almacena los eventos registrados en el sistema.';
COMMENT ON COLUMN practica5.Evento.idEvento IS 'Identificador unico del evento.';
COMMENT ON COLUMN practica5.Evento.numEdicion IS 'Numero de edicion del evento.';
COMMENT ON COLUMN practica5.Evento.fecha IS 'Fecha en la que se realiza el evento.';


-- Tabla Premio
CREATE TABLE practica5.Premio (
    idPremio INT,
    dinero MONEY,
    mercancia VARCHAR(100),
    trofeo VARCHAR(60)
);

COMMENT ON TABLE practica5.Premio IS 'Almacena los detalles de los diferentes premios que pueden ser otorgados en los torneos.';
COMMENT ON COLUMN practica5.Premio.idPremio IS 'Identificador unico del premio. Es la llave primaria de la tabla.';
COMMENT ON COLUMN practica5.Premio.dinero IS 'Cantidad de dinero en efectivo que se otorga como premio.';
COMMENT ON COLUMN practica5.Premio.mercancia IS 'Descripcion de cualquier mercancia o articulo que se otorgue como premio.';
COMMENT ON COLUMN practica5.Premio.trofeo IS 'Descripcion del trofeo o medalla que se otorga como premio.';


CREATE TABLE practica5.Participante (
    numeroCuenta CHAR(9) UNIQUE,
    idPersona INT,
    idEvento INT,
    correo VARCHAR(50),
    facultad VARCHAR(50),
    carrera VARCHAR(50),
    fechaNacimiento DATE,
    apellidoMaterno VARCHAR(100),
    apellidoPaterno VARCHAR(100),
    nombre VARCHAR(50),
    sexo VARCHAR(30),
    conteo INT
);

COMMENT ON TABLE practica5.Participante IS 'Almacena los datos detallados de una persona cuando asume el rol de participante en un evento, incluyendo informacion academica y personal.';
COMMENT ON COLUMN practica5.Participante.numeroCuenta IS 'Numero de cuenta o identificador unico institucional del participante. Posee restriccion UNIQUE.';
COMMENT ON COLUMN practica5.Participante.idPersona IS 'Identificador unico de la persona en el sistema. Es la llave primaria de esta tabla y llave foranea a la tabla Persona.';
COMMENT ON COLUMN practica5.Participante.idEvento IS 'Identificador del evento al que esta asociado este registro de participante. Llave foranea a la tabla Evento.';
COMMENT ON COLUMN practica5.Participante.correo IS 'Direccion de correo electronico del participante.';
COMMENT ON COLUMN practica5.Participante.facultad IS 'Nombre de la facultad a la que pertenece el participante.';
COMMENT ON COLUMN practica5.Participante.carrera IS 'Nombre de la carrera que cursa el participante.';
COMMENT ON COLUMN practica5.Participante.fechaNacimiento IS 'Fecha de nacimiento del participante. No puede ser nula.';
COMMENT ON COLUMN practica5.Participante.apellidoMaterno IS 'Apellido materno del participante.';
COMMENT ON COLUMN practica5.Participante.apellidoPaterno IS 'Apellido paterno del participante.';
COMMENT ON COLUMN practica5.Participante.nombre IS 'Nombre(s) del participante.';
COMMENT ON COLUMN practica5.Participante.sexo IS 'Sexo o genero declarado del participante.';
COMMENT ON COLUMN practica5.Participante.conteo IS 'Campo numerico para fines de registro o conteo, debe ser mayor o igual a cero.';

CREATE TABLE practica5.Visitante (
    idPersona INT,
    idEvento INT,
    horaEntrada TIME,
    horaSalida TIME,
    fechaNacimiento DATE,
    apellidoMaterno VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    nombre VARCHAR(50),
    sexo VARCHAR(50),
    conteo INT
);

COMMENT ON TABLE practica5.Visitante IS 'Almacena la informacion de las personas que asisten a un evento en calidad de visitantes, registrando sus horarios y datos personales.';
COMMENT ON COLUMN practica5.Visitante.idPersona IS 'Identificador unico de la persona en el sistema. Es la llave primaria de la tabla.';
COMMENT ON COLUMN practica5.Visitante.idEvento IS 'Identificador del evento al que asistio el visitante. Llave foranea a la tabla Evento.';
COMMENT ON COLUMN practica5.Visitante.horaEntrada IS 'Hora en la que el visitante entro al evento. No puede ser nula.';
COMMENT ON COLUMN practica5.Visitante.horaSalida IS 'Hora en la que el visitante salio del evento. No puede ser nula.';
COMMENT ON COLUMN practica5.Visitante.fechaNacimiento IS 'Fecha de nacimiento del visitante. No puede ser nula.';
COMMENT ON COLUMN practica5.Visitante.apellidoMaterno IS 'Apellido materno del visitante.';
COMMENT ON COLUMN practica5.Visitante.apellidoPaterno IS 'Apellido paterno del visitante.';
COMMENT ON COLUMN practica5.Visitante.nombre IS 'Nombre(s) del visitante.';
COMMENT ON COLUMN practica5.Visitante.sexo IS 'Sexo o genero declarado del visitante.';
COMMENT ON COLUMN practica5.Visitante.conteo IS 'Campo numerico para fines de registro o conteo, debe ser mayor o igual a cero.';

CREATE TABLE practica5.LimpiadorCuidador (
    idPersona INT,
    idOrganizador INT,
    idEvento INT,
    ciudad VARCHAR(80),
    fechaNacimiento DATE,
    apellidoMaterno VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    nombre VARCHAR(50),
    sexo VARCHAR(20),
    calle VARCHAR(100),
    colonia VARCHAR(100),
    cp VARCHAR(5),
    numExterior VARCHAR(10),
    numInterior VARCHAR(10),
    locacion VARCHAR(20),
    horario VARCHAR(100),
    puesto VARCHAR(50),
    conteo INT
);

COMMENT ON TABLE practica5.LimpiadorCuidador IS 'Tabla que registra a los encargados de limpieza y cuidado durante el evento.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.idPersona IS 'Identificador único del limpiador/cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.idOrganizador IS 'Identificador del organizador responsable del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.idEvento IS 'Identificador del evento en el que participa el cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.ciudad IS 'Ciudad de residencia del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.fechaNacimiento IS 'Fecha de nacimiento del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.apellidoMaterno IS 'Apellido materno del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.apellidoPaterno IS 'Apellido paterno del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.nombre IS 'Nombre del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.sexo IS 'Sexo del cuidador. Puede ser Masculino, Femenino u Otro.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.calle IS 'Nombre de la calle donde vive el cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.colonia IS 'Colonia de residencia del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.cp IS 'Código postal de la dirección del cuidador. Debe tener 5 caracteres.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.numExterior IS 'Número exterior del domicilio del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.numInterior IS 'Número interior del domicilio del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.locacion IS 'Área específica donde el cuidador realiza sus funciones.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.horario IS 'Horario asignado al cuidador durante el evento.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.puesto IS 'Puesto o rol específico del cuidador.';
COMMENT ON COLUMN practica5.LimpiadorCuidador.conteo IS 'Campo auxiliar para conteo o control relacionado con el cuidador.';

CREATE TABLE practica5.Vendedor (
    idPersona INT,
    idOrganizador INT,
    idEvento INT,
    ciudad VARCHAR(50),
    fechaNacimiento DATE,
    apellidoMaterno VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    nombre VARCHAR(50),
    sexo VARCHAR(20),
    calle VARCHAR(100),
    colonia VARCHAR(100),
    cp VARCHAR(5),
    numExterior VARCHAR(10),
    numInterior VARCHAR(10),
    conteo INT
);

COMMENT ON TABLE practica5.Vendedor IS 'Tabla que registra a los vendedores que participan en los eventos.';
COMMENT ON COLUMN practica5.Vendedor.idPersona IS 'Identificador único del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.idOrganizador IS 'Identificador del organizador responsable del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.idEvento IS 'Identificador del evento en el que participa el vendedor.';
COMMENT ON COLUMN practica5.Vendedor.ciudad IS 'Ciudad de residencia del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.fechaNacimiento IS 'Fecha de nacimiento del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.apellidoMaterno IS 'Apellido materno del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.apellidoPaterno IS 'Apellido paterno del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.nombre IS 'Nombre del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.sexo IS 'Sexo del vendedor. Puede ser Masculino, Femenino u Otro.';
COMMENT ON COLUMN practica5.Vendedor.calle IS 'Nombre de la calle donde vive el vendedor.';
COMMENT ON COLUMN practica5.Vendedor.colonia IS 'Colonia de residencia del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.cp IS 'Código postal del domicilio del vendedor. Debe tener 5 caracteres.';
COMMENT ON COLUMN practica5.Vendedor.numExterior IS 'Número exterior del domicilio del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.numInterior IS 'Número interior del domicilio del vendedor.';
COMMENT ON COLUMN practica5.Vendedor.conteo IS 'Campo auxiliar para conteo o control relacionado con el vendedor.';

-- Tabla Alimento
CREATE TABLE practica5.Alimento (
    idAlimento INT,
    idPersona INT,
    idOrganizador INT,
    idEvento INT,
    perecedero BOOLEAN,
    nombre VARCHAR(50),
    tipo VARCHAR(50),
    fecha DATE,
    precioVenta MONEY
);

COMMENT ON TABLE practica5.Alimento IS 'Tabla que almacena los alimentos disponibles para venta en el evento.';
COMMENT ON COLUMN practica5.Alimento.idAlimento IS 'Identificador único del alimento dentro del vendedor.';
COMMENT ON COLUMN practica5.Alimento.idPersona IS 'Identificador del vendedor responsable del alimento.';
COMMENT ON COLUMN practica5.Alimento.idOrganizador IS 'Identificador del organizador responsable del vendedor.';
COMMENT ON COLUMN practica5.Alimento.idEvento IS 'Identificador del evento en el que se ofrece el alimento.';
COMMENT ON COLUMN practica5.Alimento.perecedero IS 'Indica si el alimento es perecedero.';
COMMENT ON COLUMN practica5.Alimento.nombre IS 'Nombre del alimento.';
COMMENT ON COLUMN practica5.Alimento.tipo IS 'Tipo o categoría del alimento.';
COMMENT ON COLUMN practica5.Alimento.fecha IS 'Fecha en la que el alimento fue registrado.';
COMMENT ON COLUMN practica5.Alimento.precioVenta IS 'Precio de venta del alimento.';


CREATE TABLE practica5.Registrador (
    idPersona INT,
    idOrganizador INT,
    idEvento INT,
    ciudad VARCHAR(50),
    fechaNacimiento DATE,
    apellidoMaterno VARCHAR(30),
    apellidoPaterno VARCHAR(30),
    nombre VARCHAR(50),
    sexo VARCHAR(20),
    calle VARCHAR(50),
    colonia VARCHAR(100),
    cp VARCHAR(5),
    numExterior VARCHAR(10),
    numInterior VARCHAR(10),
    conteo INT
);

COMMENT ON TABLE practica5.Registrador IS 'Tabla que registra a los encargados de registrar participantes durante los eventos.';
COMMENT ON COLUMN practica5.Registrador.idPersona IS 'Identificador único del registrador.';
COMMENT ON COLUMN practica5.Registrador.idOrganizador IS 'Identificador del organizador responsable del registrador.';
COMMENT ON COLUMN practica5.Registrador.idEvento IS 'Identificador del evento en el que participa el registrador.';
COMMENT ON COLUMN practica5.Registrador.ciudad IS 'Ciudad de residencia del registrador.';
COMMENT ON COLUMN practica5.Registrador.fechaNacimiento IS 'Fecha de nacimiento del registrador.';
COMMENT ON COLUMN practica5.Registrador.apellidoMaterno IS 'Apellido materno del registrador.';
COMMENT ON COLUMN practica5.Registrador.apellidoPaterno IS 'Apellido paterno del registrador.';
COMMENT ON COLUMN practica5.Registrador.nombre IS 'Nombre del registrador.';
COMMENT ON COLUMN practica5.Registrador.sexo IS 'Sexo del registrador. Puede ser Masculino, Femenino u Otro.';
COMMENT ON COLUMN practica5.Registrador.calle IS 'Nombre de la calle donde vive el registrador.';
COMMENT ON COLUMN practica5.Registrador.colonia IS 'Colonia de residencia del registrador.';
COMMENT ON COLUMN practica5.Registrador.cp IS 'Código postal de la dirección del registrador. Debe tener 5 caracteres.';
COMMENT ON COLUMN practica5.Registrador.numExterior IS 'Número exterior del domicilio del registrador.';
COMMENT ON COLUMN practica5.Registrador.numInterior IS 'Número interior del domicilio del registrador.';
COMMENT ON COLUMN practica5.Registrador.conteo IS 'Campo auxiliar para conteo o control relacionado con el registrador.';

-- Tabla Correo
CREATE TABLE practica5.Correo (
    idPersona INT,
    idOrganizador INT NULL,
    correo VARCHAR(100)
);

COMMENT ON TABLE practica5.Correo IS 'Tabla que almacena los correos electronicos asociados a cada persona.';
COMMENT ON COLUMN practica5.Correo.idPersona IS 'Identificador de la persona dueña del correo.';
COMMENT ON COLUMN practica5.Correo.idOrganizador IS 'Identificador del organizador si aplica (para vendedores).';
COMMENT ON COLUMN practica5.Correo.correo IS 'Correo electronico de la persona.';


-- Tabla Telefono
CREATE TABLE practica5.Telefono (
    idPersona INT,
    idOrganizador INT,
    telefono CHAR(10)
);

COMMENT ON TABLE practica5.Telefono IS 'Tabla que almacena los números telefónicos asociados a cada persona.';
COMMENT ON COLUMN practica5.Telefono.idPersona IS 'Identificador de la persona dueña del número.';
COMMENT ON COLUMN practica5.Telefono.idOrganizador IS 'Identificador del organizador si aplica (para vendedores/registradores/limpiadores).';
COMMENT ON COLUMN practica5.Telefono.telefono IS 'Número telefónico de 10 dígitos.';


-- Tabla CuentaPokemon
CREATE TABLE practica5.CuentaPokemon (
    codigoEntrenador INT,
    idPersona INT,
    equipo VARCHAR(100),
    nombreUsuario VARCHAR(100),
    nivelEntrenador VARCHAR(50)
);

COMMENT ON TABLE practica5.CuentaPokemon IS 'Almacena los detalles de una cuenta de juego asociada a una persona, presumiblemente en un contexto de Pokemon.';
COMMENT ON COLUMN practica5.CuentaPokemon.codigoEntrenador IS 'Codigo unico o identificador de la cuenta del entrenador. Parte de la llave primaria.';
COMMENT ON COLUMN practica5.CuentaPokemon.idPersona IS 'Identificador de la persona propietaria de la cuenta. Parte de la llave primaria y llave foranea a la tabla Persona.';
COMMENT ON COLUMN practica5.CuentaPokemon.equipo IS 'Nombre del equipo o faccion a la que pertenece el entrenador.';
COMMENT ON COLUMN practica5.CuentaPokemon.nombreUsuario IS 'Nombre de usuario o alias utilizado por el entrenador en el juego.';
COMMENT ON COLUMN practica5.CuentaPokemon.nivelEntrenador IS 'Nivel o rango actual alcanzado por el entrenador en el juego.';

-- Tabla Pokemon
CREATE TABLE practica5.Pokemon (
    idPokemon INT,
    idPersona INT,
    cp INT,
    nombre VARCHAR(100),
    horaCaptura TIME,
    sexo VARCHAR(20),
    especie VARCHAR(50),
    peso NUMERIC,
    shiny BOOLEAN
);

COMMENT ON TABLE practica5.Pokemon IS 'Almacena los detalles de los Pokemons individuales poseidos por una persona.';
COMMENT ON COLUMN practica5.Pokemon.idPokemon IS 'Identificador unico para cada Pokemon. Es la llave primaria de la tabla.';
COMMENT ON COLUMN practica5.Pokemon.idPersona IS 'Identificador de la persona que posee este Pokemon. Llave foranea a la tabla Persona.';
COMMENT ON COLUMN practica5.Pokemon.cp IS 'Puntos de combate (Combat Power) del Pokemon.';
COMMENT ON COLUMN practica5.Pokemon.nombre IS 'El nombre personalizado (alias) dado al Pokemon.';
COMMENT ON COLUMN practica5.Pokemon.horaCaptura IS 'Hora exacta en que el Pokemon fue capturado. No puede ser nula.';
COMMENT ON COLUMN practica5.Pokemon.sexo IS 'El sexo o genero del Pokemon.';
COMMENT ON COLUMN practica5.Pokemon.especie IS 'La especie de Pokemon a la que pertenece (e.g., Pikachu, Charizard).';
COMMENT ON COLUMN practica5.Pokemon.peso IS 'El peso del Pokemon. Debe ser igual o mayor a cero.';
COMMENT ON COLUMN practica5.Pokemon.shiny IS 'Booleano que indica si el Pokemon es un ejemplar shiny (variocolor).';

-- Tabla Tipo
CREATE TABLE practica5.Tipo (
    idPokemon INT,
    tipo VARCHAR(40)
);

COMMENT ON TABLE practica5.Tipo IS 'Tabla de relacion que asocia un Pokemon especifico con sus tipos elementales.';
COMMENT ON COLUMN practica5.Tipo.idPokemon IS 'Identificador del Pokemon al que se aplica el tipo. Parte de la llave primaria y llave foranea a la tabla Pokemon.';
COMMENT ON COLUMN practica5.Tipo.tipo IS 'Nombre del tipo elemental (e.g., Fuego, Agua, Planta). Parte de la llave primaria.';

-- Tabla Participar
CREATE TABLE practica5.Participar (
    idTorneo INT,
    idPersona INT
);

COMMENT ON TABLE practica5.Participar IS 'Tabla de relacion que registra la participacion de una persona en un torneo.';
COMMENT ON COLUMN practica5.Participar.idTorneo IS 'Identificador del torneo en el que participa la persona. Parte de la llave primaria.';
COMMENT ON COLUMN practica5.Participar.idPersona IS 'Identificador de la persona que participa en el torneo. Parte de la llave primaria.';

-- Tabla Enfrentamiento
CREATE TABLE practica5.Enfrentamiento (
    idEnfrentamiento INT,
    idTorneo INT,
    idPersona INT,
    ganador VARCHAR(40),
    resultado VARCHAR(30)
);

COMMENT ON TABLE practica5.Enfrentamiento IS 'Tabla que contiene los enfrentamientos entre Pokemons.';
COMMENT ON COLUMN practica5.Enfrentamiento.idEnfrentamiento IS 'Identificador del enfrentamiento.';
COMMENT ON COLUMN practica5.Enfrentamiento.idTorneo IS 'Identificador del torneo.';
COMMENT ON COLUMN practica5.Enfrentamiento.idPersona IS 'Id del participante en el torneo.';
COMMENT ON COLUMN practica5.Enfrentamiento.ganador IS 'Ganador del enfrentamiento.';
COMMENT ON COLUMN practica5.Enfrentamiento.resultado IS 'Marcador final del enfrentamiento.';

-- Tabla Ganar
CREATE TABLE practica5.Ganar (
    idPremio INT,
    idPersona INT,
    idTorneo INT,
    idEnfrentamiento INT
);

COMMENT ON TABLE practica5.Ganar IS 'Tabla de hechos que registra que premio se gano en un enfrentamiento de un torneo y por quien.';
COMMENT ON COLUMN practica5.Ganar.idPremio IS 'Identificador del premio obtenido. Parte de la llave primaria.';
COMMENT ON COLUMN practica5.Ganar.idPersona IS 'Identificador de la persona que gano el premio. Parte de la llave primaria.';
COMMENT ON COLUMN practica5.Ganar.idTorneo IS 'Identificador del torneo donde se obtuvo la ganancia. Parte de la llave primaria.';
COMMENT ON COLUMN practica5.Ganar.idEnfrentamiento IS 'Identificador del enfrentamiento especifico donde ocurrio la ganancia. Parte de la llave primaria.';

-- Tabla Comprar
CREATE TABLE practica5.Comprar (
    idAlimento INT,
    idPersona INT,
    metodoPago VARCHAR(50)
);

COMMENT ON TABLE practica5.Comprar IS 'Tabla que registra las compras realizadas por los visitantes.';
COMMENT ON COLUMN practica5.Comprar.idAlimento IS 'Identificador del alimento comprado.';
COMMENT ON COLUMN practica5.Comprar.idPersona IS 'Identificador del visitante que realiza la compra.';
COMMENT ON COLUMN practica5.Comprar.metodoPago IS 'Metodo de pago utilizado por el visitante para realizar la compra.';

-- Tabla TorneoPeleas
CREATE TABLE practica5.TorneoPeleas (
    idTorneo INT,
    fechaInicio DATE,
    fechaFinal DATE,
    reglas TEXT
);

COMMENT ON TABLE practica5.TorneoPeleas IS 'Almacena la informacion principal de un torneo de peleas, incluyendo su duracion y las reglas.';
COMMENT ON COLUMN practica5.TorneoPeleas.idTorneo IS 'Identificador unico del torneo. Es la llave primaria y llave foranea que enlaza a la tabla Torneo.';
COMMENT ON COLUMN practica5.TorneoPeleas.fechaInicio IS 'Fecha oficial de inicio del torneo. No puede ser nula.';
COMMENT ON COLUMN practica5.TorneoPeleas.fechaFinal IS 'Fecha oficial de finalizacion del torneo. No puede ser nula.';
COMMENT ON COLUMN practica5.TorneoPeleas.reglas IS 'Texto descriptivo con las reglas especificas y condiciones del torneo.';

-- Tabla TorneoShinys
CREATE TABLE practica5.TorneoShinys (
    idTorneo INT,
    fechaInicio DATE,
    fechaFinal DATE,
    reglas TEXT
);

COMMENT ON TABLE practica5.TorneoShinys IS 'Almacena la informacion de los torneos especificos para Pokemons shinys (variocolor), incluyendo duracion y reglas.';
COMMENT ON COLUMN practica5.TorneoShinys.idTorneo IS 'Identificador unico del torneo de shinys. Es la llave primaria de la tabla.';
COMMENT ON COLUMN practica5.TorneoShinys.fechaInicio IS 'Fecha oficial de inicio del torneo. No puede ser nula.';
COMMENT ON COLUMN practica5.TorneoShinys.fechaFinal IS 'Fecha oficial de finalizacion del torneo. No puede ser nula.';
COMMENT ON COLUMN practica5.TorneoShinys.reglas IS 'Texto descriptivo con las reglas especificas y condiciones del torneo.';

-- Tabla TorneoDistancia
CREATE TABLE practica5.TorneoDistancia (
    idTorneo INT,
    fechaInicio DATE,
    fechaFinal DATE,
    reglas TEXT,
    locacionPartida VARCHAR(100)
);

COMMENT ON TABLE practica5.TorneoDistancia IS 'Almacena la informacion de torneos basados en distancia o ubicacion, incluyendo las fechas, reglas y el punto de partida.';
COMMENT ON COLUMN practica5.TorneoDistancia.idTorneo IS 'Identificador unico del torneo de distancia. Es la llave primaria de la tabla.';
COMMENT ON COLUMN practica5.TorneoDistancia.fechaInicio IS 'Fecha oficial de inicio del torneo. No puede ser nula.';
COMMENT ON COLUMN practica5.TorneoDistancia.fechaFinal IS 'Fecha oficial de finalizacion del torneo. No puede ser nula.';
COMMENT ON COLUMN practica5.TorneoDistancia.reglas IS 'Texto descriptivo con las reglas especificas y condiciones del torneo.';
COMMENT ON COLUMN practica5.TorneoDistancia.locacionPartida IS 'Nombre o descripcion del lugar desde donde se inicia el torneo o evento de distancia.';

-- Tabla PuntosLocacion
CREATE TABLE practica5.PuntosLocacion (
    idTorneo INT,
    puntosLocacion INT
);

COMMENT ON TABLE practica5.PuntosLocacion IS 'Asocia un torneo con los puntos especificos obtenidos en cada locacion o checkpoint, presumiblemente para un torneo de distancia.';
COMMENT ON COLUMN practica5.PuntosLocacion.idTorneo IS 'Identificador del torneo al que corresponden los puntos de locacion. Parte de la llave primaria.';
COMMENT ON COLUMN practica5.PuntosLocacion.puntosLocacion IS 'Cantidad de puntos asignados a una ubicacion especifica dentro del torneo. Parte de la llave primaria.';

--RESTRICCIONES A PARTIR DE AQUI

-- Evento
-- Restricciones de dominio
ALTER TABLE practica5.Evento ADD CONSTRAINT Evento_d1
CHECK(idEvento > 0);
ALTER TABLE practica5.Evento ADD CONSTRAINT Evento_d2
CHECK(numEdicion > 0);
ALTER TABLE practica5.Evento ADD CONSTRAINT Evento_d3
CHECK(fecha IS NOT NULL);

ALTER TABLE practica5.Evento ADD CONSTRAINT Evento_pkey
PRIMARY KEY (idEvento, numEdicion);

COMMENT ON CONSTRAINT Evento_d1 ON practica5.Evento IS 'Restringe que el identificador del evento sea mayor que cero.';
COMMENT ON CONSTRAINT Evento_d2 ON practica5.Evento IS 'Restringe que el numero de edicion del evento sea mayor que cero.';
COMMENT ON CONSTRAINT Evento_d3 ON practica5.Evento IS 'Restringe que la fecha del evento no sea nula.';
COMMENT ON CONSTRAINT Evento_pkey ON practica5.Evento IS 'Llave primaria compuesta del evento.';

-- Premio
-- Restricciones de dominio
ALTER TABLE practica5.Premio ADD CONSTRAINT Premio_d1
CHECK(idPremio > 0);
ALTER TABLE practica5.Premio
ADD CONSTRAINT Premio_d2
CHECK (dinero::numeric >= 0);
ALTER TABLE practica5.Premio ADD CONSTRAINT Premio_d3
CHECK(CHAR_LENGTH(mercancia) > 0);
ALTER TABLE practica5.Premio ADD CONSTRAINT Premio_d4
CHECK(CHAR_LENGTH(trofeo) > 0);

ALTER TABLE practica5.Premio ADD CONSTRAINT Premio_pkey
PRIMARY KEY (idPremio);

COMMENT ON CONSTRAINT Premio_d1 ON practica5.Premio IS 'Restringe que el identificador del premio sea mayor que cero.';
COMMENT ON CONSTRAINT Premio_d2 ON practica5.Premio IS 'Restringe que la cantidad de dinero no sea negativa.';
COMMENT ON CONSTRAINT Premio_d3 ON practica5.Premio IS 'Restringe que la descripcion de mercancia no sea vacia.';
COMMENT ON CONSTRAINT Premio_d4 ON practica5.Premio IS 'Restringe que la descripcion del trofeo no sea vacia.';
COMMENT ON CONSTRAINT Premio_pkey ON practica5.Premio IS 'Llave primaria de la tabla Premio.';

-- Participante 

-- Restricciones de dominio
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d1
CHECK(CHAR_LENGTH(numeroCuenta) = 9);
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d2
CHECK (idPersona > 0);
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d3
CHECK (idEvento > 0);
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d4
CHECK (correo LIKE '%@%.%');
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d5
CHECK (facultad <> '');
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d6
CHECK (carrera <> '');
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d7
CHECK (fechaNacimiento IS NOT NULL);
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d8
CHECK (apellidoPaterno <> '');
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d9
CHECK (apellidoMaterno <> '');
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d10
CHECK (nombre <> '');
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d11
CHECK (sexo IN ('Masculino', 'Femenino', 'Otro'));
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_d12
CHECK (conteo >= 0);
-- Restricción de entidad (Primary Key)
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_pkey
PRIMARY KEY (idPersona);

-- Restricciones referenciales (Foreign Keys)
ALTER TABLE practica5.Participante ADD CONSTRAINT participante_fkey_evento
FOREIGN KEY (idEvento)
REFERENCES practica5.Evento (idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;


COMMENT ON CONSTRAINT participante_d1 ON practica5.Participante IS 'Asegura que el número de cuenta del participante sea mayor que cero.';
COMMENT ON CONSTRAINT participante_d2 ON practica5.Participante IS 'Asegura que el identificador de persona sea mayor que cero.';
COMMENT ON CONSTRAINT participante_d3 ON practica5.Participante IS 'Asegura que el identificador del evento sea mayor que cero.';
COMMENT ON CONSTRAINT participante_d4 ON practica5.Participante IS 'Verifica que el correo tenga un formato válido que contenga @ y un dominio.';
COMMENT ON CONSTRAINT participante_d5 ON practica5.Participante IS 'Evita que la facultad esté vacía.';
COMMENT ON CONSTRAINT participante_d6 ON practica5.Participante IS 'Evita que la carrera esté vacía.';
COMMENT ON CONSTRAINT participante_d7 ON practica5.Participante IS 'Asegura que la fecha de nacimiento no sea nula.';
COMMENT ON CONSTRAINT participante_d8 ON practica5.Participante IS 'Evita que el apellido paterno sea una cadena vacía.';
COMMENT ON CONSTRAINT participante_d9 ON practica5.Participante IS 'Evita que el apellido materno sea una cadena vacía.';
COMMENT ON CONSTRAINT participante_d10 ON practica5.Participante IS 'Evita que el nombre sea una cadena vacía.';
COMMENT ON CONSTRAINT participante_d11 ON practica5.Participante IS 'Restringe el campo sexo a los valores: Masculino, Femenino u Otro.';
COMMENT ON CONSTRAINT participante_d12 ON practica5.Participante IS 'Asegura que el conteo sea un número mayor o igual a cero.';
COMMENT ON CONSTRAINT participante_pkey ON practica5.Participante IS 'Llave primaria de la tabla Participante (idPersona).';
COMMENT ON CONSTRAINT participante_fkey_evento ON practica5.Participante IS 'Llave foránea hacia la tabla Evento.';

-- Visitante
-- Restricciones de dominio
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d1
CHECK(idPersona > 0);
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d2
CHECK(idEvento > 0);
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d3
CHECK(horaEntrada IS NOT NULL);
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d4
CHECK(horaSalida IS NOT NULL);
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d5
CHECK(fechaNacimiento IS NOT NULL);
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d6
CHECK(apellidoMaterno <> '');
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d7
CHECK(apellidoPaterno <> '');
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d8
CHECK(nombre <> '');
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d9
CHECK (sexo IN ('Masculino', 'Femenino', 'Otro'));
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_d10
CHECK(conteo >= 0);
-- Entidad
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_pkey
PRIMARY KEY (idPersona);
-- Referencial
ALTER TABLE practica5.Visitante ADD CONSTRAINT visitante_fk1
FOREIGN KEY (idEvento) REFERENCES practica5.Evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT visitante_d1 ON practica5.Visitante IS 'Asegura que el IdPersona sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT visitante_d2 ON practica5.Visitante IS 'Asegura que el IdEvento sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT visitante_d3 ON practica5.Visitante IS 'Asegura que la HoraEntrada no sea nula.';
COMMENT ON CONSTRAINT visitante_d4 ON practica5.Visitante IS 'Asegura que la HoraSalida no sea nula.';
COMMENT ON CONSTRAINT visitante_d5 ON practica5.Visitante IS 'Asegura que la Fecha_nacimiento no sea nula.';
COMMENT ON CONSTRAINT visitante_d6 ON practica5.Visitante IS 'Asegura que el Apellido_materno no sea una cadena vacía.';
COMMENT ON CONSTRAINT visitante_d7 ON practica5.Visitante IS 'Asegura que el Apellido_paterno no sea una cadena vacía.';
COMMENT ON CONSTRAINT visitante_d8 ON practica5.Visitante IS 'Asegura que el Nombre no sea una cadena vacía.';
COMMENT ON CONSTRAINT visitante_d9 ON practica5.Visitante IS 'Asegura que el Sexo no sea una cadena vacía.';
COMMENT ON CONSTRAINT visitante_d10 ON practica5.Visitante IS 'Asegura que el Conteo sea un valor igual o mayor a cero.';
COMMENT ON CONSTRAINT visitante_pkey ON practica5.Visitante IS 'Llave primaria de la tabla, identificada por el IdPersona.';
COMMENT ON CONSTRAINT visitante_fk1 ON practica5.Visitante IS 'Llave foránea que relaciona al visitante con el evento al que asistió en la tabla "Evento".';

-- Limpiador/Cuidador
-- Restricciones de dominio
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d1 CHECK (idPersona > 0);
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d2 CHECK (idOrganizador > 0);
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d3 CHECK (idEvento > 0);
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d4 CHECK (ciudad <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d5 CHECK (fechaNacimiento IS NOT NULL);
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d6 CHECK (apellidoMaterno <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d7 CHECK (apellidoPaterno <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d8 CHECK (nombre <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d9 CHECK (sexo IN ('Masculino', 'Femenino', 'Otro'));
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d10 CHECK (calle <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d11 CHECK (colonia <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d12 CHECK (CHAR_LENGTH(cp) = 5);
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d13 CHECK (locacion <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d14 CHECK (horario <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d15 CHECK (puesto <> '');
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_d16 CHECK (conteo >= 0);

-- Restricciones de entidad
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_pkey PRIMARY KEY (idPersona, idOrganizador);

-- Restricciones referenciales
ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_fk1
FOREIGN KEY (idOrganizador)
REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.LimpiadorCuidador ADD CONSTRAINT limpiador_fk2
FOREIGN KEY (idEvento)
REFERENCES practica5.Evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios de las restricciones
COMMENT ON CONSTRAINT limpiador_d1 ON practica5.LimpiadorCuidador IS 'Verifica que el identificador de persona sea mayor a cero.';
COMMENT ON CONSTRAINT limpiador_d2 ON practica5.LimpiadorCuidador IS 'Verifica que el identificador del organizador sea mayor a cero.';
COMMENT ON CONSTRAINT limpiador_d3 ON practica5.LimpiadorCuidador IS 'Verifica que el identificador del evento sea mayor a cero.';
COMMENT ON CONSTRAINT limpiador_d4 ON practica5.LimpiadorCuidador IS 'Evita que el campo ciudad esté vacío.';
COMMENT ON CONSTRAINT limpiador_d5 ON practica5.LimpiadorCuidador IS 'Obliga a registrar la fecha de nacimiento del cuidador.';
COMMENT ON CONSTRAINT limpiador_d6 ON practica5.LimpiadorCuidador IS 'Evita que el campo apellido materno esté vacío.';
COMMENT ON CONSTRAINT limpiador_d7 ON practica5.LimpiadorCuidador IS 'Evita que el campo apellido paterno esté vacío.';
COMMENT ON CONSTRAINT limpiador_d8 ON practica5.LimpiadorCuidador IS 'Evita que el campo nombre esté vacío.';
COMMENT ON CONSTRAINT limpiador_d9 ON practica5.LimpiadorCuidador IS 'Restringe el campo sexo a valores válidos: Masculino, Femenino u Otro.';
COMMENT ON CONSTRAINT limpiador_d10 ON practica5.LimpiadorCuidador IS 'Evita que el campo calle esté vacío.';
COMMENT ON CONSTRAINT limpiador_d11 ON practica5.LimpiadorCuidador IS 'Evita que el campo colonia esté vacía.';
COMMENT ON CONSTRAINT limpiador_d12 ON practica5.LimpiadorCuidador IS 'Verifica que el código postal tenga exactamente 5 caracteres.';
COMMENT ON CONSTRAINT limpiador_d13 ON practica5.LimpiadorCuidador IS 'Evita que el campo locación esté vacío.';
COMMENT ON CONSTRAINT limpiador_d14 ON practica5.LimpiadorCuidador IS 'Evita que el campo horario esté vacío.';
COMMENT ON CONSTRAINT limpiador_d15 ON practica5.LimpiadorCuidador IS 'Evita que el campo puesto esté vacío.';
COMMENT ON CONSTRAINT limpiador_d16 ON practica5.LimpiadorCuidador IS 'Evita conteos negativos en el registro del cuidador.';
COMMENT ON CONSTRAINT limpiador_pkey ON practica5.LimpiadorCuidador IS 'Llave primaria compuesta que identifica de forma única a cada cuidador.';
COMMENT ON CONSTRAINT limpiador_fk1 ON practica5.LimpiadorCuidador IS 'Llave foránea hacia Participante. Se elimina y actualiza en cascada.';
COMMENT ON CONSTRAINT limpiador_fk2 ON practica5.LimpiadorCuidador IS 'Llave foránea hacia Evento. Se elimina y actualiza en cascada.';

-- Vendedor
-- Restricciones de dominio
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d1 CHECK (idPersona > 0);
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d2 CHECK (idOrganizador > 0);
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d3 CHECK (idEvento > 0);
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d4 CHECK (ciudad <> '');
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d5 CHECK (fechaNacimiento IS NOT NULL);
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d6 CHECK (apellidoMaterno <> '');
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d7 CHECK (apellidoPaterno <> '');
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d8 CHECK (nombre <> '');
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d9 CHECK (sexo IN ('Masculino', 'Femenino', 'Otro'));
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d10 CHECK (calle <> '');
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d11 CHECK (colonia <> '');
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d12 CHECK (CHAR_LENGTH(cp) = 5);
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_d13 CHECK (conteo >= 0);

-- Restricciones de entidad
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_pkey PRIMARY KEY (idPersona, idOrganizador);

-- Restricciones referenciales
ALTER TABLE practica5.Vendedor ADD CONSTRAINT vendedor_fk2
FOREIGN KEY (idEvento)
REFERENCES practica5.Evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios de las restricciones
COMMENT ON CONSTRAINT vendedor_d1 ON practica5.Vendedor IS 'Asegura que el identificador de persona sea mayor a cero.';
COMMENT ON CONSTRAINT vendedor_d2 ON practica5.Vendedor IS 'Asegura que el identificador del organizador sea mayor a cero.';
COMMENT ON CONSTRAINT vendedor_d3 ON practica5.Vendedor IS 'Asegura que el identificador del evento sea mayor a cero.';
COMMENT ON CONSTRAINT vendedor_d4 ON practica5.Vendedor IS 'Evita que el campo ciudad esté vacío.';
COMMENT ON CONSTRAINT vendedor_d5 ON practica5.Vendedor IS 'Obliga a registrar la fecha de nacimiento del vendedor.';
COMMENT ON CONSTRAINT vendedor_d6 ON practica5.Vendedor IS 'Evita que el campo apellido materno esté vacío.';
COMMENT ON CONSTRAINT vendedor_d7 ON practica5.Vendedor IS 'Evita que el campo apellido paterno esté vacío.';
COMMENT ON CONSTRAINT vendedor_d8 ON practica5.Vendedor IS 'Evita que el campo nombre esté vacío.';
COMMENT ON CONSTRAINT vendedor_d9 ON practica5.Vendedor IS 'Restringe el campo sexo a valores válidos: Masculino, Femenino u Otro.';
COMMENT ON CONSTRAINT vendedor_d10 ON practica5.Vendedor IS 'Evita que el campo calle esté vacío.';
COMMENT ON CONSTRAINT vendedor_d11 ON practica5.Vendedor IS 'Evita que el campo colonia esté vacío.';
COMMENT ON CONSTRAINT vendedor_d12 ON practica5.Vendedor IS 'Verifica que el código postal tenga exactamente 5 caracteres.';
COMMENT ON CONSTRAINT vendedor_d13 ON practica5.Vendedor IS 'Evita que el conteo del vendedor sea negativo.';
COMMENT ON CONSTRAINT vendedor_pkey ON practica5.Vendedor IS 'Llave primaria compuesta que identifica de forma única a cada vendedor.';
COMMENT ON CONSTRAINT vendedor_fk2 ON practica5.Vendedor IS 'Llave foránea hacia Evento. Se elimina y actualiza en cascada.';

-- Alimento
-- Restricciones de dominio
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d1 CHECK (idAlimento > 0);
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d2 CHECK (idPersona > 0);
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d3 CHECK (idOrganizador > 0);
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d4 CHECK (idEvento > 0);
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d5 CHECK (nombre <> '');
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d6 CHECK (tipo <> '');
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d7 CHECK (precioVenta ::numeric >= 0);
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_d8 CHECK (fecha IS NOT NULL);

-- Restricción de entidad
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_pkey PRIMARY KEY (idAlimento);

-- Restricciones referenciales
ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_fk1
FOREIGN KEY (idPersona, idOrganizador)
REFERENCES practica5.Vendedor(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Alimento ADD CONSTRAINT alimento_fk2
FOREIGN KEY (idEvento)
REFERENCES practica5.Evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios de restricciones
COMMENT ON CONSTRAINT alimento_d1 ON practica5.Alimento IS 'Verifica que el identificador del alimento sea mayor que cero.';
COMMENT ON CONSTRAINT alimento_d2 ON practica5.Alimento IS 'Verifica que el identificador del vendedor sea mayor que cero.';
COMMENT ON CONSTRAINT alimento_d3 ON practica5.Alimento IS 'Verifica que el identificador del organizador sea mayor que cero.';
COMMENT ON CONSTRAINT alimento_d4 ON practica5.Alimento IS 'Verifica que el identificador del evento sea mayor que cero.';
COMMENT ON CONSTRAINT alimento_d5 ON practica5.Alimento IS 'Evita que el nombre del alimento sea una cadena vacía.';
COMMENT ON CONSTRAINT alimento_d6 ON practica5.Alimento IS 'Evita que el tipo del alimento sea una cadena vacía.';
COMMENT ON CONSTRAINT alimento_d7 ON practica5.Alimento IS 'Restringe que el precio de venta sea igual o mayor a cero.';
COMMENT ON CONSTRAINT alimento_d8 ON practica5.Alimento IS 'Obliga a registrar una fecha válida para el alimento.';
COMMENT ON CONSTRAINT alimento_pkey ON practica5.Alimento IS 'Llave primaria de la tabla Alimento.';
COMMENT ON CONSTRAINT alimento_fk1 ON practica5.Alimento IS 'Llave foránea que conecta el alimento con el vendedor correspondiente.';
COMMENT ON CONSTRAINT alimento_fk2 ON practica5.Alimento IS 'Llave foránea que asocia el alimento con el evento en el que se ofrece.';


-- Registrador
-- Restricciones de dominio
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d1 CHECK (idPersona > 0);
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d2 CHECK (idOrganizador > 0);
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d3 CHECK (idEvento > 0);
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d4 CHECK (ciudad <> '');
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d5 CHECK (fechaNacimiento IS NOT NULL);
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d6 CHECK (apellidoMaterno <> '');
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d7 CHECK (apellidoPaterno <> '');
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d8 CHECK (nombre <> '');
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d9 CHECK (sexo IN ('Masculino', 'Femenino', 'Otro'));
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d10 CHECK (calle <> '');
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d11 CHECK (colonia <> '');
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d12 CHECK (CHAR_LENGTH(cp) = 5);
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_d13 CHECK (conteo >= 0);

-- Restricciones de entidad
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_pkey PRIMARY KEY (idPersona, idOrganizador);

-- Restricciones referenciales
ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_fk1
FOREIGN KEY (idOrganizador)
REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Registrador ADD CONSTRAINT registrador_fk2
FOREIGN KEY (idEvento)
REFERENCES practica5.Evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios de las restricciones
COMMENT ON CONSTRAINT registrador_d1 ON practica5.Registrador IS 'Verifica que el identificador de persona sea mayor a cero.';
COMMENT ON CONSTRAINT registrador_d2 ON practica5.Registrador IS 'Asegura que el identificador del organizador sea mayor a cero.';
COMMENT ON CONSTRAINT registrador_d3 ON practica5.Registrador IS 'Verifica que el identificador del evento sea mayor a cero.';
COMMENT ON CONSTRAINT registrador_d4 ON practica5.Registrador IS 'Evita que el campo ciudad esté vacío.';
COMMENT ON CONSTRAINT registrador_d5 ON practica5.Registrador IS 'Obliga a registrar la fecha de nacimiento del registrador.';
COMMENT ON CONSTRAINT registrador_d6 ON practica5.Registrador IS 'Evita que el campo apellido materno esté vacío.';
COMMENT ON CONSTRAINT registrador_d7 ON practica5.Registrador IS 'Evita que el campo apellido paterno esté vacío.';
COMMENT ON CONSTRAINT registrador_d8 ON practica5.Registrador IS 'Evita que el campo nombre esté vacío.';
COMMENT ON CONSTRAINT registrador_d9 ON practica5.Registrador IS 'Restringe el campo sexo a valores válidos: Masculino, Femenino u Otro.';
COMMENT ON CONSTRAINT registrador_d10 ON practica5.Registrador IS 'Evita que el campo calle esté vacío.';
COMMENT ON CONSTRAINT registrador_d11 ON practica5.Registrador IS 'Evita que el campo colonia esté vacía.';
COMMENT ON CONSTRAINT registrador_d12 ON practica5.Registrador IS 'Verifica que el código postal tenga exactamente 5 caracteres.';
COMMENT ON CONSTRAINT registrador_d13 ON practica5.Registrador IS 'Evita conteos negativos en el registro del registrador.';
COMMENT ON CONSTRAINT registrador_pkey ON practica5.Registrador IS 'Llave primaria compuesta que identifica de forma única a cada registrador.';
COMMENT ON CONSTRAINT registrador_fk1 ON practica5.Registrador IS 'Llave foránea hacia Participante. Se elimina y actualiza en cascada.';
COMMENT ON CONSTRAINT registrador_fk2 ON practica5.Registrador IS 'Llave foránea hacia Evento. Se elimina y actualiza en cascada.';

-- RESTRICCIONES DE CORREO

-- Dominio
ALTER TABLE practica5.Correo ADD CONSTRAINT correo_d1
CHECK (idPersona > 0);
ALTER TABLE practica5.Correo ADD CONSTRAINT correo_d2
CHECK (correo LIKE '%@%.%');

-- Llave primaria
ALTER TABLE practica5.Correo ADD CONSTRAINT correo_pkey
PRIMARY KEY (idPersona, correo);

-- Llaves foráneas
ALTER TABLE practica5.Correo ADD CONSTRAINT correo_fk_participante
FOREIGN KEY (idPersona) REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Correo ADD CONSTRAINT correo_fk_vendedor
FOREIGN KEY (idPersona, idOrganizador) REFERENCES practica5.Vendedor(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Correo ADD CONSTRAINT correo_fk_limpiadorCuidador
FOREIGN KEY (idPersona, idOrganizador) REFERENCES practica5.LimpiadorCuidador(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Correo ADD CONSTRAINT correo_fk_registrador
FOREIGN KEY (idPersona, idOrganizador) REFERENCES practica5.Registrador(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
COMMENT ON CONSTRAINT correo_d1 ON practica5.Correo IS 'Verifica que el idPersona sea mayor que cero.';
COMMENT ON CONSTRAINT correo_d2 ON practica5.Correo IS 'Valida el formato básico del correo electrónico.';
COMMENT ON CONSTRAINT correo_pkey ON practica5.Correo IS 'Llave primaria compuesta (idPersona, correo).';
COMMENT ON CONSTRAINT correo_fk_participante ON practica5.Correo IS 'Correo asociado a un participante.';
COMMENT ON CONSTRAINT correo_fk_vendedor ON practica5.Correo IS 'Correo asociado a un vendedor.';
COMMENT ON CONSTRAINT correo_fk_limpiadorCuidador ON practica5.Correo IS 'Correo asociado a un limpiador.';
COMMENT ON CONSTRAINT correo_fk_registrador ON practica5.Correo IS 'Correo asociado a un registrador.';


-- RESTRICCIONES DE TELEFONO

-- Dominio
ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_d1
CHECK (idPersona > 0);

ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_d2
CHECK (CHAR_LENGTH(telefono) = 10);

-- Llave primaria
ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_pkey
PRIMARY KEY (idPersona, telefono);

-- Llaves foráneas (se deben crear después de que las tablas referenciadas y sus PK/UNIQUE existan)
ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_fk_participante
FOREIGN KEY (idPersona) REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_fk_visitante
FOREIGN KEY (idPersona) REFERENCES practica5.Visitante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_fk_limpiadorCuidador
FOREIGN KEY (idPersona, idOrganizador) REFERENCES practica5.LimpiadorCuidador(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_fk_vendedor
FOREIGN KEY (idPersona, idOrganizador) REFERENCES practica5.Vendedor(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Telefono ADD CONSTRAINT telefono_fk_registrador
FOREIGN KEY (idPersona, idOrganizador) REFERENCES practica5.Registrador(idPersona, idOrganizador)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios sobre constraints
COMMENT ON CONSTRAINT telefono_d1 ON practica5.Telefono IS 'Verifica que el idPersona sea mayor que cero.';
COMMENT ON CONSTRAINT telefono_d2 ON practica5.Telefono IS 'Valida que el teléfono tenga 10 caracteres.';
COMMENT ON CONSTRAINT telefono_pkey ON practica5.Telefono IS 'Llave primaria compuesta (idPersona, telefono).';
COMMENT ON CONSTRAINT telefono_fk_participante ON practica5.Telefono IS 'Teléfono asociado a un participante.';
COMMENT ON CONSTRAINT telefono_fk_visitante ON practica5.Telefono IS 'Teléfono asociado a un visitante.';
COMMENT ON CONSTRAINT telefono_fk_limpiadorCuidador ON practica5.Telefono IS 'Teléfono asociado a un limpiador/cuidador.';
COMMENT ON CONSTRAINT telefono_fk_vendedor ON practica5.Telefono IS 'Teléfono asociado a un vendedor.';
COMMENT ON CONSTRAINT telefono_fk_registrador ON practica5.Telefono IS 'Teléfono asociado a un registrador.';


--Cuenta Pokemon
-- Restricciones de dominio
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_d1
CHECK(codigoEntrenador > 0);
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_d2
CHECK(idPersona > 0);
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_d3
CHECK(equipo <> '');
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_d4
CHECK(nombreUsuario <> '');
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_d5
CHECK(nivelEntrenador <> '');
-- Entidad
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_pkey
PRIMARY KEY (codigoEntrenador, idPersona);

--Referencial
ALTER TABLE practica5.CuentaPokemon ADD CONSTRAINT cuentapokemon_fkey
FOREIGN KEY(idPersona) REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT cuentapokemon_d1 ON practica5.CuentaPokemon IS 'Asegura que el CodigoEntrenador sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT cuentapokemon_d2 ON practica5.CuentaPokemon IS 'Asegura que el IdPersona sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT cuentapokemon_d3 ON practica5.CuentaPokemon IS 'Asegura que el campo Equipo no sea una cadena vacía.';
COMMENT ON CONSTRAINT cuentapokemon_d4 ON practica5.CuentaPokemon IS 'Asegura que el campo Nombre_usuario no sea una cadena vacía.';
COMMENT ON CONSTRAINT cuentapokemon_d5 ON practica5.CuentaPokemon IS 'Asegura que el campo Nivel_entrenador no sea una cadena vacía.';
COMMENT ON CONSTRAINT cuentapokemon_pkey ON practica5.CuentaPokemon IS 'Llave primaria compuesta (CodigoEntrenador, IdPersona) que identifica de forma única la cuenta de un entrenador asociada a una persona.';
COMMENT ON CONSTRAINT cuentapokemon_fkey ON practica5.CuentaPokemon IS 'Llave foránea que enlaza la cuenta con la información general de la persona propietaria en la tabla "persona".';

-- Pokemon
-- Restricciones de dominio
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d1
CHECK(idPokemon > 0);
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d2
CHECK(idPersona > 0);
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d3
CHECK (CP BETWEEN 1 AND 99999);
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d4
CHECK(nombre <> '');
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d5
CHECK(horaCaptura IS NOT NULL);
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d6
CHECK(sexo <> '');
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d7
CHECK(especie <> '');
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_d8
CHECK(peso >= 0);
-- Entidad
ALTER TABLE practica5.Pokemon ADD CONSTRAINT pokemon_pkey
PRIMARY KEY (idPokemon);
--Referencial
ALTER TABLE pokemon ADD CONSTRAINT pokemon_fkey
FOREIGN KEY(idPersona) REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT pokemon_d1 ON practica5.Pokemon IS 'Asegura que el IdPokemon sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT pokemon_d2 ON practica5.Pokemon IS 'Asegura que el IdPersona sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT pokemon_d3 ON practica5.Pokemon IS 'Asegura que el CP (Puntos de Combate) tenga una longitud exacta de 5 caracteres.';
COMMENT ON CONSTRAINT pokemon_d4 ON practica5.Pokemon IS 'Asegura que el campo Nombre no sea una cadena vacía.';
COMMENT ON CONSTRAINT pokemon_d5 ON practica5.Pokemon IS 'Asegura que la HoraCaptura no sea nula.';
COMMENT ON CONSTRAINT pokemon_d6 ON practica5.Pokemon IS 'Asegura que el campo Sexo no sea una cadena vacía.';
COMMENT ON CONSTRAINT pokemon_d7 ON practica5.Pokemon IS 'Asegura que el campo Especie no sea una cadena vacía.';
COMMENT ON CONSTRAINT pokemon_d8 ON practica5.Pokemon IS 'Asegura que el Peso sea un valor igual o mayor a cero.';
COMMENT ON CONSTRAINT pokemon_pkey ON practica5.Pokemon IS 'Llave primaria de la tabla, identificada por el IdPokemon.';
COMMENT ON CONSTRAINT pokemon_fkey ON practica5.Pokemon IS 'Llave foránea que enlaza el Pokémon con su entrenador/propietario en la tabla "persona".';

-- Tipo
-- Restricciones de dominio
ALTER TABLE practica5.Tipo ADD CONSTRAINT tipo_d1
CHECK(idPokemon > 0);
ALTER TABLE practica5.Tipo ADD CONSTRAINT tipo_d2
CHECK(tipo <> '');
-- Entidad
ALTER TABLE practica5.Tipo ADD CONSTRAINT tipo_pkey
PRIMARY KEY (idPokemon, tipo);
-- Referencial
ALTER TABLE Pokemon ADD CONSTRAINT pokemon_fk1
FOREIGN KEY (idPersona) REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT tipo_d1 ON practica5.Tipo IS 'Asegura que el IdPokemon sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT tipo_d2 ON practica5.Tipo IS 'Asegura que el campo Tipo no sea una cadena vacía.';
COMMENT ON CONSTRAINT tipo_pkey ON practica5.Tipo IS 'Llave primaria compuesta (IdPokemon, Tipo) que identifica de forma única la asignación de un tipo a un Pokémon.';

-- Participar
-- Restricciones de dominio
ALTER TABLE practica5.Participar ADD CONSTRAINT participar_d1
CHECK(idTorneo > 0);
ALTER TABLE practica5.Participar ADD CONSTRAINT participar_d2
CHECK(idPersona > 0);
-- Entidad
ALTER TABLE practica5.Participar ADD CONSTRAINT participar_pkey
PRIMARY KEY (idTorneo, idPersona);

COMMENT ON CONSTRAINT participar_d1 ON practica5.Participar IS 'Asegura que el IdTorneo sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT participar_d2 ON practica5.Participar IS 'Asegura que el IdPersona sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT participar_pkey ON practica5.Participar IS 'Llave primaria compuesta (IdTorneo, IdPersona) que asegura que una persona solo pueda ser registrada una vez por torneo.';

-- Enfrentamiento
-- Restricciones de dominio
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_d1
CHECK(idEnfrentamiento > 0);
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_d2
CHECK(idTorneo > 0);
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_d3
CHECK(idPersona > 0);
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_d4
CHECK(ganador <> '');
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_d5
CHECK(resultado <> '');
-- Entidad
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_pkey
PRIMARY KEY (idEnfrentamiento, idTorneo);
--Referencial
ALTER TABLE practica5.Enfrentamiento ADD CONSTRAINT Enfrentamiento_fkey
FOREIGN KEY(idPersona) REFERENCES practica5.Participante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT Enfrentamiento_d1 ON practica5.Enfrentamiento IS 'Restriccion check que nos asegura que el identificador del enfrentamiento no sea la cadena vacia';
COMMENT ON CONSTRAINT Enfrentamiento_d2 ON practica5.Enfrentamiento IS 'Restriccion check que nos asegura que el identificador del torneo no sea la cadena vacia';
COMMENT ON CONSTRAINT Enfrentamiento_d3 ON practica5.Enfrentamiento IS 'Restriccion check que nos asegura que el id del participante';
COMMENT ON CONSTRAINT Enfrentamiento_d4 ON practica5.Enfrentamiento IS 'Restriccion check que nos asegura que el ganador no sea la cadena vacia';
COMMENT ON CONSTRAINT Enfrentamiento_d5 ON practica5.Enfrentamiento IS 'Restriccion check que nos asegura que el resultado no sea la cadena vacia';
COMMENT ON CONSTRAINT Enfrentamiento_pkey ON practica5.Enfrentamiento IS 'La llave primaria de la tabla Enfrentamiento';
COMMENT ON CONSTRAINT Enfrentamiento_fkey ON practica5.Enfrentamiento IS 'La llave foranea que conecta con Participante';

-- Ganar
-- Restricciones de dominio
ALTER TABLE practica5.Ganar ADD CONSTRAINT ganar_d1
CHECK(idPremio > 0);
ALTER TABLE practica5.Ganar ADD CONSTRAINT ganar_d2
CHECK(idPersona > 0);
ALTER TABLE practica5.Ganar ADD CONSTRAINT ganar_d3
CHECK(idTorneo > 0);
ALTER TABLE practica5.Ganar ADD CONSTRAINT ganar_d4
CHECK(idEnfrentamiento > 0);
-- Entidad
ALTER TABLE practica5.Ganar ADD CONSTRAINT ganar_pkey
PRIMARY KEY (idPremio, idPersona, idTorneo, idEnfrentamiento);
--Referencial
--ALTER TABLE practica5.Ganar ADD CONSTRAINT ganar_fkey
--FOREIGN KEY(curp) REFERENCES operador(curp);

COMMENT ON CONSTRAINT ganar_d1 ON practica5.Ganar IS 'Asegura que el IdPremio sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT ganar_d2 ON practica5.Ganar IS 'Asegura que el IdPersona sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT ganar_d3 ON practica5.Ganar IS 'Asegura que el IdTorneo sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT ganar_d4 ON practica5.Ganar IS 'Asegura que el IdEnfrentamiento sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT ganar_pkey ON practica5.Ganar IS 'Llave primaria compuesta (IdPremio, IdPersona, IdTorneo, IdEnfrentamiento) que garantiza la unicidad de cada instancia de premio ganado.';

-- Comprar
-- Restricciones de dominio
ALTER TABLE practica5.Comprar ADD CONSTRAINT comprar_d1 
CHECK (idAlimento > 0);
ALTER TABLE practica5.Comprar ADD CONSTRAINT comprar_d2 
CHECK (idPersona > 0);
ALTER TABLE practica5.Comprar ADD CONSTRAINT comprar_d3 
CHECK (metodoPago IN ('Efectivo', 'Tarjeta', 'Transferencia', 'Otro'));
-- Restricción de entidad
ALTER TABLE practica5.Comprar ADD CONSTRAINT comprar_pkey PRIMARY KEY (idPersona, idAlimento);
-- Referencial 
ALTER TABLE practica5.Comprar ADD CONSTRAINT comprar_fk1
FOREIGN KEY (idAlimento) REFERENCES practica5.Alimento(idAlimento)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE practica5.Comprar ADD CONSTRAINT comprar_fk2
FOREIGN KEY (idPersona) REFERENCES practica5.Visitante(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT comprar_d1 ON practica5.Comprar IS 'Verifica que el identificador del alimento sea mayor a cero.';
COMMENT ON CONSTRAINT comprar_d2 ON practica5.Comprar IS 'Verifica que el identificador del visitante sea mayor a cero.';
COMMENT ON CONSTRAINT comprar_d3 ON practica5.Comprar IS 'Restringe el método de pago a opciones válidas: Efectivo, Tarjeta, Transferencia u Otro.';
COMMENT ON CONSTRAINT comprar_pkey ON practica5.Comprar IS 'Llave primaria compuesta por IdPersona e IdAlimento que identifica cada compra de forma única.';
COMMENT ON CONSTRAINT comprar_fk1 ON practica5.Comprar IS 'Llave foránea hacia Alimento. Se elimina y actualiza en cascada.';
COMMENT ON CONSTRAINT comprar_fk2 ON practica5.Comprar IS 'Llave foránea hacia Visitante. Se elimina y actualiza en cascada.';

-- Torneo Pelea
-- Restricciones de dominio
ALTER TABLE practica5.TorneoPeleas ADD CONSTRAINT torneopeleas_d1
CHECK(idTorneo > 0);
ALTER TABLE practica5.TorneoPeleas ADD CONSTRAINT torneopeleas_d2
CHECK(fechaInicio IS NOT NULL);
ALTER TABLE practica5.TorneoPeleas ADD CONSTRAINT torneopeleas_d3
CHECK(fechaFinal IS NOT NULL);
ALTER TABLE practica5.TorneoPeleas ADD CONSTRAINT torneopeleas_d4
CHECK(reglas <> '');
-- Entidad
ALTER TABLE practica5.TorneoPeleas ADD CONSTRAINT torneopeleas_pkey
PRIMARY KEY (idTorneo);
--Referencial


COMMENT ON CONSTRAINT torneopeleas_d1 ON practica5.TorneoPeleas IS 'Asegura que el IdTorneo sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT torneopeleas_d2 ON practica5.TorneoPeleas IS 'Asegura que la FechaInicio no sea nula.';
COMMENT ON CONSTRAINT torneopeleas_d3 ON practica5.TorneoPeleas IS 'Asegura que la FechaFinal no sea nula.';
COMMENT ON CONSTRAINT torneopeleas_d4 ON practica5.TorneoPeleas IS 'Asegura que el campo Reglas no esté vacío.';
COMMENT ON CONSTRAINT torneopeleas_pkey ON practica5.TorneoPeleas IS 'Llave primaria de la tabla, identificada por el IdTorneo.';

-- Shiny
-- Restricciones de dominio
ALTER TABLE practica5.TorneoShinys ADD CONSTRAINT torneoshinys_d1
CHECK(idTorneo > 0);
ALTER TABLE practica5.TorneoShinys ADD CONSTRAINT torneoshinys_d2
CHECK(fechaInicio IS NOT NULL);
ALTER TABLE practica5.TorneoShinys ADD CONSTRAINT torneoshinys_d3
CHECK(fechaFinal IS NOT NULL);
ALTER TABLE practica5.TorneoShinys ADD CONSTRAINT torneoshinys_d4
CHECK(reglas <> '');
-- Entidad
ALTER TABLE practica5.TorneoShinys ADD CONSTRAINT torneoshinys_pkey
PRIMARY KEY (idTorneo);

COMMENT ON CONSTRAINT torneoshinys_d1 ON practica5.TorneoShinys IS 'Asegura que el IdTorneo sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT torneoshinys_d2 ON practica5.TorneoShinys IS 'Asegura que la FechaInicio no sea nula.';
COMMENT ON CONSTRAINT torneoshinys_d3 ON practica5.TorneoShinys IS 'Asegura que la FechaFinal no sea nula.';
COMMENT ON CONSTRAINT torneoshinys_d4 ON practica5.TorneoShinys IS 'Asegura que el campo Reglas no esté vacío.';
COMMENT ON CONSTRAINT torneoshinys_pkey ON practica5.TorneoShinys IS 'Llave primaria que identifica de forma única a cada torneo de Pokémons Shinys.';


-- Distancia
-- Restricciones de dominio
ALTER TABLE practica5.TorneoDistancia ADD CONSTRAINT torneodistancia_d1
CHECK(idTorneo > 0);
ALTER TABLE practica5.TorneoDistancia ADD CONSTRAINT torneodistancia_d2
CHECK(fechaInicio IS NOT NULL);
ALTER TABLE practica5.TorneoDistancia ADD CONSTRAINT torneodistancia_d3
CHECK(fechaFinal IS NOT NULL);
ALTER TABLE practica5.TorneoDistancia ADD CONSTRAINT torneodistancia_d4
CHECK(reglas <> '');
ALTER TABLE practica5.TorneoDistancia ADD CONSTRAINT torneodistancia_d5
CHECK(locacionPartida <> '');
-- Entidad
ALTER TABLE practica5.TorneoDistancia ADD CONSTRAINT torneodistancia_pkey
PRIMARY KEY (idTorneo);

COMMENT ON CONSTRAINT torneodistancia_d1 ON practica5.TorneoDistancia IS 'Asegura que el IdTorneo sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT torneodistancia_d2 ON practica5.TorneoDistancia IS 'Asegura que la FechaInicio no sea nula.';
COMMENT ON CONSTRAINT torneodistancia_d3 ON practica5.TorneoDistancia IS 'Asegura que la FechaFinal no sea nula.';
COMMENT ON CONSTRAINT torneodistancia_d4 ON practica5.TorneoDistancia IS 'Asegura que el campo Reglas no esté vacío.';
COMMENT ON CONSTRAINT torneodistancia_d5 ON practica5.TorneoDistancia IS 'Asegura que el campo LocacionPartida no esté vacío.';
COMMENT ON CONSTRAINT torneodistancia_pkey ON practica5.TorneoDistancia IS 'Llave primaria que identifica de forma única a cada torneo de distancia.';

-- Puntos Locacion
-- Restricciones de dominio
ALTER TABLE practica5.PuntosLocacion ADD CONSTRAINT puntoslocacion_d1
CHECK(idTorneo > 0);
ALTER TABLE practica5.PuntosLocacion ADD CONSTRAINT puntoslocacion_d2
CHECK(puntosLocacion >= 0);
-- Entidad
ALTER TABLE practica5.PuntosLocacion ADD CONSTRAINT puntoslocacion_pkey
PRIMARY KEY (idTorneo, puntosLocacion);

COMMENT ON CONSTRAINT puntoslocacion_d1 ON practica5.PuntosLocacion IS 'Asegura que el IdTorneo sea un valor positivo mayor a cero.';
COMMENT ON CONSTRAINT puntoslocacion_d2 ON practica5.PuntosLocacion IS 'Asegura que los PuntosLocacion sean iguales o mayores a cero.';
COMMENT ON CONSTRAINT puntoslocacion_pkey ON practica5.PuntosLocacion IS 'Llave primaria compuesta (IdTorneo, PuntosLocacion) que identifica de forma única la asignación de puntos dentro de un torneo.';


--RESTRICCIONES PARA SERIALES
ALTER TABLE practica5.Evento 
    ALTER COLUMN idEvento ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Premio 
    ALTER COLUMN idPremio ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Participante 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Visitante 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.LimpiadorCuidador 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Vendedor 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Alimento 
    ALTER COLUMN idAlimento ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Registrador 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Correo 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Telefono 
    ALTER COLUMN idPersona ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.CuentaPokemon 
    ALTER COLUMN codigoEntrenador ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Pokemon 
    ALTER COLUMN idPokemon ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.TorneoPeleas 
    ALTER COLUMN idTorneo ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.TorneoShinys 
    ALTER COLUMN idTorneo ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.TorneoDistancia 
    ALTER COLUMN idTorneo ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER TABLE practica5.Enfrentamiento 
    ALTER COLUMN idEnfrentamiento ADD GENERATED BY DEFAULT AS IDENTITY;

ALTER SEQUENCE practica5.Evento_idEvento_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Premio_idPremio_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Participante_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Visitante_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.LimpiadorCuidador_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Vendedor_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Alimento_idAlimento_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Registrador_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Correo_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Telefono_idPersona_seq RESTART WITH 151;
ALTER SEQUENCE practica5.CuentaPokemon_codigoEntrenador_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Pokemon_idPokemon_seq RESTART WITH 151;
ALTER SEQUENCE practica5.TorneoPeleas_idTorneo_seq RESTART WITH 151;
ALTER SEQUENCE practica5.TorneoShinys_idTorneo_seq RESTART WITH 151;
ALTER SEQUENCE practica5.TorneoDistancia_idTorneo_seq RESTART WITH 151;
ALTER SEQUENCE practica5.Enfrentamiento_idEnfrentamiento_seq RESTART WITH 151;

