/*
	Vamos a trabajar con las bases de datos de Microsoft pubs y Northwind que son bases de datos con data ficticia
	PREREQUISITO: importarlas damos click derecho en Databases
	Restore Database --> Device --> 3 puntos y seleccionar el archivo
*/

-- Y ya con eso tenemos las bases de datos pubs y NORTHWND
-- Operadores de comparacion

/*
	=     Igual a: devuelve registros cuyo valor sea exactamente igual al indicado.  
	>     Mayor que: devuelve registros con valores superiores al indicado.  
	>=    Mayor o igual que: incluye el valor límite y los superiores.  
	<     Menor que: devuelve registros con valores inferiores al indicado.  
	<=    Menor o igual que: incluye el valor límite y los inferiores.  
	<> o != Distinto de: devuelve registros cuyo valor no sea igual al indicado.  
	!<    No es menor que: equivalente a “mayor o igual que”.  
	!>    No es mayor que: equivalente a “menor o igual que”.
*/

USE NORTHWND;

-- Muestra todos los registros de la tabla Customers sin aplicar ningún filtro.
SELECT * FROM Customers;

-- Muestra todos los clientes cuyo país sea exactamente “Germany”.
SELECT * FROM Customers
WHERE Country = 'Germany';

-- Muestra el nombre de la compañía, contacto y dirección de los clientes que sean de México.
SELECT CompanyName, ContactName, Address
FROM Customers
WHERE Country = 'Mexico';

-- Muestra los productos cuyo número en existencia (UnitsInStock) sea mayor que 50.
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitsInStock > 50;

-- Muestra todos los productos con precio unitario mayor o igual a 97.
SELECT * FROM Products
WHERE UnitPrice >= 97;

-- Muestra los productos con existencias mayores o iguales a 115, ordenados por cantidad.
SELECT * 
FROM Products
WHERE UnitsInStock >= 115
ORDER BY UnitsInStock;

-- Muestra los productos con menos de 10 unidades en existencia.
SELECT * FROM Products
WHERE UnitsInStock < 10;

-- Muestra los productos cuyo precio sea menor o igual a 10.
SELECT * FROM Products
WHERE UnitPrice <= 10;

-- Muestra los productos con existencias menores o iguales a 10, ordenados de mayor a menor.
SELECT * 
FROM Products
WHERE UnitsInStock <= 10
ORDER BY UnitsInStock DESC;

-- Muestra los productos que están descontinuados (Discontinued diferente de 0).
SELECT * FROM Products
WHERE Discontinued <> 0;

-- Hace lo mismo que la consulta anterior, pero usando el operador “!=” en lugar de “<>”.
SELECT * FROM Products
WHERE Discontinued != 0;

-- Muestra nombre del contacto, dirección, país y teléfono de los clientes cuyo país no sea “USA”.
SELECT ContactName, Address, Country, Phone  
FROM Customers
WHERE Country <> 'USA'
ORDER BY Country;

-- Muestra los productos cuyo precio unitario no es menor que 100 (es decir, mayor o igual a 100).
SELECT ProductName, UnitPrice, UnitsInStock 
FROM Products
WHERE UnitPrice !< 100
ORDER BY UnitsInStock;

-- Muestra los productos cuyo precio no es mayor que 10 (es decir, menor o igual a 10).
SELECT * FROM Products
WHERE UnitPrice !> 10;

-- Muestra los productos con existencias que no superan las 100 unidades, ordenados de forma descendente.
SELECT ProductName, UnitPrice, UnitsInStock 
FROM Products
WHERE UnitsInStock !> 100
ORDER BY UnitsInStock DESC;


-- EJERCICIO PRACTICO PROPUESTO 
USE pubs;
GO

-- 1. Mostrar los autores que sean del estado de “UT”
SELECT * 
FROM authors
WHERE state = 'UT';

-- 2. Mostrar los títulos donde el precio sea mayor o igual a 20
SELECT * 
FROM titles
WHERE price >= 20;

-- 3. Mostrar los títulos donde el precio sea menor o igual a 7
SELECT * 
FROM titles
WHERE price <= 7;










