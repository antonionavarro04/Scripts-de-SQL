-- 1. Nombre del país y número de clientes de cada país, ordenados alfabéticamente por el nombre del país

USE Northwind

SELECT Country AS 'País', COUNT(CustomerID) AS 'Número de Clientes'
FROM Customers
GROUP BY Country
ORDER BY Country

GO

-- 2. ID de producto y número de unidades vendidas de cada producto.

USE Northwind

SELECT ProductID AS 'ID de Producto', SUM(Quantity) AS 'Número de Unidades Vendidas'
FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID

GO

-- 3. ID del cliente y número de pedidos que nos ha hecho.

USE Northwind

SELECT CustomerID AS 'ID del Cliente', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY CustomerID
ORDER BY CustomerID

GO

-- 4. ID del cliente, año y número de pedidos que nos ha hecho cada año.

USE Northwind

SELECT CustomerID AS 'ID del Cliente', YEAR(OrderDate) AS 'Año', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate)
ORDER BY CustomerID, YEAR(OrderDate)

GO

-- 5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.

USE Northwind

SELECT ProductID AS 'ID del Producto', MAX(UnitPrice) AS 'Precio Unitario', SUM(Quantity * UnitPrice) AS 'Total Facturado'
FROM [Order Details]
GROUP BY ProductID
ORDER BY SUM(Quantity * UnitPrice) DESC

GO

-- 6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.

USE Northwind

SELECT SupplierID AS 'ID del Proveedor', SUM(UnitsInStock * UnitPrice) AS 'Importe Total del Stock'
FROM Products
GROUP BY SupplierID
ORDER BY SupplierID

GO

-- 7. Número de pedidos registrados mes a mes de cada año.

USE Northwind

SELECT YEAR(OrderDate) AS 'Año', MONTH(OrderDate) AS 'Mes', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate)

GO

-- 8. Año y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShipDate), en días para cada año.

USE Northwind

SELECT YEAR(OrderDate) AS 'Año', AVG(DATEDIFF(DAYOFYEAR, OrderDate, ShippedDate)) AS 'Tiempo Medio de Envío (días)'
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate)

GO

-- 9. ID del distribuidor y número de pedidos enviados a través de ese distribuidor.

USE Northwind

SELECT ShipVia AS 'ID Distribuidor', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia

GO

-- 10. ID de cada proveedor y número de productos distintos que nos suministra.

USE Northwind

SELECT SupplierID AS 'ID del Proveedor', COUNT(DISTINCT ProductID) AS 'Número de Productos'
FROM Products
GROUP BY SupplierID
ORDER BY SupplierID

GO

-- € Antonio Navarro
