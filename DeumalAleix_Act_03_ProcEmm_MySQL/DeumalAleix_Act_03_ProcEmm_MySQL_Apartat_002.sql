DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS peliculasMesRecaptacio //
CREATE PROCEDURE peliculasMesRecaptacio()
BEGIN
DECLARE codi_peli smallint unsigned;
SELECT id_peli
INTO @codi_peli
FROM   PELLICULES
WHERE  recaudacio_peli = ( SELECT max(recaudacio_peli)
FROM   PELLICULES );
END // 
DELIMITER ;
call peliculasMesRecaptacio();
SELECT @codi_peli;