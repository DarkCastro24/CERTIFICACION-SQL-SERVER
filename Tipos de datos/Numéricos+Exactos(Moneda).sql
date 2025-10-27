-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Monedas
CREATE TABLE Monedas(
	col_smallmoney	SMALLMONEY, -- -214,748.3648 a 214,748.3647
	col_money		MONEY		-- -922,337,203,685,477.5808 a 922,337,203,685,477.5807
)
GO


-- Insertar registro en la Tabla Monedas
INSERT INTO Monedas VALUES(215000, 215000) -- Error fuera de rango SMALLMONEY
GO


-- Insertar registro correcto en la Tabla Monedas
INSERT INTO Monedas VALUES(205000.1234, 1250000.1234)
GO


-- Consultar la Tabla Monedas
SELECT * FROM Monedas
GO


-- Insertar valores con varios decimales
INSERT INTO Monedas VALUES(249.99987654321, 99.9999999999)
GO


-- Consultar la Tabla Monedas
SELECT * FROM Monedas -- Hace un redondeo del valor
GO


-- Insertar valores con simbolos monetarios
INSERT INTO Monedas VALUES($199.99, €990.90)
GO


-- Consultar la Tabla Monedas
SELECT * FROM Monedas -- No muestra el simbolo monetario
GO



-- Consultar el Número de Bytes usados
SELECT DATALENGTH(col_smallmoney) AS col_smallmoney, 
	   DATALENGTH(col_money) AS col_money
FROM Monedas
GO