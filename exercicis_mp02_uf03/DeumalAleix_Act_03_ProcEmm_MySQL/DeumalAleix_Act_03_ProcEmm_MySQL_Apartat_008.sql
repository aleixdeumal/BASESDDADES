DELIMITER // 
USE videoclub //
DROP PROCEDURE IF EXISTS retornarRentabilitat08 //
CREATE PROCEDURE retornarRentabilitat08()
BEGIN

    DECLARE recp bigint unsigned;
    DECLARE pres bigint unsigned;
    DECLARE titolpeli varchar(40);
    DECLARE nivell varchar(20);

    DECLARE final int DEFAULT 0;

    DECLARE elcursor CURSOR FOR
    SELECT recaudacio_peli, pressupost_peli, titol_peli
    FROM PELLICULES;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final = 1; -- True

    OPEN elcursor;
    repeticioPerPelicules:LOOP

        FETCH elcursor INTO recp, pres, titolpeli;
        IF final =1 THEN
            LEAVE repeticioPerPelicules;
        END IF;
        IF recp < pres  THEN
            SET nivell ="Deficiari";
            ELSEIF recp < pres*2 THEN
            SET nivell ="Suficient";
            ELSEIF recp*2 > pres THEN
            SET nivell ="Bona";
        END IF;
        SELECT  concat('la peli ', @titolpeli, 'es ', @nivell);
    END LOOP repeticioPerPelicules;
CLOSE elcursor;
END //
DELIMITER ;
-- CALL retornarRentabilitat08();