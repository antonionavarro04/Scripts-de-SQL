-- 2. ID de producto y número de unidades vendidas de cada producto.

USE Northwind

SELECT ProductID AS 'ID de Producto', SUM(Quantity) AS 'Número de Unidades Vendidas'
FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID

GO
