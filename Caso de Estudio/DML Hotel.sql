CALL InsertClient ("Alejandro","Moreno","Amaya","3148774692");
CALL InsertClient("María","Gómez","Hernández","3101234567");
CALL InsertClient("Jorge","Ramírez","Sánchez","3127654321");
CALL InsertClient("Andrea","López","Castillo","3009876543");

CALL InsertHab ("Si",180.000,2);
CALL InsertHab("Si",90.000,1);
CALL InsertHab("Si",260.000,3);
CALL InsertHab("Si",300.000,4);

-- Ejecutadores
CALL InsertReservaCompleta(1,1,"2025-06-16","2025-06-21");
CALL InsertReservaCompleta(2,2,"2025-07-20","2025-07-24");
CALL InsertReservaCompleta(3,4,"2025-09-17","2025-09-25");
CALL InsertReservaCompleta(4,3,"2025-05-30","2025-06-2");

SELECT * FROM clientes;
SELECT * FROM habitaciones;
SELECT * FROM Reservas;
SELECT * FROM lasReservas;