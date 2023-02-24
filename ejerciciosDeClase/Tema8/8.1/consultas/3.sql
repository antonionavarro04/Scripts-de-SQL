-- 3. ID del cliente y número de pedidos que nos ha hecho.

USE Northwind

SELECT CustomerID AS 'ID del Cliente', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY CustomerID
ORDER BY CustomerID

GO
