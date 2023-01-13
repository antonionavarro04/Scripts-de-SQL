-- € Hecho por Antonio Navarro
CREATE DATABASE EjercicioCheck
GO

USE EjercicioCheck
CREATE TABLE CriaturasExtrañas (
    ID SMALLINT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    FechaNac DATETIME NOT NULL,
    NumeroPie SMALLINT NOT NULL,
    NivelIngles NCHAR(2) NOT NULL,
    Historieta VARCHAR(max) NULL,

    CONSTRAINT CK_NoJohnConnor CHECK (FechaNac < CURRENT_TIMESTAMP),
    CONSTRAINT CK_NivelIngles CHECK (NivelIngles IN ('A1', 'A2', 'B1', 'B2', 'C1', 'C2')),
    CONSTRAINT CK_Imaginacion CHECK (Historieta <> (CAST(ID AS VARCHAR(4)) + 'Pecadores' + CAST(NumeroPie AS VARCHAR(2))))
)
GO