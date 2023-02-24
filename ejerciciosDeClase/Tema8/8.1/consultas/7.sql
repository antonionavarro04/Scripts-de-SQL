-- 7. Número de pedidos registrados mes a mes de cada año.

USE Northwind

SELECT YEAR(OrderDate) AS 'Año', MONTH(OrderDate) AS 'Mes', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate)

GO
