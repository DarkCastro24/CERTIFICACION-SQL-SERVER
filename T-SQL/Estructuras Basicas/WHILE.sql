-- Puedes ubicarte en cualquier Base de Datos

/*
Utilizando el bucle WHILE debes mostrar
los numeros del 1 al 10
*/
DECLARE @contador INT
SET @contador = 1

WHILE @contador <= 10
BEGIN
	PRINT('El valor de la Variable Contador es: ' + CAST(@contador AS VARCHAR(10)))
	-- SET @contador = @contador + 1
	SET @contador += 1
END
GO


/*
Calcular la Suma de los numeros PARES 
del 1 hasta el valor que le asignemos a una variable.
*/
DECLARE @numero INT = 10
DECLARE @contador INT = 1
DECLARE @suma INT = 0

WHILE @contador <= @numero
BEGIN
    IF @contador % 2 = 0
    BEGIN
		-- SET @suma = @suma + @contador
        SET @suma += @contador
    END
    -- SET @contador = @contador + 1
	SET @contador += 1
END

PRINT('La suma de los numeros pares del 1 al ' + CAST(@numero AS VARCHAR(10)) + 
		' es: ' + CAST(@suma AS VARCHAR(10)))
GO


-- Ejercicio Propuesto
/*
Crear una Variable en la cual se le asignara un valor numerico
y se debe crear la Tabla de Multiplicar del 1 al 12
*/
DECLARE @numero INT = 9
DECLARE @contador INT = 1

PRINT('Tabla de Multiplicar del ' + CAST(@numero AS VARCHAR(10)))
PRINT('-----------------------------')

WHILE @contador <= 12
BEGIN
	PRINT(CAST(@numero AS VARCHAR(10)) + ' * ' + CAST(@contador AS VARCHAR(10)) + 
			' = ' + CAST(@numero * @contador AS VARCHAR(10)))
	-- SET @contador = @contador + 1
	SET @contador += 1
END
GO
