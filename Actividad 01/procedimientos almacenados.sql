USE `barberia`;
DROP procedure IF EXISTS `InsertTipDocum`;

USE `barberia`;
DROP procedure IF EXISTS `barberia`.`InsertTipDocum`;
;

DELIMITER $$
USE `barberia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTipDocum`(
IN Tipdo VARCHAR(5)
)
BEGIN
INSERT INTO tipodocumento (TipoDoc) VALUES (Tipdo);
END$$

DELIMITER ;
;

USE `barberia`;
DROP procedure IF EXISTS `InsertRH`;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertRH` (
IN RH VARCHAR (5))
BEGIN
INSERT INTO tiposangre (TipoSangre) VALUES (RH);
END$$

DELIMITER ;

USE `barberia`;
DROP procedure IF EXISTS `InsertRol`;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertRol` (
IN NewRol VARCHAR(30))
BEGIN
INSERT INTO rol (Nombre) VALUES (NewRol);
END$$

DELIMITER ;

USE `barberia`;
DROP procedure IF EXISTS `InsertSer`;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertSer` (
IN NomSer VARCHAR (50),
IN Prec DECIMAL (10,3))
BEGIN
INSERT INTO servicios (nombreServicio,Precio) VALUES (NomSer,Prec);
END$$

DELIMITER ;

USE `barberia`;
DROP procedure IF EXISTS `InsertProduct`;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertProduct` (
IN NomP VARCHAR (50),PrecP DECIMAL(10,3))
BEGIN
INSERT INTO productos (tipoProducto,valorUnitario) VALUES (NomP,PrecP);
END$$

DELIMITER ;


USE `barberia`;
DROP procedure IF EXISTS `InsertPer`;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertPer` (
IN Nom VARCHAR (50),Ap1 VARCHAR (50),Ap2 VARCHAR (50),numdoc INT(10),Tel VARCHAR (10),Dire VARCHAR (100),fkdoc TINYINT(3),fkrh TINYINT(3),fkrol INT (10))
BEGIN
INSERT INTO personal (Nombre,Apellido1,Apellido2,numeroDocumento,Telefono,Direccion,FKidTpDoc,FKidTipSangre,FkidRol) 
VALUES (nom,Ap1,Ap2,numdoc,Tel,Dire,fkdoc,fkrh,fkrol);
END$$

DELIMITER ;

USE `barberia`;
DROP procedure IF EXISTS `InsertCl`;

DELIMITER $$
USE `barberia`$$
CREATE PROCEDURE `InsertCl` (
IN NomCl VARCHAR(50),ApeCl VARCHAR(50),TelCl VARCHAR(15),DocCl INT(10),FkDocCl TINYINT(3),FkVentCl TINYINT(3))
BEGIN
INSERT INTO clientes (Nombre,Apellido,Telefono,numeroDocumento,FKidTipDoc,FKidVentas) VALUES (NomCL,ApeCl,TelCl,DocCL,FkDocCl,FkVentCl);
END$$

DELIMITER ;


USE barberia;
DROP procedure IF EXISTS InsertFac;

DELIMITER $$
USE barberia$$
CREATE PROCEDURE InsertFac (
IN num INT(10))
BEGIN
INSERT INTO facturas (numFactura) VALUES (num);
END$$

DELIMITER ;


USE barberia;
DROP procedure IF EXISTS InsertVen;

DELIMITER $$
USE barberia$$
CREATE PROCEDURE InsertVen (
IN fkfac INT(10),fkproduct INT(10),fkclient INT(10))
BEGIN
INSERT INTO ventas (FkIdFacturas,FkIdProducto,FkIdClientes) VALUES (fkfac,fkproduct,fkclient);
END$$

DELIMITER ;


USE barberia;
DROP procedure IF EXISTS InsertdetVP;

DELIMITER $$
USE barberia$$
CREATE PROCEDURE InsertdetVP (
IN fkventa INT(10),fkproducto INT(10))
BEGIN
INSERT INTO detalleventaproducto (FkIdVentas,FkIdProducto) VALUES (fkventa,fkproducto);
END$$

DELIMITER ;


USE barberia;
DROP procedure IF EXISTS InsertdetVS;

DELIMITER $$
USE barberia$$
CREATE PROCEDURE InsertdetVS (
IN fkventas INT(10),fkservicios INT(10))
BEGIN
INSERT INTO detalleventaservicio (FkIdVentas,FkIdServicios) VALUES (fkventas,fkservicios);
END$$

DELIMITER ;


USE barberia;
DROP procedure IF EXISTS InsertCita;

DELIMITER $$
USE barberia$$
CREATE PROCEDURE InsertCita (
IN fecha DATETIME,fkidPersonal INT(10),fkidServicio INT(10),fkidCliente INT(10))
BEGIN
INSERT INTO Agendamiento (fechaAgendamiento,FKidPersonal,FKidServicios,FKidClientes) VALUES (fecha,fkidPersonal,fkidServicio,fkidCliente);
END$$

DELIMITER ;







