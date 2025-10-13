/*
	UPDATE nombre_tabla
	SET col1 = exp1,
		col2 = exp2,
		....
	WHERE condicion
*/

USE Escuela;

-- Update sin Where todos se afectan 
UPDATE Auxiliares 
SET telefono = 90000; 

SELECT * FROM Auxiliares;

UPDATE Auxiliares
SET nombre = 'ANA'

SELECT * FROM Auxiliares;

UPDATE Tutores 
SET telefono = 999999999

-- Update con Where solo se afectan los que cumplan la condicion 
UPDATE Profesores
SET nombre = 'Jessy',
	paterno = 'Campos',
	domicilio = 'Av Historia 111'
WHERE idProfesor = 1;

SELECT * FROM Profesores WHERE idProfesor = 1;

UPDATE Profesores 
SET email = 'eva@example.com'
WHERE idProfesor = 5;

SELECT * FROM Profesores;

-- Ejercicio UPDATE con Condicional
UPDATE Calificaciones
SET calificacion = 20
WHERE calificacion = 17;

UPDATE Alumnos 
SET nombre = 'oscar',
	paterno = 'leon',
	materno = 'hurtado'
WHERE idAlumno = 2;

-- UPDATE con Foreign Key 
SELECT * FROM Asignaturas;

UPDATE Asignaturas
SET idProfesor = 10 -- Este ID debe existir
WHERE idAsignatura = 1;

-- EJERCICIO PRACTICO 
-- 1. Actualizar la calificación a 8.5 donde el idPelicula es 110
UPDATE Peliculas
SET calificacion = 8.5
WHERE idPelicula = 110;

-- 2. Actualizar el tiempo de duración a 140 de la película “Avatar”
UPDATE Peliculas
SET tiempoDuracion = 140
WHERE titulo = 'Avatar';

-- 3. Actualizar la fecha de lanzamiento al “17/06/2010” de la película “Toy Story 3”
UPDATE Peliculas
SET fechaLanzamiento = '2010-06-17'
WHERE titulo = 'Toy Story 3';

-- 4. Actualizar el nombre de todas las películas a “Desconocido”
UPDATE Peliculas
SET titulo = 'Desconocido';
