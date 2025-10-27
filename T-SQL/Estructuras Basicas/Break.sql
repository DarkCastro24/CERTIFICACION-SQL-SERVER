-- Puedes ubicarte en cualquier Base de Datos
-- Ejemplo del uso de BREAK:
-- BREAK permite salir inmediatamente de un bucle WHILE cuando se cumple una condicion especifica.
-- Es util para detener la ejecucion antes de que se complete el ciclo.

/*
Escribe un script que imprima los numeros del 1 al 10 
utilizando un bucle WHILE. 
Si el contador alcanza el valor 5, 
se debe salir del bucle usando BREAK.
*/
DECLARE @contador TINYINT = 1

WHILE @contador <= 10
BEGIN
    PRINT 'El valor de la Variable Contador es: ' + CAST(@contador AS VARCHAR(3))
    IF @contador = 5
    BEGIN
        BREAK -- Salir del bucle si el contador es 5
    END
    SET @contador = @contador + 1
END
GO


-- Ejercicio Propuesto
/*
Escribe un script que sume los numeros impares del 1 al 20
utilizando un bucle WHILE. 
Si la suma supera el valor 50, 
se debe salir del bucle usando BREAK.
*/
DECLARE @contador INT = 1
DECLARE @suma INT = 0

WHILE @contador <= 20
BEGIN
    IF @contador % 2 <> 0
    BEGIN
        SET @suma += @contador
    END
    IF @suma > 50
    BEGIN
        PRINT 'La suma ha superado el limite de 50.'
        BREAK -- Salir del bucle si la suma supera 50
    END
    SET @contador = @contador + 1
END

PRINT 'La suma de los numeros impares del 1 al 20 es: ' + CAST(@suma AS VARCHAR(10))
GO
