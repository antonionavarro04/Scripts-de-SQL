-- 8. Año y tiempo medio transcurrido entre la fecha de cada pedido (OrderDate) y la fecha en la que lo hemos enviado (ShipDate), en días para cada año.

USE Northwind

SELECT YEAR(OrderDate) AS 'Año', AVG(DATEDIFF(DAYOFYEAR, OrderDate, ShippedDate)) AS 'Tiempo Medio de Envío (días)'
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate)

GO
