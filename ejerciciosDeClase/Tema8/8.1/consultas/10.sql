-- 10. ID de cada proveedor y número de productos distintos que nos suministra.

USE Northwind

SELECT SupplierID AS 'ID del Proveedor', COUNT(DISTINCT ProductID) AS 'Número de Productos'
FROM Products
GROUP BY SupplierID
ORDER BY SupplierID

GO
