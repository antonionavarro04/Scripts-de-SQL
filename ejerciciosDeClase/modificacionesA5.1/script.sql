USE Empresa
ALTER TABLE Empleados
ADD CONSTRAINT CK_ComprobarEdad CHECK (edad BETWEEN 0 AND 120)

ALTER TABLE Empleados
ADD CONSTRAINT CK_PuestosDisponibles CHECK (puesto IN ('Jefe', 'currito'))

ALTER TABLE Empleados
ADD CONSTRAINT CK_NombreDisponible CHECK (nombre LIKE ('A_L%O_'))

ALTER TABLE Oficinas
ADD CONSTRAINT CK_NombreCiudad CHECK (ciudad LIKE ('%A'))

-- 1 La cantidad de los pedidos no puede ser menor a 0
ALTER TABLE Pedidos
ADD CONSTRAINT CK_CantidadPedidos CHECK (cantidad > 0)

-- 2 El nombre de las oficinas no puede ser igual a su ciudad
ALTER TABLE Oficinas
ADD CONSTRAINT CK_NombreCiudadOficina CHECK (ciudad != oficina)

-- 3 El limite de credito de los clientes no puede ser menor a 0
ALTER TABLE Clientes
ADD CONSTRAINT CK_LimiteCredito CHECK (limitecredito > 0)

-- 4 El nombre de los empleados no puede comenzar con A ni terminar con O
ALTER TABLE Empleados
ADD CONSTRAINT CK_NombreEmpleados CHECK (nombre NOT LIKE ('A%O'))

-- 5 El jefe no puede ser el mismo empleado
ALTER TABLE Empleados
ADD CONSTRAINT CK_Jefe CHECK (jefe != nombre)

-- ! Integridad Referencial
ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Oficinas FOREIGN KEY (oficina) REFERENCES Oficinas (oficina) ON DELETE SET NULL

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Empleados FOREIGN KEY (jefe) REFERENCES Empleados (nombre) ON UPDATE CASCADE

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Clientes FOREIGN KEY (nombre) REFERENCES Clientes (resp) ON DELETE CASCADE

ALTER TABLE Clientes
ADD CONSTRAINT FK_Clientes_Empleados FOREIGN KEY (resp) REFERENCES Empleados (nombre) ON UPDATE NO ACTION