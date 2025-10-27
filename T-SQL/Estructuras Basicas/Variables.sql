-- Variables en SQL Server

/*
Estructura basica 

DECLARE @NOMBRE_VARIABLE TIPO_DATO [= VALOR], ...
SET @NOMBRE_VARIABLE = VALOR
[PRINT | SET] @NOMBRE_VARIABLE
GO
*/


-------------------------------------------------
-- SECCION 1: DECLARACION Y ASIGNACION DE VARIABLES
-------------------------------------------------

DECLARE @edad TINYINT
DECLARE @nombre VARCHAR(20), @apellido VARCHAR(20)

SET @edad = 40
SET @nombre = 'Diego'
SET @apellido = 'Castro'

SELECT @edad AS edad, @nombre AS nombre, @apellido AS apellido

SELECT @nombre + ' ' + @apellido + ' ' + CAST(@edad AS VARCHAR(3)) AS nombreCompleto
GO


-------------------------------------------------
-- SECCION 2: DECLARACION CON ASIGNACION DIRECTA
-------------------------------------------------

DECLARE @edad TINYINT = 23
DECLARE @nombre VARCHAR(20) = 'Diego', @apellido VARCHAR(20) = 'Donayre'

SELECT @edad AS edad, @nombre AS nombre, @apellido AS apellido

SELECT @nombre + ' ' + @apellido + ' ' + CAST(@edad AS VARCHAR(3)) AS nombreCompleto
GO


-------------------------------------------------
-- SECCION 3: CONCATENACION DE VARIABLES EN UNA CADENA
-------------------------------------------------

DECLARE @nombre VARCHAR(20) = 'Diego'
DECLARE @pais VARCHAR(20) = 'El Salvador', @capital VARCHAR(20) = 'San Salvador'

SELECT 'Yo ' + @nombre + ', soy del pais de ' + @pais + ' y su capital es ' + @capital AS texto
GO


-------------------------------------------------
-- SECCION 4: VARIABLES EN LA INSTRUCCION SELECT
-------------------------------------------------
USE NORTHWND
GO

-- Consulta general de la tabla Customers
SELECT * FROM Customers
GO


-------------------------------------------------
-- Ejemplo 1: Consulta con variable de pais
-------------------------------------------------
DECLARE @pais VARCHAR(25)
SET @pais = 'Mexico'

SELECT * FROM Customers
WHERE Country = @pais
GO


-------------------------------------------------
-- Ejemplo 2: Obtener el nombre de la compania segun el ID del cliente
-------------------------------------------------
DECLARE @idCliente NCHAR(5), @compania VARCHAR(40)
SET @idCliente = 'ALFKI'

SELECT @compania = CompanyName
FROM Customers
WHERE CustomerID = @idCliente

SELECT @compania AS Compania
GO


-------------------------------------------------
-- Ejemplo 3: Buscar por coincidencia en el campo ContactTitle
-------------------------------------------------
DECLARE @coincidencia VARCHAR(10)
SET @coincidencia = '%Manager'

SELECT * FROM Customers
WHERE ContactTitle LIKE @coincidencia
GO


-------------------------------------------------
-- Ejemplo 4: Buscar empleados segun coincidencia en el nombre
-------------------------------------------------
DECLARE @coincidencia VARCHAR(10)
SET @coincidencia = 'M%'

SELECT * FROM Employees
WHERE FirstName LIKE @coincidencia
GO


-------------------------------------------------
-- SECCION 5: USO DE EXECUTE CON VARIABLES
-------------------------------------------------
USE NORTHWND
GO

DECLARE @tabla VARCHAR(40) = 'Employees'
EXECUTE('SELECT * FROM ' + @tabla)
GO


-------------------------------------------------
-- SECCION 6: ASIGNAR EL VALOR DE UNA VARIABLE DESDE UN CAMPO
-------------------------------------------------

-- Este ejemplo obtiene el nombre del cliente y lo asigna a una variable
DECLARE @idCliente NCHAR(5) = 'ALFKI'
DECLARE @nombreCliente VARCHAR(50)

SELECT @nombreCliente = ContactName
FROM Customers
WHERE CustomerID = @idCliente

SELECT @nombreCliente AS Nombre_Cliente
GO

-- Tambien se puede obtener varios valores concatenados
DECLARE @idCliente2 NCHAR(5) = 'ALFKI'
DECLARE @resultado VARCHAR(100)

SELECT @resultado = CompanyName + ' (' + ContactTitle + ')'
FROM Customers
WHERE CustomerID = @idCliente2

SELECT @resultado AS DetalleCliente
GO
