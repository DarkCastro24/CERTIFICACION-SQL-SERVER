-- Usar la Base de Datos NORTHWND
-- Ejemplo del uso de IF EXISTS:
-- Permite verificar si existen registros que cumplen una condicion antes de ejecutar una instruccion.
-- Es util para validar datos antes de consultas, inserciones o eliminaciones.

USE NORTHWND
GO

-- Consultar la Tabla Empleados (Employees)
SELECT * FROM Employees
GO


/*
Crear una variable llamada "idEmpleado" y le debes asignar un valor
para mostrar los datos del empleado 
y si el "idEmpleado" no existe se debe mostrar el mensaje:
"El empleado no existe!"
*/
DECLARE @idEmpleado TINYINT = 5

IF EXISTS ( SELECT * FROM Employees WHERE EmployeeID = @idEmpleado )
BEGIN
	PRINT('El empleado existe!')
	PRINT('')
	SELECT * FROM Employees WHERE EmployeeID = @idEmpleado
END
ELSE
BEGIN
	PRINT('El empleado no existe!')
END
GO


-------------------------------------------------
-- Consultar la Tabla Productos (Products)
-------------------------------------------------
SELECT * FROM Products
GO


-------------------------------------------------
-- Ejercicio Propuesto
-------------------------------------------------
/*
Crear una variable llamada "precio" y le debes asignar un valor
para mostrar los Productos (Products) donde el valor de la
variable "precio" debe ser mayor o igual al valor del campo "UnitPrice"
Si el "precio" no existe se debe mostrar el mensaje:
"No se ha encontrado ningun producto!"
Ordenar de manera Descendente por el campo "UnitPrice"
*/
DECLARE @precio DECIMAL(7,2) = 50

IF EXISTS ( SELECT * FROM Products WHERE UnitPrice >= @precio )
BEGIN
	PRINT('El/los productos son:')
	PRINT('')
	SELECT * FROM Products WHERE UnitPrice >= @precio
	ORDER BY UnitPrice DESC
END
ELSE
BEGIN
	PRINT('No se ha encontrado ningun producto!')
END
GO
