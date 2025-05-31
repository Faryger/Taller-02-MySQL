DROP DATABASE IF EXISTS Hotel;
CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE Clientes(
IdCliente TINYINT(3) AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (10) NOT NULL,
ApellidoPaterno VARCHAR(10) NOT NULL,
ApellidoMaterno VARCHAR(10) NOT NULL,
Telefono VARCHAR(15)
);

CREATE TABLE Habitaciones(
IdHabitacion TINYINT(3) AUTO_INCREMENT PRIMARY KEY,
Disponibilidad VARCHAR(10) NOT NULL,
Precio DECIMAL (10,3) NOT NULL,
Capacidad INT(2) NOT NULL
);

CREATE TABLE Reservas (
  IdReserva INT AUTO_INCREMENT PRIMARY KEY,
  IdCliente TINYINT(3),
  IdHabitacion TINYINT(3),
  FechaInicio DATE,
  FechaFin DATE,
  PrecioBase DECIMAL(10,3),
  PrecioConDescuento DECIMAL(10,3),
  FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
  FOREIGN KEY (IdHabitacion) REFERENCES Habitaciones(IdHabitacion)
);
