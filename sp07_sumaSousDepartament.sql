/* Modifiquem el delimitador de sentències a // */
DELIMITER //
* Canviem a la base de dades empresa per
** assegurar-nos que és la base de dades seleccionada. */
USE empresa//
/* Procedim a esborrar el procediment que volem
** crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp07_sumaSousDepartament//
/* Procedim a crear el nou procediment amb la
** clàusula CREATE PROCEDURE seguida del nom del procediment
** i la definició de paràmetres si cal. En aquest cas
** creem un paràmetre d'entrada(IN) que anomenem
** pi_num_dept que és el tipus smallint i
** creem un paràmetre de sortida (OUT) que anomenem
** po_suma. */
CREATE PROCEDURE sp07_sumaSousDepartament(
 IN pi_num_dept smallint,
 OUT po_suma float)
-- La clàusula BEGIN indica l'inici del procediment.
BEGIN
-- A partir d'aquí desenvolupem el procediment en si.
-- Declaració de variables. Si cal.
 SELECT SUM(SOU_TREB)
 INTO po_suma
 FROM TREBALLADORS
 WHERE CODI_DEP_TREB=pi_num_dept;
-- La clàusula END indica el final del procediment.
 END //
-- Tornem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;