GO
CREATE DATABASE Ferreteria

GO
USE Ferreteria
CREATE TABLE Tipo (
	tipo VARCHAR(20) NOT NULL,
	descripcion VARCHAR(100) NULL,
	CONSTRAINT PK_Tipo PRIMARY KEY (tipo),
)

GO
USE Ferreteria
CREATE TABLE Producto (
	tipo VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	precio MONEY,
	CONSTRAINT FK_ProductoTipo FOREIGN KEY (tipo) REFERENCES Tipo (tipo) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT PK_Producto PRIMARY KEY (nombre),
)

GO
USE Ferreteria
CREATE TABLE Venta (
	tipo VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NULL,
	fecha DATETIME NOT NULL,
	cantidad INT NOT NULL,
	CONSTRAINT FK_VentaTipo FOREIGN KEY (tipo) REFERENCES Tipo (tipo) ON UPDATE NO ACTION,
	CONSTRAINT FK_VentaProducto FOREIGN KEY (nombre) REFERENCES Producto (nombre) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT PK_Venta PRIMARY KEY (fecha),
)

GO
USE Ferreteria
CREATE TABLE Tienda(
	id TINYINT NOT NULL,
	nombre VARCHAR(30),
	CONSTRAINT PK_Tienda PRIMARY KEY (id),
)

GO
USE Ferreteria
CREATE TABLE Vende (
	tipo VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	idTienda TINYINT NOT NULL,
	CONSTRAINT FK_VendeTipo FOREIGN KEY (tipo) REFERENCES Tipo (tipo) ON UPDATE CASCADE,
	CONSTRAINT FK_VendeProducto FOREIGN KEY (nombre) REFERENCES Producto (nombre) ON DELETE CASCADE,
	CONSTRAINT FK_VendeTienda FOREIGN KEY (idTienda) REFERENCES Tienda (id) ON UPDATE CASCADE,
)