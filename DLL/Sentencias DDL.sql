-- Sentencias DDL
-- DDL Data Definition Language (Lenguaje de definicion de datos)
-- Permite crear, modificar y eliminar objetos de la base de datos

/*
	CREATE, ALTER, DROP, TRUNCATE
*/


-------------------------------------------------
-- SECCION 1: CREACION DE BASES DE DATOS
-------------------------------------------------
CREATE DATABASE testDB
GO

CREATE DATABASE EmpresaX
ON
(
	NAME = EmpresaX_dat,
	FILENAME = 'C:\Master_SQL\EmpresaX_dat.mdf',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB
)
LOG ON 
(
	NAME = EmpresaX_log,
	FILENAME = 'C:\Master_SQL\EmpresaX_log.ldf',
	SIZE = 10MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB
)
GO


-------------------------------------------------
-- SECCION 2: CREACION DE ESQUEMAS
-------------------------------------------------
USE EmpresaX
GO

CREATE SCHEMA Persona
GO

CREATE SCHEMA Servicio
GO

CREATE SCHEMA Propiedad
GO


-------------------------------------------------
-- SECCION 3: CREACION DE TABLAS BASICAS
-------------------------------------------------
CREATE TABLE Persona.Empleado(
	nombre VARCHAR(100),
	apellido VARCHAR(100),
	cargo VARCHAR(100),
	telefono VARCHAR(100),
	email VARCHAR(100)
);
GO


-------------------------------------------------
-- SECCION 4: MODIFICACIONES CON ALTER TABLE
-------------------------------------------------

-- Eliminar una columna de la tabla
ALTER TABLE Persona.Empleado 
DROP COLUMN email
GO

-- Modificar el tipo de dato de una columna
ALTER TABLE Persona.Empleado
ALTER COLUMN nombre VARCHAR(50)
GO

-- Agregar un campo a la tabla
ALTER TABLE Persona.Empleado
ADD idEmpleado INT NOT NULL
GO

-- Establecer campo como clave primaria
ALTER TABLE Persona.Empleado
ADD PRIMARY KEY (idEmpleado)
GO

-- Eliminar clave primaria
ALTER TABLE Persona.Empleado 
DROP CONSTRAINT PK__Empleado__5295297C12F9A159
GO

-- Eliminar el campo idEmpleado
ALTER TABLE Persona.Empleado
DROP COLUMN idEmpleado
GO

-- Crear idEmpleado con propiedad identity y como clave primaria
ALTER TABLE Persona.Empleado
ADD idEmpleado INT IDENTITY(1,1) PRIMARY KEY
GO


-------------------------------------------------
-- SECCION 5: CREACION DE TABLAS POR ESQUEMA
-------------------------------------------------

-- Tabla Clientes
CREATE TABLE Persona.Clientes(
    idCliente       INT PRIMARY KEY IDENTITY(1,1),
    nombre          VARCHAR(50),
    paterno         VARCHAR(50),
    materno         VARCHAR(50),
    telefono        VARCHAR(50),
    email           VARCHAR(50)
);
GO

-- Tabla Propietarios
CREATE TABLE Persona.Propietarios (
	idPropietario INT IDENTITY(1,1) PRIMARY KEY,
	nombre        VARCHAR(50),
	paterno       VARCHAR(50),
	materno       VARCHAR(50),
	direccion     VARCHAR(50),
	telefono      VARCHAR(50),
	email         VARCHAR(50)
);
GO


-- Tabla Departamentos
CREATE TABLE Propiedad.Departamentos(
	idDepartamento     INT PRIMARY KEY,
	idPropietario      INT,
	direccion          VARCHAR(50),
	ciudad             VARCHAR(50),
	provincia          VARCHAR(50),
	codigoPostal       VARCHAR(50),
	numeroHabitacion   INT,
	numeroSanitario    INT,
	pagoMensual        DECIMAL(7,2)
);
GO

ALTER TABLE Propiedad.Departamentos
ADD FOREIGN KEY (idPropietario)
REFERENCES Persona.Propietarios(idPropietario)
ON UPDATE CASCADE
ON DELETE CASCADE;
GO


-- Tabla Contratos
CREATE TABLE Servicio.Contratos(
	idContrato       INT PRIMARY KEY,
	idCliente        INT FOREIGN KEY REFERENCES Persona.Clientes(idCliente)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	idDepartamento   INT FOREIGN KEY REFERENCES Propiedad.Departamentos(idDepartamento)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	fechaInicio      DATE,
	fechaFin         DATE,
	montoMensual     DECIMAL(7,2),
	condicion        VARCHAR(100)
);
GO


-- Tabla Mantenimientos
CREATE TABLE Servicio.Mantenimientos(
	idMantenimiento   INT PRIMARY KEY,
	idDepartamento    INT FOREIGN KEY REFERENCES Propiedad.Departamentos(idDepartamento)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	idEmpleado        INT FOREIGN KEY REFERENCES Persona.Empleado(idEmpleado)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	fecha             DATE,
	descripcion       VARCHAR(100),
	costo             DECIMAL(7,2)
);
GO


-- Tabla Pagos
CREATE TABLE Servicio.Pagos(
	idPago        INT PRIMARY KEY,
	idContrato    INT FOREIGN KEY REFERENCES Servicio.Contratos(idContrato)
						ON DELETE CASCADE
						ON UPDATE CASCADE,
	fechaPago     DATE,
	monto         DECIMAL(7,2),
	metodoPago    VARCHAR(50)
);
GO


-------------------------------------------------
-- SECCION 6: ELIMINAR TABLAS Y CLAVES
-------------------------------------------------
USE Escuela;
GO

DROP TABLE Profesores;
DROP TABLE Profesores_Alumnos;
DROP TABLE Alumnos_Tutores;
GO

-- Eliminar una clave foranea
ALTER TABLE Tutores 
DROP CONSTRAINT FK__Tutores__idParen__534D60F1
GO


-------------------------------------------------
-- SECCION 7: ELIMINAR BASE DE DATOS
-------------------------------------------------
USE master;
GO

DROP DATABASE Escuela;
GO


-------------------------------------------------
-- SECCION 8: EJEMPLO DE TRUNCATE
-------------------------------------------------

-- TRUNCATE elimina todos los registros de una tabla,
-- pero conserva la estructura para volver a insertar datos.

USE EmpresaX;
GO

TRUNCATE TABLE Servicio.Pagos;
GO
