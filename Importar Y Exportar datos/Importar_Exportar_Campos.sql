-- Instrucciones para importar datos (archivos txt)

-- Object Explorer --> Base de datos --> Task --> Import Data

/*
	Origen de datos: Flat file source 
	Destino de datos: Microsoft OLE DB Provider for SQL Server 
*/

USE Escuela;

-- Comprobar que se importo la data 
SELECT * FROM Tutores;

-- Instrucciones para exportar datos 

SELECT * FROM Profesores

-- Object Explorer --> Base de datos --> Task --> Export Data

/*
	Origen de datos: Microsoft OLE DB Provider for SQL Server 
	Destino de datos: Exportar Datos Profesores.txt 
	Copy data from one or more tables or views	
*/
