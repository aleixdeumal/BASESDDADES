USE videoclub;
DELIMITER //
CREATE PRECEDURE sp02_exerici_llistaActors()
BEGIN
SELECT nom_actor Actriu, 
        anynaix_actor "Any Naix.",
        YEAR(CURDATE())-anynaix_actor edat
FROM ACTORS
WHERE sexe_actor="home";
END //
DELIMITER ;