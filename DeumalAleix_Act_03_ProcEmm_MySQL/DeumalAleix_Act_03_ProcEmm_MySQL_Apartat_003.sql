DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS peliMesRecaptacioTitol //
CREATE PROCEDURE peliMesRecaptacioTitol()
BEGIN
DECLARE titol smallint unsigned;
DECLARE recaudacio smallint unsigned;
SELECT titol_peli, recaudacio_peli
INTO @titol, @recaudacio
FROM   PELLICULES
WHERE  recaudacio_peli = ( SELECT max(recaudacio_peli)
FROM   PELLICULES );
END // 
DELIMITER ;
call peliMesRecaptacioTitol();
SELECT @titol, @recaudacio; 