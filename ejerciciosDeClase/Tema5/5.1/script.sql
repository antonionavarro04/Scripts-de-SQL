-- ? Ejercicio 1
CREATE DATABASE Instituto
GO

-- ? Ejericio 2
IF DB_ID('Empresa') IS NOT NULL DROP DATABASE Empresa
GO

-- ? Ejercicio 3
DROP DATABASE Instituto
GO

-- ? Ejercicio 4
CREATE DATABASE Empresa
GO

-- ? Ejercicio 5
USE Empresa
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    edad SMALLINT NOT NULL,
    oficina NVARCHAR(20) NOT NULL,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL,
    ventas INT NOT NULL,
)
GO
CREATE TABLE Clientes (
    numcli INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    resp INT NOT NULL,
    limitecredito INT NOT NULL,
)
GO
CREATE TABLE Oficinas (
    oficina NVARCHAR(20) NOT NULL,
    ciudad NVARCHAR(50) NOT NULL,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,
)
GO
CREATE TABLE Productos (
    idfab INT NOT NULL,
    idproducto INT NOT NULL,
    descripcion NVARCHAR(max) NOT NULL,
    precio REAL NOT NULL,
    existencias INT NOT NULL,
)
GO
CREATE TABLE Pedidos (
    numpedido INT NOT NULL,
    fechapedido DATETIME,
    clie INT NOT NULL,
    resp INT NOT NULL,
    fab INT NOT NULL,
    producto INT NOT NULL,
    cant INT NOT NULL,
    importe REAL NOT NULL,
)
GO

-- ? Ejercicio 6
USE Empresa
DROP TABLE Empleados
GO
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    edad SMALLINT NOT NULL,
    oficina NVARCHAR(20) NOT NULL,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL,
    ventas INT NOT NULL,
)
GO

-- ? Ejercicio 7
USE Empresa
DROP TABLE Empleados
GO
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    edad SMALLINT NOT NULL DEFAULT 18,
    oficina INT NOT NULL DEFAULT 21,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL DEFAULT 1000.0,
    ventas INT NOT NULL,
)
GO

-- ? Ejercicio 8
USE Empresa
DROP TABLE Empleados
GO
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    edad SMALLINT NOT NULL DEFAULT 18,
    Oficinas INT NOT NULL DEFAULT 21,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL DEFAULT 1000.0,
    ventas INT NOT NULL,

    PRIMARY KEY (numemp),
)
GO

-- ? Ejercicio 9
USE Empresa
DROP TABLE Oficinas
GO
CREATE TABLE Oficinas (
    Oficinas INT NOT NULL,
    ciudad NVARCHAR(50) NOT NULL,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,

    PRIMARY KEY (Oficinas),
)
GO

-- ? Ejercicio 10
USE Empresa
DROP TABLE Oficinas
GO
CREATE TABLE Oficinas (
    Oficinas INT NOT NULL IDENTITY(1, 1),
    ciudad NVARCHAR(50) NOT NULL,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,

    PRIMARY KEY (Oficinas),
)
GO

-- ? Ejercicio 11
USE Empresa
DROP TABLE Clientes
GO
CREATE TABLE Clientes (
    numcli INT NOT NULL IDENTITY(1, 1),
    nombre NVARCHAR(20) NOT NULL,
    resp INT NOT NULL,
    limitecredito INT NOT NULL,

    PRIMARY KEY (numcli),
)
GO

-- ? Ejercicio 12
USE Empresa
DROP TABLE Empleados
GO
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL UNIQUE,
    edad SMALLINT NOT NULL DEFAULT 18,
    Oficinas INT NOT NULL DEFAULT 21,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL DEFAULT 1000.0,
    ventas INT NOT NULL,

    PRIMARY KEY (numemp),
)
GO

-- ? Ejercicio 13
USE Empresa
DROP TABLE Oficinas
GO
CREATE TABLE Oficinas (
    oficina INT NOT NULL IDENTITY(1, 1),
    ciudad NVARCHAR(50) NOT NULL UNIQUE,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,

    PRIMARY KEY (oficina),
)
GO

-- ? Ejercicio 14
USE Empresa
DROP TABLE Oficinas
GO
CREATE TABLE Oficinas (
    oficina INT NOT NULL IDENTITY(1, 1),
    ciudad NVARCHAR(50) NOT NULL UNIQUE,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,

    PRIMARY KEY (oficina),
    FOREIGN KEY (dir) REFERENCES Empleados(numemp),
)
GO

-- ? Ejercicio 15
USE Empresa
DROP TABLE Clientes
GO
CREATE TABLE Clientes (
    numcli INT NOT NULL IDENTITY(1, 1),
    nombre NVARCHAR(20) NOT NULL,
    resp INT NOT NULL,
    limitecredito INT NOT NULL,

    PRIMARY KEY (numcli),
    FOREIGN KEY (resp) REFERENCES Empleados(numemp),
)
GO

