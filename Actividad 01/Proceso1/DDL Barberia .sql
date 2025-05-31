DROP DATABASE IF EXISTS Barberia;
CREATE DATABASE Barberia;
USE Barberia;

CREATE TABLE TipoDocumento (
  IdDocumento TINYINT(3) AUTO_INCREMENT PRIMARY KEY,
  TipoDoc VARCHAR(5) NOT NULL
);

CREATE TABLE TipoSangre (
  IdTipoSangre TINYINT(3) AUTO_INCREMENT PRIMARY KEY,
  TipoSangre VARCHAR(3) NOT NULL
);

CREATE TABLE Rol (
  IdRol INT(10) AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Personal (
  idPersonal INT(10) AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Apellido1 VARCHAR(50) NOT NULL,
  Apellido2 VARCHAR(50),
  numeroDocumento INT(10) UNIQUE,
  Telefono VARCHAR(15),
  Direccion VARCHAR(100),
  FKidTpDoc TINYINT(3) NOT NULL,
  FKidTipSangre TINYINT(3) NOT NULL,
  FKidRol INT(10) NOT NULL
);

CREATE TABLE Clientes (
  IdClientes INT(10) AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50),
  Telefono VARCHAR(15),
  numeroDocumento INT(10),
  FKidTipDoc TINYINT(3) NOT NULL,
  FKidVentas TINYINT(3) NOT NULL
);

CREATE TABLE Servicios (
  IdServicios INT(10) AUTO_INCREMENT PRIMARY KEY,
  nombreServicio VARCHAR(50) NOT NULL,
  Precio DECIMAL(10,3) NOT NULL
);

CREATE TABLE Productos (
  IdProducto INT(10) AUTO_INCREMENT PRIMARY KEY,
  tipoProducto VARCHAR(50) NOT NULL,
  valorUnitario DECIMAL(10,3) NOT NULL
);

CREATE TABLE Agendamiento (
  IdAgendamiento INT(10) AUTO_INCREMENT PRIMARY KEY,
  fechaAgendamiento TIMESTAMP NOT NULL,
  FKidPersonal INT(10) NOT NULL,
  FKidServicios INT(10) NOT NULL,
  FKidClientes INT(10) NOT NULL
);

CREATE TABLE Facturas (
  IdFacturas INT(10) AUTO_INCREMENT PRIMARY KEY,
  numFactura INT(10) NOT NULL
);

CREATE TABLE Ventas (
  IdVentas INT(10) AUTO_INCREMENT PRIMARY KEY,
  FkIdFacturas   INT(10) NOT NULL,
  FkIdProducto   INT(10) NOT NULL,
  FkIdClientes   INT(10) NOT NULL
);

CREATE TABLE DetalleVentaProducto (
  IdDetalleVentaProducto INT(10) AUTO_INCREMENT PRIMARY KEY,
  FkIdVentas    INT(10) NOT NULL,
  FkIdProducto  INT(10) NOT NULL
);

CREATE TABLE DetalleVentaServicio (
  IdDetalleVentaServicio INT(10) AUTO_INCREMENT PRIMARY KEY,
  FkIdVentas    INT(10) NOT NULL,
  FKidServicios INT(10) NOT NULL
);

-- Claves foráneas al final
ALTER TABLE Personal
  ADD FOREIGN KEY (FKidTpDoc)     REFERENCES TipoDocumento (IdDocumento),
  ADD FOREIGN KEY (FKidTipSangre) REFERENCES TipoSangre   (IdTipoSangre),
  ADD FOREIGN KEY (FKidRol)       REFERENCES Rol          (IdRol);

ALTER TABLE Clientes
  ADD FOREIGN KEY (FKidTipDoc) REFERENCES TipoDocumento (IdDocumento);
  

ALTER TABLE Agendamiento
  ADD FOREIGN KEY (FKidPersonal)  REFERENCES Personal   (idPersonal),
  ADD FOREIGN KEY (FKidServicios) REFERENCES Servicios   (IdServicios),
  ADD FOREIGN KEY (FKidClientes)  REFERENCES Clientes    (IdClientes);

ALTER TABLE Ventas
  ADD FOREIGN KEY (FkIdFacturas)  REFERENCES Facturas    (IdFacturas),
  ADD FOREIGN KEY (FkIdProducto)  REFERENCES Productos   (IdProducto),
  ADD FOREIGN KEY (FkIdClientes)  REFERENCES Clientes    (IdClientes);

ALTER TABLE DetalleVentaProducto
  ADD FOREIGN KEY (FkIdVentas)    REFERENCES Ventas      (IdVentas),
  ADD FOREIGN KEY (FkIdProducto)  REFERENCES Productos   (IdProducto);

ALTER TABLE DetalleVentaServicio
  ADD FOREIGN KEY (FkIdVentas)    REFERENCES Ventas      (IdVentas),
  ADD FOREIGN KEY (FKidServicios) REFERENCES Servicios   (IdServicios);
 

