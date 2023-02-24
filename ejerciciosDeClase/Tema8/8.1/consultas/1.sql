-- 1. Nombre del país y número de clientes de cada país, ordenados alfabéticamente por el nombre del país

USE Northwind

SELECT Country AS 'País', COUNT(CustomerID) AS 'Número de Clientes'
FROM Customers
GROUP BY Country
ORDER BY Country

GO
