-- Preparación
IF DB_ID('Ejemplos') IS NULL CREATE DATABASE Ejemplos
GO

-- Primera Tabla
USE Ejemplos
CREATE TABLE DatosRestrictivos (
    ID SMALLINT NOT NULL PRIMARY KEY IDENTITY(1, 2),
    Nombre NVARCHAR(15) NOT NULL UNIQUE CHECK (Nombre <> ('N%') AND Nombre <> ('X%')),
    Nummpelos INT NULL CHECK (Nummpelos BETWEEN 0 AND 150000),
    TipoRopa CHAR NULL CHECK (TipoRopa IN ('C', 'F', 'E', 'P', 'B', 'N')),
    NumSuerte TINYINT NULL CHECK (NumSuerte BETWEEN 10 AND 40 AND NumSuerte % 3 = 0),
    Minutos TINYINT NULL CHECK (Minutos BETWEEN 20 AND 80 OR Minutos BETWEEN 120 AND 185),
)
GO

-- Segunda Tabla
USE Ejemplos
CREATE TABLE DatosRelacionados (
    NombreRelacionado NVARCHAR (15) NOT NULL FOREIGN KEY (NombreRelacionado) REFERENCES DatosRestrictivos (nombre),
    -- Respecto a las preguntas creo que no haría falta ponerle las mismas restricciones, pues al ser una clave foranea el nombre necesita estar en la otra tabla para poder aceptarlo, esto hace que no podamos introducir por el ejemplo el nombre Nayara, ya que no existiría en la otra tabla debido a que por las restricciones no nos dejarían introducirlas
    PalabraTabu NVARCHAR(20) NULL CHECK (PalabraTabu <> ('MENA', 'Gurtel', 'ERE', 'Procés', 'sobresueldo')),
    
)
GO
