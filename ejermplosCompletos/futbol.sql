-- ! By: Antonio Navarro
CREATE DATABASE Futbol

GO

USE Futbol

CREATE TABLE Jugadores (
    DNI VARCHAR(9) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    PrimerApellido VARCHAR(50) NOT NULL,
    SegundoApellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Nacionalidad VARCHAR(50) NOT NULL,
    Altura REAL NOT NULL,
    Peso REAL NOT NULL,
    Posicion VARCHAR(50) NOT NULL,
    Equipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (DNI)
)

GO

CREATE TABLE Equipos (
    Nombre VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Estadio VARCHAR(50) NOT NULL,
    FechaCreacion DATE NOT NULL,
    PRIMARY KEY (Nombre)
)

GO

ALTER TABLE Jugadores ADD CONSTRAINT FK_Jugadores_Equipos FOREIGN KEY (Equipo) REFERENCES Equipos (Nombre)

GO

INSERT INTO Equipos VALUES ('Real Madrid', 'Madrid', 'Santiago Bernabeu', '1902-03-06')

INSERT INTO Equipos VALUES ('Barcelona', 'Barcelona', 'Camp Nou', '1899-11-29')

INSERT INTO Equipos VALUES ('Atletico de Madrid', 'Madrid', 'Wanda Metropolitano', '1903-04-26')

INSERT INTO Equipos VALUES ('Sevilla', 'Sevilla', 'Ramón Sánchez Pizjuán', '1905-01-25')

GO

INSERT INTO Jugadores VALUES ('95121212J', 'Mario', 'Casas', 'Gomez', '1995-12-12', 'Española', 1.80, 75, 'Delantero', 'Real Madrid')

GO