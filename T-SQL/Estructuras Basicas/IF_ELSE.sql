-- Puedes ubicarte en cualquier Base de Datos
-- Ejemplo del uso de IF...ELSE:
-- Permite ejecutar una o varias instrucciones de manera condicional
-- segun se cumpla o no una expresion logica.

/*
Crear una variable "edad" y le debes asignar un valor
para mostrar un mensaje indicando si es mayor o menor de edad.
Nota: Para ser mayor de edad debes tener una edad mayor o igual a 18 anos
*/
DECLARE @edad TINYINT = 20

IF @edad >= 18
	PRINT('Eres mayor de edad.') -- Solo una instruccion
ELSE
	PRINT('Eres menor de edad.')
GO

-- Utilizando Bloque de Ejecucion
DECLARE @edad TINYINT = 20

IF @edad >= 18
BEGIN
	PRINT('Eres mayor de edad.')
END
ELSE
BEGIN
	PRINT('Eres menor de edad.')
END
GO



/*
Crear dos dos variables "venta" y "bono"
Si las ventas son mayores a 20 000 el bono es 500
Si las ventas son mayores a 50 000 el bono es 900
De lo contrario el bono es 100
*/
DECLARE @venta INT = 10000
DECLARE @bono SMALLINT = 0

IF @venta > 50000
BEGIN
	SET @bono = 900
	PRINT('Venta:')
	PRINT(@venta)
	PRINT('Bono:')
	PRINT(@bono)
END
ELSE
BEGIN
	IF @venta > 20000
	BEGIN
		SET @bono = 500
		PRINT('Venta:')
		PRINT(@venta)
		PRINT('Bono:')
		PRINT(@bono)
	END
	ELSE
	BEGIN
		SET @bono = 100
		PRINT('Venta:')
		PRINT(@venta)
		PRINT('Bono:')
		PRINT(@bono)
	END
END
GO


-- Ejercicio Propuesto 1
/*
Crear una variable que contendra un valor Entero asignado por nosotros
Se debe indicar un mensaje si el valor asignado es PAR o IMPAR.
Nota: Debes utilizar el Operador Aritmetico "MOD(%)"
*/
DECLARE @numero SMALLINT = 10

IF @numero % 2 = 0
BEGIN
	PRINT('El numero es PAR.')
END
ELSE
BEGIN
	PRINT('El numero es IMPAR.')
END
GO


-- Ejercicio Propuesto 2
/*
Crear una Variable llamado "caracter" de tipo CHAR(1)
la cual va a aceptar un valor de la letra "A" hasta la letra "E"
Y dependiendo de la letra asignada se debe mostrar el siguiente mensaje:
"A" -> "Pais de Argentina".
"B" -> "Pais de Brasil".
"C" -> "Pais de Colombia".
"D" -> "Pais de Dinamarca".
"E" -> "Pais de Ecuador".
Si se ingresa una letra fuera de la lista, mostrar el mensaje:
"Pais fuera de la lista"
*/
DECLARE @caracter CHAR(1) = 'A'

IF @caracter = 'A'
	PRINT('Pais de Argentina.')
ELSE
	IF @caracter = 'B'
		PRINT('Pais de Brasil.')
	ELSE
		IF @caracter = 'C'
			PRINT('Pais de Colombia.')
		ELSE
			IF @caracter = 'D'
				PRINT('Pais de Dinamarca.')
			ELSE
				IF @caracter = 'E'
					PRINT('Pais de Ecuador.')
				ELSE
					PRINT('Pais fuera de la lista.')
GO
