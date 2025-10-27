-- Operadores aritmeticos

USE NORTHWND;

-- Operador suma 
-- Suma una cantidad fija al precio unitario de cada producto
SELECT ProductName, UnitPrice,
	UnitPrice + 10 AS Suma
FROM Products;

-- Operador resta
-- Resta una cantidad fija al precio unitario de cada producto
SELECT ProductName, UnitPrice,
	UnitPrice - 2 AS Resta
FROM Products;

-- Operador multiplicacion
-- Calcula el costo total del inventario (precio * unidades)
SELECT ProductName, UnitPrice, UnitsInStock,
	UnitPrice * UnitsInStock AS costeInventario
FROM Products;

-- Operador division 
-- Devuelve el resultado de dividir dos valores numericos
SELECT 10 / 2;

-- Uso de CAST para obtener resultados decimales exactos
SELECT CAST(21 AS DECIMAL(7,2)) / 2;

-- Mostrar la cantidad, precio y descuento de la tabla Order Details 
-- Calcular el monto total aplicando el descuento al precio
SELECT Quantity, UnitPrice, Discount,
	Quantity * (UnitPrice - (UnitPrice * Discount)) AS montoTotal
FROM [Order Details];

-- Operador de modulo 
-- Devuelve el residuo de una division
SELECT 10 % 5;
SELECT 10 % 3;

-- Operador AS sirve para renombrar un campo
-- Ejemplo: renombrar la columna CompanyName como Empresa
SELECT CompanyName AS Empresa 
FROM Customers;

-- Concatenacion de cadenas
-- Une el nombre y apellido del empleado en una sola columna
SELECT FirstName + ' ' + LastName AS NombreCompleto
FROM Employees;

-- Insertar valores en base a una consulta 
USE Escuela;

-- Mostrar los registros actuales de la tabla Profesores
SELECT * FROM Profesores;

-- Agregar registros de otra base de datos (NORTHWND)
INSERT INTO Profesores (nombre, paterno, domicilio)
SELECT FirstName, LastName, Address
FROM NORTHWND.dbo.Employees;
