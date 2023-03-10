GO
CREATE DATABASE Colegas

GO
USE Colegas
CREATE TABLE People (
	ID SMALLINT NOT NULL CONSTRAINT PKPeople PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(20) NOT NULL,
	FechaNac Date NULL
)

GO
USE Colegas
CREATE TABLE Carros (
	ID SMALLINT NOT NULL CONSTRAINT PKCarros PRIMARY KEY,
	Marca VARCHAR(15) NOT NULL,
	Modelo VARCHAR(20) NOT NULL,
	Anho SMALLINT NULL CONSTRAINT CKAnNO Check (Anho BETWEEN 1900 AND YEAR(Current_Timestamp)),
	Color VARCHAR(15),
	IDPropietario SMALLINT NULL CONSTRAINT FK_Carro_People FOREIGN KEY REFERENCES People (ID) ON UPDATE NO ACTION ON DELETE NO ACTION
)

GO
USE Colegas
CREATE TABLE Libros (
	ID Int NOT NULL CONSTRAINT PKLibros PRIMARY KEY,
	Titulo VARCHAR(60) NOT NULL,
	Autors VARCHAR(50) NULL
)

GO
USE Colegas
CREATE TABLE Lecturas (
	IDLibro Int NOT NULL,
	IDLector SMALLINT NOT NULL,
	AnhoLectura SMALLINT NULL
	
	CONSTRAINT PKLecturas PRIMARY KEY (IDLibro, IDLector),
	CONSTRAINT FKLecturasLibros FOREIGN KEY (IDLibro) REFERENCES Libros (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT FKLecturasLectores FOREIGN KEY (IDLector) REFERENCES People (ID) ON UPDATE NO ACTION ON DELETE NO ACTION,
)
