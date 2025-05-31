-- Ejecutador Proceso1
CALL InsertCita("2025-10-01 14:00:00",1,6,2);

SELECT IdNotif, IdCliente, Mensaje, FechaEnv FROM NotificacionesCita ORDER BY FechaEnv DESC;
SELECT Mensaje FROM NotificacionesCita ORDER BY IdNotif DESC LIMIT 1;
