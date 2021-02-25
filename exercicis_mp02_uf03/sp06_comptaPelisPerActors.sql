USE videoclub;
-- Modifiquem el delimitador de sentències a //
DELIMITER //
/* Procedim a esborrar el procediment que volem
* crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp06_comptaPelisPerActors//
/* Procedim a crear el nou procediment amb la
* clàusula CREATE PROCEDURE seguida del nom del procediment
* i la definició de paràmetres si cal.*/
BEGIN
-- A partir d'aquí desenvolupem el procediment en si.
/* Procedim a crear el nou procediment amb la
** clàusula CREATE PROCEDURE seguida del nom del procediment
** i la definició de paràmetres si cal. En aquest cas
** creem un paràmetre d'entrada (IN) que anomenem
** p_nomActor que és el tipus varchar(30). */
CREATE PROCEDURE sp06_comptaPelisPerActors(
IN p_nomActor varchar(30))
-- La clàusula BEGIN indica l'inici del procediment.
BEGIN
-- A partir d'aquí desenvolupem el procediment en si.
-- Declaració de variables.
DECLARE codi_Actor smallint;
DECLARE qtat_Pelis smallint;
/* Primera sentència SQL amb la que obtenim el nom de l'actor
** fent servir el parametre p_nomActorque ens han passat.
** I el guardem a la variable codi_Actor que hem declarat. */
SELECT id_actor INTO codi_Actor
FROM ACTORS
WHERE nom_actor = p_nomActor;
/* Segona sentència SQL amb la que comptem la quantitat
** de registres que hi ha a la taula ACTORS_PELLICULES
** que tenen l'id_actor. Fent servir en el filtre (WHERE)
** el parametre codi_Actor que hem guardat. D'aquesta
** manera comptarem només les pel·lícules del "nostre" actor. */
SELECT COUNT(id_peli) INTO qtat_Pelis
FROM ACTORS_PELLICULES
WHERE id_actor=codi_Actor;
SELECT CONCAT( "L'actor " , p_nomActor , " ha fet ",
qtat_Pelis, " pelicules!") AS Pel·lícules;
-- La clàusula END indica el final del procediment.
END //
-- Modifiquem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;

