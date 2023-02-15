CREATE DATABASE Libreria
GO

USE Libreria
CREATE TABLE Libro (
    isbn INT NOT NULL PRIMARY KEY,
    título NVARCHAR(100) NOT NULL,
    editorial NVARCHAR(100) NOT NULL FOREIGN KEY (editorial) REFERENCES Editorial(nombre),
    autor NVARCHAR(50) NOT NULL FOREIGN KEY (autor) REFERENCES Autor(nombre),
)
GO

USE Libreria
CREATE TABLE Editorial (
    nombre NVARCHAR(100) NOT NULL,
    teléfono INT NOT NULL PRIMARY KEY,
)
GO

USE Libreria
CREATE TABLE Autor (
    nombre NVARCHAR(50) NOT NULL,
    añoNacimiento NVARCHAR (4) NULL,
)
GO

USE Libreria
CREATE TABLE Stock (
    isbn INT NOT NULL FOREIGN KEY (isbn) REFERENCES Libro(isbn) ON DELETE NO ACTION,
    cantidad INT NOT NULL,
)
GO
