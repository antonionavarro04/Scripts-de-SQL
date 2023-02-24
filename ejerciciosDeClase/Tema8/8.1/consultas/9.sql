-- 9. ID del distribuidor y número de pedidos enviados a través de ese distribuidor.

USE Northwind

SELECT ShipVia AS 'ID Distribuidor', COUNT(OrderID) AS 'Número de Pedidos'
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia

GO
