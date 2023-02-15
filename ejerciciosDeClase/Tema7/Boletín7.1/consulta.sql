USE Northwind

-- ? Ejercicio 1
SELECT CompanyName, Address, City, Country
FROM Customers
WHERE Country <> 'USA'

-- ? Ejercicio 2
SELECT CompanyName, Address, City, Country
FROM Customers
WHERE Country <> 'USA'
ORDER BY Country, City

-- ? Ejercicio 3
SELECT FirstName, LastName, City, BirthDate
FROM Employees
ORDER BY HireDate

-- ? Ejercicio 4
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC

-- ? Ejercicio 5
SELECT CompanyName, Address, City, Country
FROM Suppliers
WHERE Country IN ('Canada', 'USA', 'Mexico')

-- ? Ejercicio 6
SELECT ProductName, UnitsInStock, UnitsInStock * UnitPrice AS fullStockValue
FROM Products
WHERE CategoryID <> 4

-- ? Ejercicio 7
SELECT CompanyName, Address, City, Country, ContactName
FROM Customers
WHERE Country NOT IN ('Canada', 'USA', 'Mexico') AND ContactTitle <> 'Owner'

-- ? Ejercicio 8
SELECT CustomerID, COUNT (OrderID) AS NumberOrders
FROM Orders
GROUP BY CustomerID
ORDER BY numberOrders DESC

-- ? Ejercicio 9
SELECT COUNT (OrderID) AS NumberOrder, ShipCity
FROM Orders
GROUP BY ShipCity

-- ? Ejercicio 10
SELECT COUNT (ProductID) AS NumberProduct, CategoryID
FROM Products
GROUP BY CategoryID