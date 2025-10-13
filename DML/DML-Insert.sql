USE Escuela

-- Insertando registros en la tabla Profesores
INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Gloria', 'Campos', 'Guillen', '2000-01-01', 'Jr Brasil 101', '999999999', NULL);

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Oscar', 'Torres', 'Morales', '2001-02-02', 'Jr Pardo 302', '988888888', 'oscar@example.com');

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Wilmer', 'Vilela', 'Moran', '2000-03-03', 'Jr Pardo 402', '977777777', NULL);

-- Consultar que se insertaron los registros
SELECT * FROM Profesores;

-- Tarea insertar los siguientes registros a la tabla Profesores
INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Andr�s', 'Garc�a', 'Rodr�guez', '2002-08-15', 'Av. Espa�a 143', '966666666', 'andres@example.com');

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Eva', 'L�pez', 'S�nchez', '1998-12-12', 'Jr. Historia 366', '955555555', NULL);

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Lara', 'Jimenez', 'Hern�ndez', '2001-10-17', 'Jr. Baita 877', '944444444', 'lara@example.com');

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Sara', 'Moreno', 'Romero', '1997-10-16', 'Jr. Libertad 222', '933333333', 'sara@example.com');

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('H�ctor', 'Ramos', 'Blanco', '2003-05-06', 'Ca. Buenos Aires 222', '922222222', NULL);

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Lucas', 'Castro', 'Ortega', '1999-03-01', 'Av. Espania 654', NULL, NULL);

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Mart�n', 'Castillo', 'Cano', '2000-02-13', 'Jr. Pardo 674', NULL, 'martin@example.com');

INSERT INTO Profesores (nombre, paterno, materno, fechaNacimiento, domicilio, telefono, email)
VALUES ('Mariana', 'Flores', 'Pe�a', '2001-06-05', 'Jr. Prado 109', NULL, 'mariana@example.com');

-- Insertar en la tabla "Auxiliares" 
INSERT INTO Auxiliares (nombre, paterno, materno, telefono)
VALUES ('Mirexa', 'Gallegos', 'Vega', 999900001);

-- Falla por el Identity 
INSERT INTO Auxiliares (idAuxiliar, nombre, paterno, materno, telefono)
VALUES (101, 'Mirexa', 'Gallegos', 'Vega', 999900001);

INSERT INTO Auxiliares (nombre, paterno, materno, telefono)
VALUES ('Manuel', 'Santana', 'Herrera', 999900002);

INSERT INTO Auxiliares (nombre, paterno, materno, telefono)
VALUES ('Carla', 'Reyes', 'Prieto', 999900003);

INSERT INTO Auxiliares (nombre, paterno, materno, telefono)
VALUES ('Cristobal', 'Sotelo', 'Aguilar', 999900004);

INSERT INTO Auxiliares (nombre, paterno, materno, telefono)
VALUES ('Lida', 'Guillen', 'Benavides', 999900005);

-- Identity se genera antes de insertar por eso si da error 
-- se salta el ID que hubiese tenido ese registro
SELECT * FROM Auxiliares;

-- Con esto podemos insertar manualmente el valor Identity
SET IDENTITY_INSERT Auxiliares ON;

INSERT INTO Auxiliares (idAuxiliar,nombre, paterno, materno, telefono)
			VALUES (7, 'Juan', 'Leon', 'Blanco', NULL);

INSERT INTO Auxiliares (idAuxiliar,nombre, paterno, materno, telefono)
			VALUES (8, 'Fernanda', 'Ortiz', 'Sanz', NULL);

-- Con deshabilitar la posibilidad de insertar manualmente los valores identity
SET IDENTITY_INSERT Auxiliares OFF;

-- Agregar varios registros a la vez
INSERT INTO Auxiliares (nombre, paterno, materno, telefono)
VALUES ('Gabriel', 'Parra', 'Bravo', 999900006),
       ('Jorge', 'Moya', 'Soler', 999900007),
       ('Marta', 'Nieto', 'Diez', NULL),
       ('Raquel', 'Hidalgo', 'Iglesias', NULL);

-- Practica: Insertando multiples campos en Colegiaturas
INSERT INTO Colegiaturas (monto, fecha, estado)
VALUES 
(400, '2024-01-01', 1),
(400, '2024-02-01', 1),
(400, '2024-03-01', 1),
(400, '2024-04-01', 1),
(400, '2024-05-01', 1),
(400, '2024-06-01', 1),
(400, '2024-07-01', 1),
(400, '2024-08-01', 1),
(400, '2024-09-01', 1),
(400, '2024-10-01', 1),
(400, '2024-11-01', 1),
(400, '2024-12-01', 1);

-- Insertar en alumnos (tiene una FK)

-- Este da error porque no existe idColegiatura 100
INSERT INTO Alumnos (idAuxiliar, idColegiatura, codigoAlumno, nombre, paterno, materno, fechaNacimiento, domicilio)
VALUES (100, 100, 'A-100', 'Felipe', 'Mondalgo', 'Perez', '01/01/2000', 'Av. Brasil 520');

INSERT INTO Alumnos (idAuxiliar, idColegiatura, codigoAlumno, nombre, paterno, materno, fechaNacimiento, domicilio)
VALUES (1, 1, 'A-100', 'Felipe', 'Mondalgo', 'Perez', '01/01/2000', 'Av. Brasil 520');

