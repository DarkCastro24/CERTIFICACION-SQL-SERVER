USE Escuela; 

/*
	DELETE FROM nombre_tabla
	WHERE condicion
*/

SELECT * FROM Calificaciones;

-- Borra todos los registros de la tabla 
DELETE FROM Calificaciones;

-- Eliminar todos los registros de la Tabla Profesores_Alumnos
DELETE FROM Profesores_Alumnos;

-- Eliminar todos los registros de la Tabla Alumnos_Tutores
DELETE FROM Alumnos_Tutores;

-- DELETE CON WHERE: Borra solo los que cumplan el condicional
DELETE FROM Alumnos 
WHERE nombre = 'OSCAR';

-- Borrar dos registros a la vez 
DELETE FROM Asignaturas 
WHERE idAsignatura = 11 OR idAsignatura = 5;

-- DELETE con Foreign Key 
SELECT * FROM Alumnos;
SELECT * FROM Colegiaturas;

DELETE FROM Alumnos
WHERE idColegiatura = 1;

DELETE FROM Colegiaturas
WHERE idColegiatura = 1;

-- EJERCICIO PRACTICO 

-- 1. Eliminar la película donde el valor del campo “idPelicula” es igual a 114
DELETE FROM Peliculas
WHERE idPelicula = 114;

-- 2. Eliminar las películas que tengan una calificación de 6.5
DELETE FROM Peliculas
WHERE calificacion = 6.5;

-- 3. Eliminar la película de “Frozen”
DELETE FROM Peliculas
WHERE titulo = 'Frozen';

-- 4. Eliminar la película donde su fecha de lanzamiento es “26/11/2012”
DELETE FROM Peliculas
WHERE fechaLanzamiento = '2012-11-26';

-- 5. Eliminar todas las películas
DELETE FROM Peliculas;
