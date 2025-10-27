-- Operadores de conjunto 

/*
    Los operadores de conjunto se utilizan para combinar los resultados de 
    dos o mas consultas SELECT. 
    
    Requisitos:
        Los SELECT deben tener el mismo numero de columnas.
        Las columnas deben tener tipos de datos compatibles.
        El orden de las columnas debe coincidir.
*/

USE NORTHWND;

-- Une los dos conjuntos eliminando los duplicados
(
SELECT 1 AS num
UNION 
SELECT 2 
UNION 
SELECT 3 

)
UNION
(
SELECT 3 AS num2
UNION 
SELECT 4
UNION 
SELECT 5
)

-- Seleccionar los paises de Customers y Country
SELECT Country 
FROM Customers
UNION 
SELECT Country
FROM Employees

-- UNION ALL muestra tambien los duplicados
SELECT Country 
FROM Customers
UNION ALL
SELECT Country
FROM Employees

-- INTERSECT: Mantiene las filas que son comunes en las consultas
SELECT Country 
FROM Customers
INTERSECT
SELECT Country
FROM Employees

-- EXCEPT: Muestra los registros de la primera tabla que no estan en la segunda
SELECT Country 
FROM Customers
EXCEPT
SELECT Country
FROM Employees

-- Ejercicio propuesto
USE pubs;
GO

-- Unir los nombres de las tablas authors y employee
-- eliminando los valores duplicados si existen
SELECT au_fname AS Nombre
FROM authors
UNION
SELECT fname
FROM employee;
GO

-- Unir los estados de las tablas authors y publishers
-- conservando los valores duplicados si existen
SELECT state AS Estado
FROM authors
UNION ALL
SELECT state
FROM publishers;
GO
