-- Funcion
USE `barberia`;
DROP function IF EXISTS `FnPrecioValido`;

USE `barberia`;
DROP function IF EXISTS `barberia`.`FnPrecioValido`;
;

DELIMITER $$
USE `barberia`$$
CREATE FUNCTION `FnPrecioValido`(IdProd INT,
  PrecioNuevo DECIMAL(10,3)
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
  RETURN (
    SELECT COUNT(*) 
      FROM Productos
      WHERE IdProducto = IdProd
  ) = 1
  AND PrecioNuevo > 0;
END$$

DELIMITER ;
;


-- Procedimiento 
USE `barberia`;
DROP procedure IF EXISTS `InsertPrecio`;

USE `barberia`;
DROP procedure IF EXISTS `barberia`.`InsertPrecio`;
;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertPrecio`(
  IN IdProd   INT,
  IN PrecioN  DECIMAL(10,3)
)
BEGIN
  IF `FnPrecioValido`(IdProd, PrecioN) THEN
    UPDATE Productos
      SET valorUnitario = PrecioN
    WHERE IdProducto = IdProd;
  ELSE
    SIGNAL SQLSTATE "45000"
      SET MESSAGE_TEXT = "Producto no existe o precio inválido";
  END IF;
END$$

DELIMITER ;
;


-- Trigger
CREATE TABLE IF NOT EXISTS `LogCambiosPrecio` (
  IdLog       INT AUTO_INCREMENT PRIMARY KEY,
  IdProducto  INT      NOT NULL,
  PrecioAnt   DECIMAL(10,3),
  PrecioNuevo DECIMAL(10,3),
  FechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS `TrgLogPrecio`;
DELIMITER $$
CREATE TRIGGER `TrgLogPrecio`
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
  IF OLD.valorUnitario <> NEW.valorUnitario THEN
    INSERT INTO `LogCambiosPrecio`
      (IdProducto, PrecioAnt, PrecioNuevo)
    VALUES
      (OLD.IdProducto, OLD.valorUnitario, NEW.valorUnitario);
  END IF;
END$$
DELIMITER ;

-- Ejecutador Proceso2
CALL InsertPrecio(2, 18.500);
CALL InsertPrecio (4,35.000);

SELECT * FROM Productos WHERE IdProducto = 2;
SELECT * FROM LogCambiosPrecio WHERE IdProducto = 2 ORDER BY FechaCambio DESC;

