  DELIMITER // 
  USE videoclub //
  DROP PROCEDURE IF EXISTS retornarRentabilitat //
  CREATE PROCEDURE retornarRentabilitat(
      IN pe_codi smallint,
      OUT nivell varchar(20)
      ) BEGIN

  DECLARE recp bigint unsigned;
  DECLARE pres bigint unsigned;
  DECLARE titolpeli varchar(40);


    SELECT recaudacio_peli,pressupost_peli, titol_peli
    INTO recp, pres, titolpeli
    FROM  PELLICULES
    WHERE id_peli=pe_codi;
    IF recp < pres  THEN
      SET nivell ="Deficiari";
      ELSEIF recp < pres*2 THEN
        SET nivell ="Suficient";
        ELSEIF recp*2 > pres THEN
      SET nivell ="Bona";
    END IF;
  SELECT  concat('la peli ', @titolpeli, 'es ',@misco);
  END //
  DELIMITER ;
  -- CALL retornarRentabilitat(1, @misco);

