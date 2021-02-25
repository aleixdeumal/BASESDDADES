USE empresa;
-- Modifiquem el delimitador de sentències a //
DELIMITER //
/* Procedim a esborrar el procediment que volem
* crear per assegurar-nos que el creem des de zero. */
DROP PROCEDURE IF EXISTS sp05_SumaSous//
/* Procedim a crear el nou procediment amb la
* clàusula CREATE PROCEDURE seguida del nom del procediment
* i la definició de paràmetres si cal. En aquest cas no cal. */
CREATE PROCEDURE sp05_SumaSous()
-- La clàusula BEGIN indica l'inici del procediment.
 BEGIN
-- A partir d'aquí desenvolupem el procediment en si.
-- Declaració de variables
DECLARE suma float;
DECLARE sumafutura float DEFAULT 0;
-- Inicialització de variables
SET suma = 0;
-- Primera sentència SQL amb la que obtenim la suma
-- dels sous de tots els treballadors.
SELECT SUM(SOU_TREB) INTO suma
FROM TREBALLADORS;
-- Segona sentència SQL amb la que creem una cadena amb
-- el text "Suma de sous actuals: " i la suma dels sous
-- de tots els treballadors, que hem obtingut abans. I
-- a més a més li assignem l'alias Actual.
SELECT CONCAT("Suma de sous actuals: ",
suma)
AS Actual;
-- Tercera sentència SQL amb la que obtenim el valor que
-- ens demanen, la suma dels sous de tots els treballadors
-- amb un augment del 3%. I el resultat l'assignem a la
-- variable @sumafutura.
SET @sumafutura = suma * 1.03;
-- Quarta sentència SQL amb la que creem una cadena amb
-- el text "Suma de sous amb l'augment: " i la suma dels sous
-- de tots els treballadors amb l'augment del 3%, que hem
-- obtingut abans. I a més a més li assignem l'alias Futur.
SELECT CONCAT("Suma de sous amb l'augment: ",
@sumafutura)
AS Futur;
-- La clàusula END indica el final del procediment.
END //
-- Modifiquem el delimitador de sentències a l'estàndard que és ;
DELIMITER ;
