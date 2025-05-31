-- Ejecutador Proceso2
CALL InsertPrecio(2, 18.500);
CALL InsertPrecio (4,35.000);

SELECT * FROM Productos WHERE IdProducto = 2;
SELECT * FROM LogCambiosPrecio WHERE IdProducto = 2 ORDER BY FechaCambio DESC;