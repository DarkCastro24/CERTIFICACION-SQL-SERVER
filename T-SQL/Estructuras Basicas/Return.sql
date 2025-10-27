-- Puedes ubicarte en cualquier Base de Datos
-- Ejemplo del uso de RETURN:
-- RETURN finaliza la ejecucion del bloque o procedimiento actual.
-- Puede usarse para salir de un ciclo o devolver un valor especifico al terminar la ejecucion.

/*
Escribe un script que sume los numeros del 1 al 20,
pero cuando la suma sea mayor a 100 debe de terminar el procedimiento.
*/
DECLARE @contador SMALLINT = 1
DECLARE @suma SMALLINT = 0

WHILE @contador <= 20
BEGIN
    IF @suma > 100
    BEGIN
		PRINT 'La suma total mayor a 100 es: ' + CAST(@suma AS VARCHAR(6))
        RETURN -- Terminar el procedimiento cuando la suma supera 100
    END

    SET @suma = @suma + @contador
    SET @contador = @contador + 1
END
GO
