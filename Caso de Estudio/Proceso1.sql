-- Funcion
USE `hotel`;
DROP function IF EXISTS `CalcularPrecio`;

USE `hotel`;
DROP function IF EXISTS `hotel`.`CalcularPrecio`;
;

DELIMITER $$
USE `hotel`$$
CREATE FUNCTION `CalcularPrecio`(IdHab INT,
  FechaIni DATE,
  FechaFin DATE
) RETURNS decimal(10,3)
    DETERMINISTIC
BEGIN
  DECLARE PrecioBase DECIMAL(10,3);
  DECLARE Dias INT;
  DECLARE DiasAnticipacion INT;
  DECLARE SubTotal DECIMAL(10,3);
  DECLARE Total DECIMAL(10,3);

  SELECT Precio INTO PrecioBase
    FROM Habitaciones
    WHERE IdHabitacion = IdHab
    LIMIT 1;

  SET Dias = DATEDIFF(FechaFin, FechaIni);
  SET SubTotal = PrecioBase * Dias;
  SET DiasAnticipacion = DATEDIFF(FechaIni, CURDATE());

  IF DiasAnticipacion >= 15 THEN
    SET Total = SubTotal * 0.90; 
  ELSE
    SET Total = SubTotal;
  END IF;

  RETURN Total;
END$$

DELIMITER ;
;

-- Procedimiento
USE `hotel`;
DROP procedure IF EXISTS `InsertReservaCompleta`;

USE `hotel`;
DROP procedure IF EXISTS `hotel`.`InsertReservaCompleta`;
;

DELIMITER $$
USE `hotel`$$
CREATE PROCEDURE `InsertReservaCompleta`(
  IN IdCli   TINYINT,
  IN IdHab   TINYINT,
  IN FechaI  DATE,
  IN FechaF  DATE
)
BEGIN
  DECLARE PrecioSinDescuento DECIMAL(10,3);
  DECLARE PrecioFinal        DECIMAL(10,3);

  SET PrecioSinDescuento = (SELECT Precio * DATEDIFF(FechaF, FechaI)
                            FROM Habitaciones
                            WHERE IdHabitacion = IdHab);
  SET PrecioFinal = CalcularPrecio(IdHab, FechaI, FechaF);

  INSERT INTO Reservas (
    IdCliente, IdHabitacion, FechaInicio, FechaFin,
    PrecioBase, PrecioConDescuento
  )
  VALUES (
    IdCli, IdHab, FechaI, FechaF,
    PrecioSinDescuento, PrecioFinal
  );

  UPDATE Habitaciones
    SET Disponibilidad = "No"
    WHERE IdHabitacion = IdHab;
END$$

DELIMITER ;
;

-- Trigger
CREATE TABLE IF NOT EXISTS lasReservas (
  IdRegistro      INT AUTO_INCREMENT PRIMARY KEY,
  IdReserva  INT,
  Fecha_del_registro   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS `TrigReserva`;
DELIMITER $$
CREATE TRIGGER `TrigReserva`
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
  INSERT INTO lasReservas (IdReserva)
    VALUES (NEW.IdReserva);
END$$
DELIMITER ;