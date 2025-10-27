-- Puedes ubicarte en cualquier Base de Datos
-- Ejemplo del uso de GOTO:
-- Permite cambiar el flujo de ejecucion del programa saltando a una etiqueta especifica.
-- Es util para pruebas de flujo o para romper estructuras complejas de control.

DECLARE @contador TINYINT = 1

WHILE @contador < 10  
BEGIN   
    IF @contador = 4 GOTO etiqueta_uno   -- Salta a la primera etiqueta.
    IF @contador = 5 GOTO etiqueta_dos   -- Esto nunca se ejecutara.
	SET @contador = @contador + 1  
END  

etiqueta_uno:
    PRINT 'Saltando a la etiqueta Uno.'
    GOTO etiqueta_tres   -- Esto evitara que Etiqueta Dos se ejecute.

etiqueta_dos:
    PRINT 'Saltando a la etiqueta Dos.'

etiqueta_tres:  
    PRINT 'Saltando a la etiqueta Tres.'