-- ? Ejercicio 16
USE Empresa
ALTER TABLE Empleados DROP CONSTRAINT FK_Empleados_Oficinas
DROP TABLE Empleados
DROP TABLE Oficinas
GO
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    edad SMALLINT NOT NULL DEFAULT 18,
    oficina INT NOT NULL DEFAULT 21,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL DEFAULT 1000.0,
    ventas INT NOT NULL,

    CONSTRAINT PK_Empleados PRIMARY KEY (numemp),
    CONSTRAINT FK_Empleados_Oficinas FOREIGN KEY (oficina) REFERENCES Oficinas(Oficinas),
    CONSTRAINT UQ_Empleados UNIQUE (nombre),
)
GO
CREATE TABLE Oficinas (
    oficina INT NOT NULL IDENTITY(1, 1),
    ciudad NVARCHAR(50) NOT NULL,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,

    CONSTRAINT PK_Oficina PRIMARY KEY (oficina),
    CONSTRAINT FK_Director_Empleados FOREIGN KEY (dir) REFERENCES Empleados(numemp),
    CONSTRAINT UQ_Oficinas UNIQUE (ciudad),
)
GO

-- ? Ejercicio 17
-- ! Aunque no ponga nada he intuido que es con sus claves primarias
USE Empresa
DROP TABLE Productos
GO
CREATE TABLE Productos (
    idfab INT NOT NULL,
    idproducto INT NOT NULL,
    descripcion NVARCHAR(max) NOT NULL,
    precio REAL NOT NULL,
    existencias INT NOT NULL,

    PRIMARY KEY (idfab, idproducto),
)
GO

-- ? Ejercicio 18
USE Empresa
DROP TABLE Pedidos
GO
CREATE TABLE Pedidos (
    numpedido INT NOT NULL,
    fechapedido DATETIME,
    clie INT NOT NULL,
    resp INT NOT NULL,
    fab INT NOT NULL,
    producto INT NOT NULL,
    cant INT NOT NULL,
    importe REAL NOT NULL,

    PRIMARY KEY (numpedido),
    FOREIGN KEY (clie) REFERENCES Clientes(numcli),
    FOREIGN KEY (resp) REFERENCES Empleados(numemp),
    FOREIGN KEY (fab, producto) REFERENCES Productos(idfab, idproducto),
)
GO

-- ? Ejercicio 19
USE Empresa
DROP TABLE Pedidos
DROP TABLE Productos
DROP TABLE Oficinas
DROP TABLE Clientes
DROP TABLE Empleados
GO
CREATE TABLE Productos (
    idfab INT NOT NULL,
    idproducto INT NOT NULL,
    descripcion NVARCHAR(max) NOT NULL,
    precio REAL NOT NULL,
    existencias INT NOT NULL,

    PRIMARY KEY (idfab, idproducto),
)
GO
CREATE TABLE Empleados (
    numemp INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    edad SMALLINT NOT NULL DEFAULT 18,
    oficina INT NOT NULL DEFAULT 21,
    puesto NVARCHAR(20) NOT NULL,
    fecha_contrato DATETIME NOT NULL,
    jefe NVARCHAR(20) NOT NULL,
    cuota REAL NOT NULL DEFAULT 1000.0,
    ventas INT NOT NULL,

    CONSTRAINT PK_Empleados PRIMARY KEY (numemp),
    CONSTRAINT FK_Empleados_Oficinas FOREIGN KEY (oficina) REFERENCES Oficinas(Oficinas),
    CONSTRAINT UQ_Empleados UNIQUE (nombre),
)
GO
CREATE TABLE Clientes (
    numcli INT NOT NULL IDENTITY(1, 1),
    nombre NVARCHAR(20) NOT NULL,
    resp INT NOT NULL,
    limitecredito INT NOT NULL,

    PRIMARY KEY (numcli),
    FOREIGN KEY (resp) REFERENCES Empleados(numemp),
)
GO
CREATE TABLE Oficinas (
    oficina INT NOT NULL IDENTITY(1, 1),
    ciudad NVARCHAR(50) NOT NULL,
    region NVARCHAR(50) NOT NULL,
    dir INT NOT NULL,
    objetivo NVARCHAR(20) NOT NULL,
    ventas INT NOT NULL,

    CONSTRAINT PK_Oficina PRIMARY KEY (oficina),
    CONSTRAINT FK_Director_Empleados FOREIGN KEY (dir) REFERENCES Empleados(numemp),
    CONSTRAINT UQ_Oficinas UNIQUE (ciudad),
)
GO
CREATE TABLE Pedidos (
    numpedido INT NOT NULL,
    fechapedido DATETIME,
    clie INT NOT NULL,
    resp INT NOT NULL,
    fab INT NOT NULL,
    producto INT NOT NULL,
    cant INT NOT NULL,
    importe REAL NOT NULL,

    PRIMARY KEY (numpedido),
    FOREIGN KEY (clie) REFERENCES Clientes(numcli),
    FOREIGN KEY (resp) REFERENCES Empleados(numemp),
    FOREIGN KEY (fab, producto) REFERENCES Productos(idfab, idproducto),
)
GO