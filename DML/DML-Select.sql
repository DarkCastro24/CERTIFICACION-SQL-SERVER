-- Select * from nombre_tabla CONSULTA TODA LA TABLA 
-- Select campo1, campo2 from nombre_tabla CONSULTA ALGUNOS CAMPOS

USE Escuela;

-- Consultar todos los datos de la tabla profesores
SELECT TOP(100) [idProfesor]
      ,[nombre]
      ,[paterno]
      ,[materno]
      ,[fechaNacimiento]
      ,[domicilio]
      ,[telefono]
      ,[email]
  FROM [dbo].[Profesores]

-- Consultar algunos campos unicamente
SELECT TOP(100) [idProfesor]
      ,[nombre]
      ,[paterno]
      ,[materno]
  FROM [dbo].[Profesores]

-- Consulta a todos los campos de la tabla profesores
SELECT * FROM Profesores;

-- Consultando campos especificos
SELECT nombre, paterno, materno FROM Profesores;

SELECT nombre, paterno, materno, telefono
FROM Profesores;

-- CLAUSULA DISTINCT 

SELECT * FROM Asignaturas;

SELECT DISTINCT nombre
FROM Asignaturas;

-- No muestra los campos con valores repetidos 
SELECT DISTINCT horaInicio
FROM Asignaturas;

-- CLAUSULA WHERE 
SELECT * FROM Profesores
WHERE nombre = 'Wilmer';

SELECT * FROM Profesores
WHERE idProfesor = 1;

SELECT * FROM Profesores
WHERE fechaNacimiento = '2000-02-13';

-- CLAUSULA ORDER BY 
SELECT idProfesor, nombre, fechaNacimiento, domicilio
FROM Profesores

-- Ordenado por ORDER BY 
/*
	Por defecto se ordena de forma ascendente ASC
	Se ordena por el primer campo luego por el segundo
*/
SELECT idProfesor, nombre, fechaNacimiento, domicilio
FROM Profesores
ORDER BY nombre, fechaNacimiento;

-- Ordenando de forma descendente DESC
SELECT idProfesor, nombre, fechaNacimiento, domicilio
FROM Profesores
ORDER BY nombre DESC;

-- Podemos ordenar por el numero de columna colocando solo el numero
SELECT idProfesor, nombre, fechaNacimiento, domicilio
FROM Profesores
ORDER BY 2; -- No recomendado mejor el nombre de la columna

-- CLAUSULA TOP 

-- Muestra los primeros TOP n registros que retorne la consulta
SELECT TOP 2 * 
FROM Profesores

-- CLAUSULA PERCENT 
-- Regresa las filas superiores basadas en un porcentaje del conjunto 
-- de resultados total 

SELECT idProfesor, nombre, paterno, materno
FROM Profesores;

-- Son 12 registros al ejecutar con PERCENT regresa el 50% de los registros 
SELECT TOP 50 PERCENT idProfesor, nombre, paterno, materno
FROM Profesores

-- CLAUSULA WITH TIES 

-- Incluye las filas que coinciden con la ultima fila 
SELECT TOP 4 WITH TIES * 
FROM Calificaciones
ORDER BY calificacion DESC; -- Retorna 2 registros mas que coinciden en calificacion 

-- EJERCICIO PRACTICO 
CREATE TABLE Peliculas (
    idPelicula INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    presupuesto BIGINT NOT NULL,
    fechaLanzamiento DATE NOT NULL,
    ganancia BIGINT NOT NULL,
    tiempoDuracion INT NOT NULL,
    calificacion DECIMAL(3,1) NULL
);

INSERT INTO Peliculas (idPelicula, titulo, presupuesto, fechaLanzamiento, ganancia, tiempoDuracion, calificacion)
VALUES
(101, 'Avatar', 237000000, '2009-12-10', 2787965087, 162, 7.2),
(102, 'Titanic', 200000000, '1997-11-18', 1845034188, 194, 7.5),
(103, 'The Avengers', 220000000, '2012-04-25', 1519557910, 143, 7.4),
(104, 'Jurassic World', 150000000, '2015-06-09', 1513528810, 124, 6.5),
(105, 'Furious 7', 190000000, '2015-04-01', 1506249360, 137, 7.3),
(106, 'Avengers: Age of Ultron', 280000000, '2015-04-22', 1405403694, 141, 7.3),
(107, 'Frozen', 150000000, '2013-11-27', 1274219009, 102, 7.3),
(108, 'Iron Man 3', 200000000, '2013-04-18', 1215439994, 130, 6.8),
(109, 'Minions', 74000000, '2015-06-17', 1156730962, 91, 6.4),
(110, 'Captain America: Civil War', 250000000, '2016-04-27', 1153304495, 147, 7.1),
(111, 'Transformers: Dark of the Moon', 195000000, '2011-06-28', 1123746996, 154, 6.1),
(112, 'The Lord of the Rings: The Return of the King', 94000000, '2003-12-01', 1118888979, 201, 8.1),
(113, 'Skyfall', 200000000, '2012-10-25', 1108561013, 143, 6.9),
(114, 'Transformers: Age of Extinction', 210000000, '2014-06-25', 1091405097, 165, 5.8),
(115, 'The Dark Knight Rises', 250000000, '2012-07-16', 1084939099, 163, 7.6),
(116, 'Toy Story 3', 200000000, '2010-06-16', 1066969703, 103, 7.6),
(117, 'Pirates of the Caribbean: Dead Man''s Chest', 200000000, '2006-06-20', 1065659812, 151, 7.0),
(118, 'Pirates of the Caribbean: On Stranger Tides', 380000000, '2011-05-14', 1045713802, 136, 6.4),
(119, 'Alice in Wonderland', 200000000, '2010-03-03', 1025491110, 108, 6.4),
(120, 'The Hobbit: An Unexpected Journey', 250000000, '2012-11-26', 1021103568, 169, 7.0);

-- 1️ Mostrar todos los registros de la tabla Peliculas.
SELECT * 
FROM Peliculas;

-- 2 Mostrar los distintos tiempos de duración de las películas.
SELECT DISTINCT tiempoDuracion 
FROM Peliculas;

-- 3 Mostrar las películas que tengan un tiempo de duración de 165 minutos.
SELECT * 
FROM Peliculas
WHERE tiempoDuracion = 165;

-- 4 Mostrar las películas ordenadas de manera ascendente por la fecha de lanzamiento.
SELECT * 
FROM Peliculas
ORDER BY fechaLanzamiento ASC;

-- 5 Mostrar las 5 mejores películas ordenadas de manera descendente por la calificación.
SELECT TOP 5 * 
FROM Peliculas
ORDER BY calificacion DESC;

-- 6 Mostrar el 50% de las películas ordenadas de manera descendente por la ganancia.
SELECT TOP 50 PERCENT * 
FROM Peliculas
ORDER BY ganancia DESC;


