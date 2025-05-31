-- Ejecutadores
CALL InsertReservaCompleta(1,1,"2025-06-16","2025-06-21");
CALL InsertReservaCompleta(2,2,"2025-07-20","2025-07-24");
CALL InsertReservaCompleta(3,4,"2025-09-17","2025-09-25");
CALL InsertReservaCompleta(4,3,"2025-05-30","2025-06-2");

SELECT * FROM clientes;
SELECT * FROM habitaciones;
SELECT * FROM Reservas;
SELECT * FROM lasReservas;