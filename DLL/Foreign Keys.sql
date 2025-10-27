-- FOREIGN KEY
-- Ejemplo de restricción referencial entre las tablas PROFESORES y CURSOS
-- Se muestran los diferentes comportamientos de las claves foráneas:
-- 1. Foreign Key normal: no permite actualizar o eliminar registros relacionados.
-- 2. ON UPDATE / ON DELETE CASCADE: actualiza o elimina automáticamente los registros relacionados.
-- 3. ON UPDATE / ON DELETE SET NULL: reemplaza la clave foránea por NULL al eliminar o actualizar.
-- 4. ON UPDATE / ON DELETE SET DEFAULT: reemplaza la clave foránea por un valor predeterminado.


----------------------------------------
--	UTILIZAR LA BASE DE DATOS tempdb --
----------------------------------------
USE tempdb;

---------------------------------
--	CREAR LA TABLA PROFESORES  --
---------------------------------
CREATE TABLE PROFESORES
(
   dni 		INT PRIMARY KEY,
   nombre 	VARCHAR(40),
   paterno 	VARCHAR(20),
   materno 	VARCHAR(20),
   email 	VARCHAR(40),
   edad 	INT
);

-----------------------------
--	CREAR LA TABLA CURSOS  --
-----------------------------
CREATE TABLE CURSOS
(
	cod_cur	INT PRIMARY KEY,
	dni 	INT FOREIGN KEY REFERENCES PROFESORES(dni),
	nombre 	VARCHAR(40)
);

----------------------------------------------
--	INSERTAR VALORES A LA TABLA PROFESORES  --
----------------------------------------------
INSERT INTO PROFESORES VALUES(99999999, 'FERNANDA', 'TORRES', 'GUILLEN', 'f.torres@example.com', 25);
INSERT INTO PROFESORES VALUES(88888888, 'LUISA', 'PEREZ', 'GARCIA', 'l.perez@example.com', NULL);
INSERT INTO PROFESORES VALUES(77777777, 'FATIMA', 'TORRES', 'GALLEGOS', 'f.torresg@example.com', 30);

------------------------------------------
--	INSERTAR VALORES A LA TABLA CURSOS  --
------------------------------------------
INSERT INTO CURSOS VALUES(1, 99999999, 'REDES');
INSERT INTO CURSOS VALUES(2, 99999999, 'ALGEBRA');
INSERT INTO CURSOS VALUES(3, 88888888, 'PROGRAMACIÓN');
INSERT INTO CURSOS VALUES(4, 77777777, 'SQL SERVER');

------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;
SELECT * FROM CURSOS;

------------------------------------------------------------------------------------------
--	PROBAR INSERCIÓN DE UN CURSO SIN PROFESOR RELACIONADO (VIOLACIÓN DE CLAVE FORÁNEA)  --
------------------------------------------------------------------------------------------
INSERT INTO CURSOS VALUES(5, 55555555, 'CLOUD COMPUTING');

------------------------------------------------
--	CONSULTAR LAS TABLAS PROFESORES Y CURSOS  --
------------------------------------------------
SELECT * FROM PROFESORES;
SELECT * FROM CURSOS;



====================================================================
-- CASO 1: FOREIGN KEY CON ON UPDATE CASCADE Y ON DELETE CASCADE
-- Explicación:
-- Si se actualiza o elimina un registro en la tabla principal (PROFESORES),
-- los cambios se reflejan automáticamente en la tabla relacionada (CURSOS).
====================================================================

USE tempdb;

DROP TABLE CURSOS;
DROP TABLE PROFESORES;

CREATE TABLE PROFESORES
(
   dni 		INT PRIMARY KEY,
   nombre 	VARCHAR(40),
   paterno 	VARCHAR(20),
   materno 	VARCHAR(20),
   email 	VARCHAR(40),
   edad 	INT
);

CREATE TABLE CURSOS
(
	cod_cur	INT PRIMARY KEY,
	dni 	INT FOREIGN KEY REFERENCES PROFESORES(dni)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	nombre 	VARCHAR(40) NOT NULL
);

INSERT INTO PROFESORES VALUES(99999999, 'FERNANDA', 'TORRES', 'GUILLEN', 'f.torres@example.com', 25);
INSERT INTO PROFESORES VALUES(88888888, 'LUISA', 'PEREZ', 'GARCIA', 'l.perez@example.com', NULL);
INSERT INTO PROFESORES VALUES(77777777, 'FATIMA', 'TORRES', 'GALLEGOS', 'f.torresg@example.com', 30);

INSERT INTO CURSOS VALUES(1, 99999999, 'REDES');
INSERT INTO CURSOS VALUES(2, 99999999, 'ALGEBRA');
INSERT INTO CURSOS VALUES(3, 88888888, 'PROGRAMACIÓN');
INSERT INTO CURSOS VALUES(4, 77777777, 'SQL SERVER');

