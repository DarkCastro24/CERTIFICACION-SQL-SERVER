-- Puedes ubicarte en cualquier Base de Datos
-- Ejemplo del uso de THROW:
-- Permite generar errores personalizados o relanzar errores existentes dentro de un bloque TRY...CATCH.
-- Es util para el control y manejo de excepciones en procedimientos y scripts SQL.


-- Utilizar la instruccion THROW
THROW 50001, 'Ha ocurrido un error', 10
GO

-- Utilizar la instruccion THROW en el ejemplo del capitulo anterior
BEGIN TRY
	DECLARE @numero INT = 'Texto'
END TRY
BEGIN CATCH
	PRINT('No es posible asignar un valor de cadena a un tipo de dato entero.');
 	THROW 50001, 'Ha ocurrido un error', 10
END CATCH
GO

-- Utilizar la instruccion THROW sin Argumentos
BEGIN TRY
	DECLARE @numero INT = 'Texto'
END TRY
BEGIN CATCH
	PRINT('No es posible asignar un valor de cadena a un tipo de dato entero.');
 	THROW
END CATCH
GO
