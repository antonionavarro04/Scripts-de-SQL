CREATE DATABASE LIGA_2233
GO

USE LIGA_2233
CREATE TABLE Terreno (
    ID TINYINT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Dirección VARCHAR(50) NULL,
    Localidad VARCHAR(25) NOT NULL,

    CONSTRAINT PK_Terreno PRIMARY KEY (ID),
)
GO

USE LIGA_2233
CREATE TABLE Equipos (
    Codigo CHAR(3) NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Fecha_Fundación DATE NULL,
    Localidad VARCHAR(25) NOT NULL,
    ID_Campo TINYINT NOT NULL,

    CONSTRAINT PK_Equipos PRIMARY KEY (Codigo),
    CONSTRAINT FK_Equipos_Terreno FOREIGN KEY (ID_Campo) REFERENCES Terreno(ID) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT CK_Fecha CHECK (Fecha_Fundación < CURRENT_TIMESTAMP),
)
GO

USE LIGA_2233
CREATE TABLE Jugadores (
    Num_ficha CHAR(10) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellidos VARCHAR(30) NOT NULL,
    FechaNac DATE NULL,
    Dorsal TINYINT NULL,
    Posición CHAR(2) NULL,
    Nacionalidad CHAR(3) NOT NULL,
    Cod_Equipo CHAR(3) NULL,

    CONSTRAINT PK_Jugadores PRIMARY KEY (Num_ficha),
    CONSTRAINT FK_Jugadores_Equipos FOREIGN KEY (Cod_Equipo) REFERENCES Equipos(Codigo) ON DELETE SET DEFAULT,
    CONSTRAINT CK_Dorsal CHECK (Dorsal > 0 AND Dorsal < 26),
    CONSTRAINT CK_Posición CHECK (Posición IN ('PT', 'DF', 'DL', 'CN', 'LB')),
    CONSTRAINT CK_Ficha CHECK (Num_ficha LIKE ('ESP[0-9]___')),
)
GO

USE LIGA_2233
CREATE TABLE Clasificación (
    Posicion TINYINT NOT NULL IDENTITY (1, 1),
    Cod_equipo CHAR(3) NOT NULL,
    Part_jugados AS (Part_ganados + Part_empatados + Part_perdidos),
    Part_ganados TINYINT NOT NULL DEFAULT (0),
    Part_perdidos TINYINT NOT NULL DEFAULT (0),
    Part_empatados TINYINT NOT NULL DEFAULT (0),
    Goles_a_favor SMALLINT NOT NULL DEFAULT (0),
    Goles_en_contra SMALLINT NOT NULL DEFAULT (0),

    CONSTRAINT PK_Clasificacion PRIMARY KEY (Posicion),
    CONSTRAINT FK_Clasificación_Equipos FOREIGN KEY (Cod_equipo) REFERENCES Equipos(Codigo) ON UPDATE CASCADE ON DELETE CASCADE,
)
GO

USE LIGA_2233
ALTER TABLE Clasificación
ADD Puntuación AS ((Part_ganados * 3) + (Part_empatados));
GO

-- ! Hecho por Antonio Navarro