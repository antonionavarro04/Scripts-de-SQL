-- 4. ID del cliente, año y número de pedidos que nos ha hecho cada año.

USE Northwind

SELECT CustomerID AS 'ID del Cliente', YEAR(OrderDate) AS 'Año', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate)
ORDER BY CustomerID, YEAR(OrderDate)

GO
