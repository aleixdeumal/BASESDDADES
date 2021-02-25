DELIMITER //
USE videoclub //
DROP PROCEDURE IF EXISTS NomEdatActorPrincipal //
CREATE PROCEDURE NomEdatActorPrincipal(
    IN pe_codi smallint
) BEGIN
DECLARE nomCognom varchar(30);
DECLARE edat smallint(5) unsigned;
SELECT nom_actor, YEAR(CURDATE())-anynaix_actor
INTO @nomCognom, @edat
FROM ACTORS_PELLICULES
INNER JOIN ACTORS
ON ACTORS.id_actor=ACTORS_PELLICULES.id_actor
WHERE ACTORS_PELLICULES.id_peli=pe_codi AND ACTORS_PELLICULES.principal=1;
END //
DELIMITER ;
CALL NomEdatActorPrincipal(3);
SELECT @nomCognom, @edat;