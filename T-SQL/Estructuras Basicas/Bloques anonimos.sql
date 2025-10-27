-- Bloques anonimos, print y select 

-------------------------------------------------
-- PRINT
-- Permite mostrar mensajes o valores simples en la consola de resultados
-------------------------------------------------
PRINT 'Hola Mundo';
PRINT('Hola Mundo');

PRINT 10;
PRINT 10.9999;
GO

-------------------------------------------------
-- SELECT
-- Permite mostrar resultados en forma de tabla o con alias
-------------------------------------------------
SELECT 'Hola Mundo';
SELECT 10;
SELECT 10.9999;
SELECT 10.9999 AS Decimales;
GO

-------------------------------------------------
-- BLOQUE ANONIMO
-------------------------------------------------
BEGIN
    PRINT 'Hola Mundo'
    PRINT 'Hola Mundo2'
    SELECT 'Hola Mundo3'
END
GO

BEGIN
    PRINT 'Diego'
    PRINT 'Castro'
    SELECT 'Diego Castro'
END
GO

-------------------------------------------------
-- BLOQUE ANONIMO CON VARIABLES
-------------------------------------------------
DECLARE @nombre VARCHAR(20) = 'Diego'
DECLARE @apellido VARCHAR(20)

BEGIN
    SET @apellido = 'Castro'

    PRINT(@nombre)
    PRINT(@apellido)
    PRINT(@nombre + ' ' + @apellido)
END
GO

-------------------------------------------------
-- BLOQUE ANIDADO (PADRE E HIJO)
-------------------------------------------------
BEGIN
    PRINT('Bloque de Ejecucion Padre')

    DECLARE @numero TINYINT = 10

    BEGIN
        PRINT('Bloque de Ejecucion Hijo')
        PRINT(@numero)
    END

END
GO

-------------------------------------------------
-- AMBITO DE LAS VARIABLES EN BLOQUES DE EJECUCION
-------------------------------------------------
DECLARE @variableGlobal SMALLINT = 100  -- Variable Global
PRINT('Variable Global:')
PRINT(@variableGlobal)

BEGIN -- Bloque de Ejecucion Padre

	DECLARE @variablePrimario SMALLINT = 200  -- Variable Local Primario
	PRINT('Variable Primario:')
	PRINT(@variablePrimario)

	BEGIN -- Bloque de Ejecucion Hijo
		
		DECLARE @variableSegundario SMALLINT = 300  -- Variable Local Segundario
		PRINT('Variable Segundario:')
		PRINT(@variableSegundario)

	END

END
GO
