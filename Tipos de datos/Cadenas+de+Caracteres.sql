-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Caracteres
CREATE TABLE Caracteres(
	col_char		CHAR(50),		-- 8001 Error
	col_varchar		VARCHAR(50),	-- 8001 Error
	col_nchar		NCHAR(50),		-- 4001 Error
	col_nvarchar	NVARCHAR(50)	-- 4001 Error
)
GO


-- Insertar registro en la Tabla Caracteres
INSERT INTO Caracteres 
VALUES( 'Hola', 'Hola', 'Hola', 'Hola' )
GO


-- Consultar la Tabla Caracteres
SELECT * FROM Caracteres
GO



-- Consultar el Número de Bytes usados
SELECT * FROM Caracteres
GO

SELECT DATALENGTH(col_char) AS col_char,
	   DATALENGTH(col_varchar) AS col_varchar,
	   DATALENGTH(col_nchar) AS col_nchar,
	   DATALENGTH(col_nvarchar) AS col_nvarchar
FROM Caracteres
GO




-- Insertar más registros
INSERT INTO Caracteres 
VALUES('¿Cómo estas?', '¿Cómo estas?', '¿Cómo estas?', '¿Cómo estas?'),
	  ('udatademy', 'udatademy', 'udatademy', 'udatademy'),
	  ('こんにちは世界', 'こんにちは世界', 'こんにちは世界', 'こんにちは世界'), --Japones(Hola Mundo)
	  (N'こんにちは世界', N'こんにちは世界', N'こんにちは世界', N'こんにちは世界') --Japones(Hola Mundo)
GO
	

-- Consultar la Tabla Caracteres
SELECT * FROM Caracteres
GO



-- Consultar el Número de Bytes usados
SELECT DATALENGTH(col_char) AS col_char,
	   DATALENGTH(col_varchar) AS col_varchar,
	   DATALENGTH(col_nchar) AS col_nchar,
	   DATALENGTH(col_nvarchar) AS col_nvarchar
FROM Caracteres
GO