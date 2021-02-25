DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS mostrarCodi//
CREATE PROCEDURE mostrarCodi(
    IN pe_codi smallint
) BEGIN
 DECLARE codi_actor smallint unsigned;
  SELECT id_actor
  INTO @codi_actor
  FROM ACTORS_PELLICULES
  WHERE ACTORS_PELLICULES.id_peli=pe_codi AND ACTORS_PELLICULES.principal=1;
END //
DELIMITER ;
call mostrarCodi(6);
SELECT @codi_actor;