UPDATE PROFESORES
SET dni = 22222222
WHERE dni = 99999999;

DELETE FROM PROFESORES
WHERE dni = 77777777;

SELECT * FROM PROFESORES;
SELECT * FROM CURSOS;



====================================================================
-- CASO 2: FOREIGN KEY CON ON UPDATE SET NULL Y ON DELETE SET NULL
-- Explicación:
-- Si el profesor es eliminado o su DNI cambia, el campo 'dni' en la tabla CURSOS
-- se reemplaza por NULL (sin eliminar el curso).
====================================================================

USE tempdb;

DROP TABLE CURSOS;
DROP TABLE PROFESORES;

CREATE TABLE PROFESORES
(
   dni 		INT PRIMARY KEY,
   nombre 	VARCHAR(40),
   paterno 	VARCHAR(20),
   materno 	VARCHAR(20),
   email 	VARCHAR(40),
   edad 	INT
);

CREATE TABLE CURSOS
(
	cod_cur	INT PRIMARY KEY,
	dni 	INT FOREIGN KEY REFERENCES PROFESORES(dni)
			ON UPDATE SET NULL
			ON DELETE SET NULL,
	nombre 	VARCHAR(40) NOT NULL
);

INSERT INTO PROFESORES VALUES(99999999, 'FERNANDA', 'TORRES', 'GUILLEN', 'f.torres@example.com', 25);
INSERT INTO PROFESORES VALUES(88888888, 'LUISA', 'PEREZ', 'GARCIA', 'l.perez@example.com', NULL);
INSERT INTO PROFESORES VALUES(77777777, 'FATIMA', 'TORRES', 'GALLEGOS', 'f.torresg@example.com', 30);

INSERT INTO CURSOS VALUES(1, 99999999, 'REDES');
INSERT INTO CURSOS VALUES(2, 99999999, 'ALGEBRA');
INSERT INTO CURSOS VALUES(3, 88888888, 'PROGRAMACIÓN');
INSERT INTO CURSOS VALUES(4, 77777777, 'SQL SERVER');

UPDATE PROFESORES
SET dni = 22222222
WHERE dni = 99999999;

DELETE FROM PROFESORES
WHERE dni = 77777777;

SELECT * FROM PROFESORES;
SELECT * FROM CURSOS;



====================================================================
-- CASO 3: FOREIGN KEY CON ON UPDATE SET DEFAULT Y ON DELETE SET DEFAULT
-- Explicación:
-- Cuando se elimina o actualiza un profesor, el campo 'dni' en la tabla CURSOS
-- se reemplaza por el valor DEFAULT (en este caso, 1).
-- Es necesario tener un registro en PROFESORES con dni=1.
====================================================================

USE tempdb;

DROP TABLE CURSOS;
DROP TABLE PROFESORES;

CREATE TABLE PROFESORES
(
   dni 		INT PRIMARY KEY,
   nombre 	VARCHAR(40),
   paterno 	VARCHAR(20),
   materno 	VARCHAR(20),
   email 	VARCHAR(40),
   edad 	INT
);

CREATE TABLE CURSOS
(
	cod_cur	INT PRIMARY KEY,
	dni 	INT DEFAULT 1 FOREIGN KEY REFERENCES PROFESORES(dni)
			ON UPDATE SET DEFAULT
			ON DELETE SET DEFAULT,
	nombre 	VARCHAR(40) NOT NULL
);

INSERT INTO PROFESORES VALUES(99999999, 'FERNANDA', 'TORRES', 'GUILLEN', 'f.torres@example.com', 25);
INSERT INTO PROFESORES VALUES(88888888, 'LUISA', 'PEREZ', 'GARCIA', 'l.perez@example.com', NULL);
INSERT INTO PROFESORES VALUES(77777777, 'FATIMA', 'TORRES', 'GALLEGOS', 'f.torresg@example.com', 30);
INSERT INTO PROFESORES VALUES(1, 'OTROS', 'OTROS', 'OTROS', 'otros@example.com', NULL);

INSERT INTO CURSOS VALUES(1, 99999999, 'REDES');
INSERT INTO CURSOS VALUES(2, 99999999, 'ALGEBRA');
INSERT INTO CURSOS VALUES(3, 88888888, 'PROGRAMACIÓN');
INSERT INTO CURSOS VALUES(4, 77777777, 'SQL SERVER');

UPDATE PROFESORES
SET dni = 22222222
WHERE dni = 99999999;

DELETE FROM PROFESORES
WHERE dni = 77777777;

SELECT * FROM PROFESORES;
SELECT * FROM CURSOS;
