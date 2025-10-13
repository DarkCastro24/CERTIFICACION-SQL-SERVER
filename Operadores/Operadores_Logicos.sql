/*
	OPERADORES LOGICOS

	AND: Devuelve los registros que cumplen todas las condiciones.       
	OR: Devuelve los registros que cumplen al menos una condición.  
	NOT: Niega una condición muestra los registros que no la cumplen.  
	BETWEEN: Filtra valores dentro de un rango, incluyendo los límites.  
	IN: Busca coincidencias en una lista de valores. 
	LIKE: Busca patrones de texto usando comodines (% y _).  
	IS NULL / IS NOT NULL: Verifica si un campo no tiene valor o sí tiene valor.  
*/

USE NORTHWND;

-- Muestra todos los registros de la tabla Customers sin aplicar filtros.
SELECT * FROM Customers;

-- Muestra los clientes que sean de Brasil y cuya ciudad sea exactamente “Rio de Janeiro”.
SELECT * FROM Customers
WHERE Country = 'Brazil' AND City = 'Rio de Janeiro';

-- Muestra los productos cuyo precio sea mayor o igual a 40 y tengan 20 unidades o menos en stock, ordenados por precio y existencias.
SELECT * FROM Products
WHERE UnitPrice >= 40 AND UnitsInStock <= 20
ORDER BY UnitPrice, UnitsInStock;

-- Muestra los clientes que sean de Francia o de Perú, ordenados por país.
SELECT * FROM Customers
WHERE Country = 'France' OR Country = 'Peru'
ORDER BY Country;

-- Muestra los productos con precio mayor a 100 o menor a 9, ordenados de mayor a menor precio.
SELECT * FROM Products
WHERE UnitPrice > 100 OR UnitPrice < 9
ORDER BY UnitPrice DESC;

-- Muestra los clientes cuya ciudad sea Sao Paulo, Madrid, Lisboa o Tokio.
SELECT * FROM Customers
WHERE City IN ('Sao Paulo', 'Madrid', 'Lisboa', 'Tokio')
ORDER BY City;

-- Muestra los productos cuyo precio unitario sea exactamente 10, 20, 30 o 40, ordenados por precio.
SELECT * FROM Products
WHERE UnitPrice IN (10,20,30,40)
ORDER BY UnitPrice;

-- Muestra los clientes cuyo nombre de contacto sea exactamente “Ana Trujillo”.
SELECT * FROM Customers
WHERE ContactName = 'Ana Trujillo';

-- Muestra los clientes cuyo nombre de contacto coincide con el patrón “Ana Trujillo” usando LIKE (equivalente al anterior).
SELECT * FROM Customers
WHERE ContactName LIKE 'Ana Trujillo';

-- Muestra los clientes cuyo nombre de contacto sea exactamente “Carlos González”.
SELECT * FROM Customers
WHERE ContactName = 'Carlos González';

-- Muestra los clientes cuyo nombre de contacto contiene “Gonz” seguido de un carácter y termina en “lez” (por ejemplo “Gonzalez” o “Gonzalez”).
SELECT * FROM Customers
WHERE ContactName LIKE '%Gonz_lez';

-- Muestra los clientes cuyo nombre contiene “Gonz”, seguido de un carácter, “le” y un último carácter cualquiera.
SELECT * FROM Customers
WHERE ContactName LIKE '%Gonz_le_';

-- Muestra los clientes cuya dirección comienza con “Av.” (como “Avenida”).
SELECT * FROM Customers 
WHERE Address LIKE 'Av.%';

-- Muestra los clientes cuyo número de teléfono cumple el patrón de tres caracteres, un guion y más dígitos (por ejemplo 123-4567).
SELECT * FROM Customers
WHERE Phone LIKE '___-%';

-- Muestra los pedidos cuya fecha de orden se encuentre entre el 1 de septiembre y el 31 de octubre de 1996 (formato compacto YYYYMMDD).
SELECT * FROM Orders
WHERE OrderDate BETWEEN '19960901' AND '19961031'
ORDER BY OrderDate;

-- Ejemplo de formato de fecha incorrecto (mes 18 no válido) — generará error o sin resultados.
SELECT * FROM Orders
WHERE OrderDate BETWEEN '01/09/1995' AND '31/18/1996'
ORDER BY OrderDate;

-- Muestra los pedidos con fecha de orden entre septiembre y octubre de 1996 usando formato YYYY/MM/DD.
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996/09/01' AND '1996/10/31'
ORDER BY OrderDate;

-- Cambia el formato de fecha a día-mes-año para las consultas siguientes.
SET DATEFORMAT dmy;

-- Muestra los pedidos con fechas entre el 1/09/1995 y el 31/10/1996 usando formato DMY con guiones.
SELECT * FROM Orders
WHERE OrderDate BETWEEN '01-09-1995' AND '31-10-1996'
ORDER BY OrderDate;

-- Muestra los pedidos con fechas entre el 1/09/1995 y el 31/10/1996 usando formato DMY con barras.
SELECT * FROM Orders
WHERE OrderDate BETWEEN '01/09/1995' AND '31/10/1996'
ORDER BY OrderDate;

-- Muestra los pedidos cuyo país de envío está alfabéticamente entre “Germany” y “Mexico”.
SELECT * FROM Orders
WHERE ShipCountry BETWEEN 'Germany' AND 'Mexico'
ORDER BY ShipCountry;

-- Muestra los productos que tienen entre 20 y 30 unidades en existencia, ordenados por cantidad.
SELECT * FROM Products
WHERE UnitsInStock BETWEEN 20 AND 30
ORDER BY UnitsInStock;

-- Muestra los pedidos cuya fecha de envío está entre el 1 de enero y el 31 de diciembre de 1998.
SELECT * FROM Orders
WHERE ShippedDate BETWEEN '19980101' AND '19981231'
ORDER BY ShippedDate;

-- Muestra los empleados cuyo país no sea “USA”.
SELECT * FROM Employees
WHERE NOT Country = 'USA';

-- Muestra los clientes cuyo país no sea USA, España, Francia ni Brasil, ordenados por país.
SELECT * FROM Customers
WHERE NOT Country IN ('USA', 'Spain', 'France', 'Brazil')
ORDER BY Country;

-- Muestra los productos que tienen menos de 20 unidades en stock (ya que se niega la condición “mayor o igual que 20”).
SELECT * FROM Products
WHERE NOT UnitsInStock >= 20
ORDER BY UnitsInStock DESC;

-- Muestra los clientes cuyos números de teléfono no inician con un paréntesis “(”.
SELECT * FROM Customers
WHERE NOT Phone LIKE '(%';

-- EJERCICIO PRACTICO PROPUESTO 
USE pubs;
GO

-- Muestra los autores que sean del estado CA y cuya ciudad sea Palo Alto.
SELECT * 
FROM authors
WHERE state = 'CA' AND city = 'Palo Alto';

-- Muestra los títulos cuyo precio sea mayor o igual a 20 o menor o igual a 7.
SELECT * 
FROM titles
WHERE price >= 20 OR price <= 7;

-- Muestra todos los empleados cuyo nombre empiece con la letra M.
SELECT * 
FROM employee
WHERE fname LIKE 'M%';

-- Muestra los autores que sean de los estados MD, IN u OR.
SELECT * 
FROM authors
WHERE state IN ('MD', 'IN', 'OR');









