-- Usar la Base de Datos Master
Use master
GO


-- Crear una Base de Datos Japan
CREATE DATABASE Japan
ON
(	
	NAME = Japan_dat,
	FILENAME = 'C:\Master en SQL Server\Japan_dat.mdf',
	SIZE = 10MB,  -- La unidad de medida puede ser [ KB | MB | GB | TB ]
	MAXSIZE = 50MB,  -- La unidad de medida puede ser [ KB | MB | GB | TB ] | UNLIMITED
	FILEGROWTH = 5MB  -- La unidad de medida puede ser [ KB | MB | GB | TB | % ]
)
LOG ON
(
	NAME = Japan_log,
	FILENAME = 'C:\Master en SQL Server\Japan_log.ldf',
	SIZE = 10MB,  -- La unidad de medida puede ser [ KB | MB | GB | TB ]
	MAXSIZE = 25MB,  -- La unidad de medida puede ser [ KB | MB | GB | TB ] | UNLIMITED
	FILEGROWTH = 5MB  -- La unidad de medida puede ser [ KB | MB | GB | TB | % ]
)
COLLATE Japanese_CI_AS;
GO


-- Usar la Base de Datos Japan
Use Japan
GO


-- Crear la Tabla Caracteres
CREATE TABLE Caracteres(
	col_char		CHAR(50),		-- 8001 Error
	col_varchar		VARCHAR(50),	-- 8001 Error
	col_nchar		NCHAR(50),		-- 4001 Error
	col_nvarchar	NVARCHAR(50)	-- 4001 Error
)
GO


-- Consultar la Tabla Caracteres
SELECT * FROM Caracteres
GO


-- Insertar registros en la Tabla Caracteres
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


-- Usar la Base de Datos Master
Use master
GO


-- Eliminar la Base de Datos Japan
DROP DATABASE Japan
GO