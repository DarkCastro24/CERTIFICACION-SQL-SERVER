-- Usar la Base de Datos tempdb
USE tempdb
GO


-- Crear la Tabla Fechas
CREATE TABLE Fechas(
	col_time				TIME,
	col_date				DATE,
	col_smalldatetime		SMALLDATETIME,
	col_datetime			DATETIME,
	col_datetime2			DATETIME2(4),	--Precisión 4
	col_datetimeoffset		DATETIMEOFFSET
)
GO


-- Insertar registro en la Tabla Fechas
INSERT INTO Fechas 
VALUES('13:20:10.1234567',
	   '2024-06-01',
	   '2024-06-01 13:20:10',
	   '2024-06-01 13:20:10.123',
	   '2024-06-01 13:20:10.1234567',
	   '2024-06-01 13:20:10.1234567-05:00')
GO


-- Consultar la Tabla Fechas
SELECT * FROM Fechas
GO





-- Consultar el Número de Bytes usados
SELECT DATALENGTH(col_time) AS col_time,
	   DATALENGTH(col_date) AS col_date,
	   DATALENGTH(col_smalldatetime) AS col_smalldatetime,
	   DATALENGTH(col_datetime) AS col_datetime,
	   DATALENGTH(col_datetime2) AS col_datetime2,
	   DATALENGTH(col_datetimeoffset) AS col_datetimeoffset
FROM Fechas
GO



-- Función GETDATE() y SYSDATETIMEOFFSET()
SELECT GETDATE() -- 3 NANOSEGUNDOS
GO
SELECT SYSDATETIMEOFFSET() -- 7 NANOSEGUNDOS Y UTC
GO


-- Insertar registro a partir de la Fecha del Sistema
INSERT INTO Fechas 
VALUES(GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE()),
	  (SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET(), 
	   SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET(), SYSDATETIMEOFFSET())
GO


-- Consultar la Tabla Fechas
SELECT * FROM Fechas
GO