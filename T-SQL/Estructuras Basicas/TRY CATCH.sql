-- Puedes ubicarte en cualquier Base de Datos
-- Ejemplo del uso de TRY...CATCH:
-- Permite manejar errores en tiempo de ejecucion sin detener el programa.
-- Es util para capturar excepciones como division entre cero o conversiones de datos invalidas.


-- Dividir 50/2
SELECT 50/2
GO
--PRINT 50/2
--GO


-- Dividir 50/0 (provoca error)
SELECT 50/0
GO
--PRINT 50/0
--GO


-- Dividir 50/0 utilizando TRY...CATCH
BEGIN TRY
	PRINT 50/0 -- Con otro divisor devuelve el resultado correcto
END TRY
BEGIN CATCH
	PRINT('No es posible realizar la division entre cero.')
END CATCH
GO


-- Declarar una variable con error (conversion de texto a entero)
DECLARE @numero INT = 'Texto'
GO


-- Declarar una variable con error utilizando TRY...CATCH
BEGIN TRY
	DECLARE @numero INT = 'Texto'
END TRY
BEGIN CATCH
	PRINT('No es posible asignar un valor de cadena a un tipo de dato entero.')
END CATCH
GO
