USE `hotel`;
DROP procedure IF EXISTS `InsertClient`;

DELIMITER $$
USE `hotel`$$
CREATE PROCEDURE `InsertClient` (
IN Nom VARCHAR(10),Ape1 VARCHAR (10),Ape2 VARCHAR (10),tel VARCHAR (15))
BEGIN
INSERT INTO clientes (Nombre,ApellidoPaterno,ApellidoMaterno,Telefono) VALUES (Nom,Ape1,Ape2,tel);
END$$

DELIMITER ;

USE `hotel`;
DROP procedure IF EXISTS `InsertHab`;

DELIMITER $$
USE `hotel`$$
CREATE PROCEDURE `InsertHab` (
IN Dis VARCHAR (10),Pre DECIMAL (10,3),Capac INT (2))
BEGIN
INSERT INTO habitaciones (Disponibilidad,Precio,Capacidad) VALUES (Dis,Pre,Capac);
END$$

DELIMITER ;


DROP PROCEDURE IF EXISTS `InsertReserva`;
DELIMITER $$
CREATE PROCEDURE `InsertReserva`(
  IN IdCli TINYINT(3),
  IN IdHab TINYINT(3),
  IN FechaIni DATE,
  IN FechaFin DATE
)
BEGIN
  DECLARE PrecioBase DECIMAL(10,3);
  DECLARE PrecioFinal DECIMAL(10,3);
  DECLARE Dias INT;
  DECLARE DiasAnticipacion INT;

  -- 1.1) Obtener precio base
  SELECT Precio INTO PrecioBase
    FROM Habitaciones
    WHERE IdHabitacion = IdHab
    LIMIT 1;
    END$$
