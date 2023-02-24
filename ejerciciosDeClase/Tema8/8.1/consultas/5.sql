-- 5. ID del producto, precio unitario y total facturado de ese producto, ordenado por cantidad facturada de mayor a menor. Si hay varios precios unitarios para el mismo producto tomaremos el mayor.

USE Northwind

SELECT ProductID AS 'ID del Producto', MAX(UnitPrice) AS 'Precio Unitario', SUM(Quantity * UnitPrice) AS 'Total Facturado'
FROM [Order Details]
GROUP BY ProductID
ORDER BY SUM(Quantity * UnitPrice) DESC

GO
