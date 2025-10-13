CREATE DATABASE Escuela;
GO
USE Escuela;

-- Creando tablas 
CREATE TABLE Profesores(
idProfesor int identity(1,1) primary key not null,
nombre varchar(50),
paterno varchar(50),
materno varchar(50),
fechaNacimiento date,
domicilio varchar(50),
telefono int,
email varchar(50)
);

CREATE TABLE Auxiliares(
idAuxiliar int identity(1,1) primary key not null,
nombre varchar(50),
paterno varchar(50),
materno varchar(50),
telefono int
);

CREATE TABLE Asignaturas(
idAsignatura int identity(1,1) primary key not null,
idProfesor int not null references Profesores(idProfesor),
nombre varchar(50),
horaInicio time(7),
horaFin time(7)
);

CREATE TABLE Colegiatura(
idColegiatura int identity(1,1) primary key not null,
monto decimal(7,2),
fecha datetime,
estado int
);

-- Renombrar una tabla en SQL Server 
EXEC sp_rename 'Colegiatura', 'Colegiaturas';

CREATE TABLE Alumnos(
idAlumno int identity(1,1) primary key not null,
idAuxiliar int not null,
idColegiatura int not null,
codigoAlumno varchar(50),
nombre varchar(50),
paterno varchar(50),
materno varchar(50),
fechaNacimiento date,
domicilio varchar(50)
);

-- Agregando llave foranea con Alter table  
ALTER TABLE Alumnos
ADD CONSTRAINT fk_alumno_auxiliar
FOREIGN KEY (idAuxiliar)
REFERENCES Auxiliares (idAuxiliar);

ALTER TABLE Alumnos
ADD CONSTRAINT fk_alumno_colegiatura
FOREIGN KEY (idColegiatura)
REFERENCES Colegiatura (idColegiatura);

-- Llave primaria compuesta N:N
CREATE TABLE Profesores_Alumnos(
idProfesor int not null,
idAlumno int not null,
PRIMARY KEY (idProfesor, idAlumno),
FOREIGN KEY (idProfesor) REFERENCES Profesores(idProfesor),
FOREIGN KEY (idAlumno) REFERENCES Alumnos(idAlumno)
);

EXEC sp_rename 'Proferores_Alumnos', 'Profesores_Alumnos';

CREATE TABLE Calificaciones(
idAsignatura int not null,
idAlumno int not null,
PRIMARY KEY (idAsignatura, idAlumno),
FOREIGN KEY (idAsignatura) REFERENCES Asignaturas(idAsignatura),
FOREIGN KEY (idAlumno) REFERENCES Alumnos(idAlumno)
);

ALTER TABLE Calificaciones
ADD calificacion int;

CREATE TABLE Parentescos(
idParentesco int not null primary key identity(1,1),
tipo varchar(50)
);

CREATE TABLE Tutores(
idTutor int not null primary key identity(1,1),
idParentesco int not null references Parentescos(idParentesco),
nombre varchar(50),
paterno varchar(50),
materno varchar(50),
telefono int
);

CREATE TABLE Alumnos_Tutores(
idAlumno int not null,
idTutor int not null,
PRIMARY KEY (idAlumno, idTutor),
FOREIGN KEY (idAlumno) REFERENCES Alumnos(idAlumno),
FOREIGN KEY (idTutor) REFERENCES Tutores(idTutor)
);