-- EJERCICIOS PRACTICOS: Insertando datos en diferentes tablas 
INSERT INTO Alumnos (idAuxiliar, idColegiatura, codigoAlumno, nombre, paterno, materno, fechaNacimiento, domicilio)
VALUES 
(2, 1, 'A-102', 'Margarita', 'Martin', 'Sanchez', '2000-01-01', 'Av. Brasil 130'),
(3, 1, 'A-103', 'Leticia', 'Gonzalez', 'Jimenez', '2000-01-01', 'Av. Peru 237'),
(4, 1, 'A-104', 'Alberto', 'Romero', 'Navarro', '2000-01-01', 'Jr. Historia 485'),
(5, 1, 'A-105', 'Alejandro', 'Ramos', 'Gil', '2000-01-01', 'Av. Espania 333'),
(6, 1, 'A-106', 'Daniel', 'Morales', 'Blanco', '2000-01-01', 'Av. Historia 247'),
(7, 1, 'A-107', 'Felipe', 'Molina', 'Castro', '2000-01-01', 'Av. Espania 652'),
(8, 1, 'A-108', 'Antonia', 'Rubio', 'Iglesias', '2000-01-01', 'Av. Peru 742'),
(9, 1, 'A-109', 'Isabel', 'Santos', 'Garrido', '2000-01-01', 'Av. Brasil 658'),
(10, 1, 'A-110', 'Luisa', 'Lozano', 'Cruz', '2000-01-01', 'Av. Brasil 347');

SELECT * FROM Alumnos 

INSERT INTO Asignaturas (idProfesor, nombre, horaInicio, horaFin)
VALUES
(1, 'Matematica', '09:30:00', '10:30:00'),
(2, 'Ingles', '11:00:00', '13:00:00'),
(3, 'Comunicacion', '08:30:00', '09:30:00'),
(4, 'Quimica', '10:30:00', '12:30:00'),
(5, 'Ingles', '12:30:00', '14:00:00'),
(6, 'Matem�tica', '08:30:00', '09:30:00'),
(7, 'Ingles', '10:00:00', '12:00:00'),
(8, 'Comunicaci�n', '12:00:00', '14:00:00'),
(9, 'Qu�mica', '08:00:00', '09:30:00'),
(10, 'Matem�tica', '09:30:00', '11:00:00'),
(11, 'Ingles', '11:00:00', '14:00:00');

INSERT INTO Parentescos (tipo)
VALUES ('Padre'),
       ('Madre');

INSERT INTO Tutores (idParentesco, nombre, paterno, materno, telefono)
VALUES
(1, 'Manuel',   'Mondalgo',  'Guerrero', 900000001),
(2, 'Juana',    'Perez',     'Garrido',  900000002),
(1, 'Oscar',    'Mart�n',    'Cano',     900000003),
(2, 'Luz',      'S�nchez',   'Rubio',    900000004),
(1, 'Alejandro','Gonz�lez',  'Navarro',  900000005),
(2, 'Sara',     'Jimenez',   'Torres',   900000006),
(1, 'Ivan',     'Romero',    'V�zquez',  900000007),
(2, 'Nora',     'Navarro',   'Moreno',   900000008),
(1, 'Leo',      'Ramos',     'Garcia',   900000009),
(2, 'Mar',      'Mondalgo',  'Lopez',    900000010);

-- Insertando en tabla con llave foranea compuesta
INSERT INTO Profesores_Alumnos(idProfesor, idAlumno)
VALUES
(1, 2), (1, 3), (1, 4),
(2, 5), (2, 6), (2, 7),
(3, 8), (3, 9), (3, 10),
(4, 11);

INSERT INTO Calificaciones (idAsignatura, idAlumno, calificacion)
VALUES
(1, 2, 17),
(1, 3, 16),
(1, 4, 18),
(2, 2, 16),
(2, 3, 15),
(2, 4, 14),
(3, 2, 15),
(3, 3, 17),
(3, 4, 19),
(4, 2, 17),
(4, 3, 18),
(4, 4, 16);

SELECT * FROM Calificaciones;

INSERT INTO Alumnos_Tutores (idAlumno, idTutor)
VALUES
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(5, 8),
(6, 9),
(6, 10);

-- EJERCICIO PRACTICO 
CREATE TABLE dbo.Clientes (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50) NOT NULL,
    edad INT NULL,
    fechaNacimiento DATE NULL
);

-- Insertar un registro 
INSERT INTO Clientes (nombre, paterno, materno, edad, fechaNacimiento)
VALUES ('Juan', 'P�rez', 'G�mez', 28, '1997-05-12');

-- Insertar varios registros en una sola sentencia 
INSERT INTO Clientes (nombre, paterno, materno, edad, fechaNacimiento)
VALUES
('Ana',   'Ram�rez', 'L�pez',   31, '1993-03-08'),
('Luis',  'Mart�nez','Rodr�guez',25, '1999-10-21'),
('Carla', 'Garc�a',  'Morales', 22, '2002-01-30'),
('Diego', 'Santos',  'Vega',    29, '1996-07-15');



