-- 6. ID del proveedor e importe total del stock acumulado de productos correspondientes a ese proveedor.

USE Northwind

SELECT SupplierID AS 'ID del Proveedor', SUM(UnitsInStock * UnitPrice) AS 'Importe Total del Stock'
FROM Products
GROUP BY SupplierID
ORDER BY SupplierID

GO
