-- Funcin
USE `barberia`;
DROP function IF EXISTS `EstaDisponible`;

USE `barberia`;
DROP function IF EXISTS `barberia`.`EstaDisponible`;
;

DELIMITER $$
USE `barberia`$$
CREATE FUNCTION `EstaDisponible`(Fecha DATETIME,
  IdPers INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
  RETURN (
    SELECT COUNT(*) 
      FROM Agendamiento
      WHERE fechaAgendamiento = Fecha
        AND FKidPersonal = IdPers
  ) = 0;
END$$

DELIMITER ;
;

-- Procedimiento
USE `barberia`;
DROP procedure IF EXISTS `InsertCita`;

USE `barberia`;
DROP procedure IF EXISTS `barberia`.`InsertCita`;
;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertCita`(
  IN FechaC DATETIME,
  IN FkPers INT(10),
  IN FkServ INT(10),
  IN FkCli INT(10)
)
BEGIN
  IF EstaDisponible(FechaC, FkPers) THEN
    INSERT INTO Agendamiento
      (fechaAgendamiento, FKidPersonal, FKidServicios, FKidClientes)
    VALUES
      (FechaC, FkPers, FkServ, FkCli);
  ELSE
    SIGNAL SQLSTATE "45000"
      SET MESSAGE_TEXT = "Horario no disponible";
  END IF;
END$$

DELIMITER ;
;


-- Trigger
CREATE TABLE IF NOT EXISTS NotificacionesCita (
  IdNotif   INT AUTO_INCREMENT PRIMARY KEY,
  IdCliente INT,
  Mensaje   VARCHAR(200),
  FechaEnv  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS `NotifCita`;
DELIMITER $$
CREATE TRIGGER `NotifCita`
AFTER INSERT ON Agendamiento
FOR EACH ROW
BEGIN
  INSERT INTO NotificacionesCita
    (IdCliente, Mensaje)
  VALUES
    (
      NEW.FKidClientes,
      CONCAT(
        "Cita programada ", 
        DATE_FORMAT(NEW.fechaAgendamiento, '%Y-%m-%d %H:%i'),
        " con personal ", NEW.FKidPersonal
      )
    );
END$$
DELIMITER ;










