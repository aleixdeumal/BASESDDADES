# Correcció exercicis

Revisió dels exercicis de la **unitat formativa 3** del **mòdul professional 2**.

|Enunciat|Fitxer|Comentari|Nota|
|--------|------|---------|----|
|**Enunciat 9**|[Act09.sql](https://github.com/aleixdeumal/exercicis_mp02_uf03/blob/master/exercicis_mp02_uf03/DeumalAleix_Act_03_ProcEmm_MySQL/DeumalAleix_Act_03_ProcEmm_MySQL_Apartat_009.sql)|?????|?????|
|**Enunciat 11**|[Act11.sql](https://github.com/aleixdeumal/exercicis_mp02_uf03/blob/master/exercicis_mp02_uf03/DeumalAleix_Act_03_ProcEmm_MySQL/DeumalAleix_Act_03_ProcEmm_MySQL_Apartat_011.sql)|????|?????|
|**Enunciat 12**|[Act12.sql](https://github.com/aleixdeumal/exercicis_mp02_uf03/blob/master/exercicis_mp02_uf03/DeumalAleix_Act_03_ProcEmm_MySQL/DeumalAleix_Act_03_ProcEmm_MySQL_Apartat_012.sql)|?????|?????|
|**Enunciat 13**|?????|?????|?????|


# Exemple de correcció

Cal que ompliu el fitxer **```README.md```** del vostre repositori amb la següent informació per a cadascun dels enunciats.

# **Enunciat 8**:

## Emprant l’**activitat 6**, dissenya un cursor que llisti els mateixos camps per a totes les pel·lícules.

**1. Enllaç al fitxer**

[Act08.sql](https://github.com/joanpardogine/exercicis_mp02_uf03/blob/master/Cursors/Act08.sql)

**2. Contingut del fitxer**

```sql
use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;
      
      if final = 1 then
         leave elbucle;
      end if;
      
      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      
      select titol, rendibilitat;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

-- call act8();
```

**3. Sortida de la creació del procediment**
```sql
mysql> use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act8;
Query OK, 0 rows affected (1.69 sec)

mysql> delimiter //
mysql> create procedure act8()
    -> begin
    ->    declare recaptat bigint default 0;
    ->    declare pressu bigint default 0;
    ->    declare titol varchar(40);
    ->    declare rendibilitat varchar(15);
    ->    declare final int default false;
    ->    
    ->    declare elcursor cursor for
    ->       select titol_peli, recaudacio_peli, pressupost_peli
    ->       from PELLICULES;
    -> 
    ->    declare continue handler for not found set final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into titol, recaptat, pressu;
    ->       
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->       
    ->       if (pressu>recaptat) then
    ->          set rendibilitat = "Deficitari";
    ->       elseif (pressu*2 > recaptat) then
    ->          set rendibilitat = "Suficient";
    ->       else
    ->          set rendibilitat = "Bona";
    ->       end if;
    ->       
    ->       select titol, rendibilitat;
    ->    
    ->    end loop elbucle; 
    ->    close elcursor;
    -> end//
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> delimiter ;
mysql> 
```

**4. Sortida de l'execució del procediment**
```sql
mysql> call act8();
+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA BUSQUEDA | Suficient    |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA TERMINAL | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| Mar adentro | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-----------+--------------+
| titol     | rendibilitat |
+-----------+--------------+
| Colateral | Bona         |
+-----------+--------------+
1 row in set (0.00 sec)

+--------------------+--------------+
| titol              | rendibilitat |
+--------------------+--------------+
| Los 4 fantásticos  | Suficient    |
+--------------------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Sin City | Suficient    |
+----------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| IRON MAN | Bona         |
+----------+--------------+
1 row in set (0.00 sec)

+----------------+--------------+
| titol          | rendibilitat |
+----------------+--------------+
| Los Vengadores | Bona         |
+----------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| Los Vengadores: La era de Ultron | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| La busqueda 2: El diario secreto | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| IRON MAN 2 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 3 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+---------------------------------------+--------------+
| titol                                 | rendibilitat |
+---------------------------------------+--------------+
| Capitán América: El primer vengador   | Bona         |
+---------------------------------------+--------------+
1 row in set (0.00 sec)

+-------------------------------------------+--------------+
| titol                                     | rendibilitat |
+-------------------------------------------+--------------+
| Capitán América: El Soldado de Invierno   | Bona         |
+-------------------------------------------+--------------+
1 row in set (0.01 sec)

+------------------------------+--------------+
| titol                        | rendibilitat |
+------------------------------+--------------+
| Capitán América: Civil War   | Bona         |
+------------------------------+--------------+
1 row in set (0.01 sec)

+-------+--------------+
| titol | rendibilitat |
+-------+--------------+
| Joker | Deficitari   |
+-------+--------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
```

---

# **Enunciat 9**:

## Emprant l’**activitat 7**, dissenya un cursor que llisti els mateixos camps per a tots els intèrprets.

**1. Enllaç al fitxer**

[Act09.sql](https://github.com/aleixdeumal/exercicis_mp02_uf03/blob/master/exercicis_mp02_uf03/DeumalAleix_Act_03_ProcEmm_MySQL/DeumalAleix_Act_03_ProcEmm_MySQL_Apartat_009.sql)

**2. Contingut del fitxer**
```sql
   DELIMITER //
DROP PROCEDURE IF EXISTS loopedat09//
CREATE PROCEDURE loopedat09()
BEGIN
   DECLARE cActor bigint default 0;
   DECLARE final int default false;

   DECLARE elcursor cursor for
      SELECT id_actor
      FROM ACTORS;

   DECLARE continue handler for not found SET final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into cActor;

      if final = 1 then
         leave elbucle;
      end if;
      SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
      /*condicio home*/
      if(sexe_actor="home",
      if(year(curdate()) - anynaix_actor<15,"nen",
      if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
      if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
      if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
      if(year(curdate()) - anynaix_actor>61, "home gran",""))))),

      /*condicio dona*/
      if(year(curdate()) - anynaix_actor<15,"nena",
      if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
      if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adulta",
      if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
      if(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
      FROM ACTORS
      WHERE ACTORS.id_actor = cActor;
   END loop elbucle;
   close elcursor;
END//

DELIMITER ;

-- call loopedat09();
```

**3. Sortida de la creació del procediment**
```sql
   mysql> use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> DELIMITER //
mysql> DROP PROCEDURE IF EXISTS loopedat09//
--------------
DROP PROCEDURE IF EXISTS loopedat09
--------------

Query OK, 0 rows affected (0.01 sec)

mysql> CREATE PROCEDURE loopedat09()
    -> BEGIN
    ->    DECLARE cActor bigint default 0;
    ->    DECLARE final int default false;
    ->
    ->    DECLARE elcursor cursor for
    ->       SELECT id_actor
    ->       FROM ACTORS;
    ->
    ->    DECLARE continue handler for not found SET final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into cActor;
    ->
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->       SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
    ->       /*condicio home*/
    ->       if(sexe_actor="home",
    ->       if(year(curdate()) - anynaix_actor<15,"nen",
    ->       if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
    ->       if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
    ->       if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
    ->       if(year(curdate()) - anynaix_actor>61, "home gran",""))))),
    ->
    ->       /*condicio dona*/
    ->       if(year(curdate()) - anynaix_actor<15,"nena",
    ->       if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
    ->       if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adulta",
    ->       if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
    ->       if(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
    ->       FROM ACTORS
    ->       WHERE ACTORS.id_actor = cActor;
    ->    END loop elbucle;
    ->    close elcursor;
    -> END//
--------------
CREATE PROCEDURE loopedat09()
BEGIN
   DECLARE cActor bigint default 0;
   DECLARE final int default false;

   DECLARE elcursor cursor for
      SELECT id_actor
      FROM ACTORS;

   DECLARE continue handler for not found SET final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into cActor;

      if final = 1 then
         leave elbucle;
      end if;
      SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,

      if(sexe_actor="home",
      if(year(curdate()) - anynaix_actor<15,"nen",
      if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
      if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
      if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
      if(year(curdate()) - anynaix_actor>61, "home gran",""))))),


      if(year(curdate()) - anynaix_actor<15,"nena",
      if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
      if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adulta",
      if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
      if(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
      FROM ACTORS
      WHERE ACTORS.id_actor = cActor;
   END loop elbucle;
   close elcursor;
END
--------------

Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELIMITER ;
mysql>


```

**4. Sortida de l'execució del procediment**
```sql
  mysql> call loopedat09();
--------------
call loopedat09()
--------------

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Nicolas Cage |   57 |          1964 | home       | home madur                |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Diane Kruger |   45 |          1976 | dona       | dona madura               |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-----------+------+---------------+------------+---------------------------+
| nom_actor | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------+------+---------------+------------+---------------------------+
| Tom Hanks |   65 |          1956 | home       | home gran                 |
+-----------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+----------------------+------+---------------+------------+---------------------------+
| nom_actor            | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------------+------+---------------+------------+---------------------------+
| Catherine Zeta-Jones |   52 |          1969 | dona       | dona madura               |
+----------------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Javier Bardem |   52 |          1969 | home       | home madur                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+------------+------+---------------+------------+---------------------------+
| nom_actor  | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+------------+------+---------------+------------+---------------------------+
| Tom Cruise |   59 |          1962 | home       | home madur                |
+------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+------------+------+---------------+------------+---------------------------+
| nom_actor  | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+------------+------+---------------+------------+---------------------------+
| Jamie Foxx |   54 |          1967 | home       | home madur                |
+------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Jessica Alba |   40 |          1981 | dona       | dona adulta               |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Ioan Gruffudd |   48 |          1973 | home       | home madur                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-------------------+------+---------------+------------+---------------------------+
| nom_actor         | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------------+------+---------------+------------+---------------------------+
| Robert Downey Jr. |   56 |          1965 | home       | home madur                |
+-------------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Gwyneth Paltrow |   49 |          1972 | dona       | dona madura               |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Chris Hemsworth |   38 |          1983 | home       | home adult                |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Mark Ruffalo |   54 |          1967 | home       | home madur                |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-------------+------+---------------+------------+---------------------------+
| nom_actor   | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------+------+---------------+------------+---------------------------+
| Chris Evans |   40 |          1981 | home       | home adult                |
+-------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+--------------------+------+---------------+------------+---------------------------+
| nom_actor          | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------------+------+---------------+------------+---------------------------+
| Scarlett Johansson |   37 |          1984 | dona       | dona adulta               |
+--------------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Jeremy Renner |   40 |          1981 | home       | home adult                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| James Spader |   61 |          1960 | home       |                           |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Michael Chiklis |   52 |          1969 | home       | home madur                |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Hayley Atwell |   39 |          1982 | dona       | dona adulta               |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| Sebastian Stan |   39 |          1982 | home       | home adult                |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Elliott Gould |   83 |          1938 | home       | home gran                 |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| George Clooney |   60 |          1961 | home       | home madur                |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------+------+---------------+------------+---------------------------+
| nom_actor | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------+------+---------------+------------+---------------------------+
| Brad Pitt |   58 |          1963 | home       | home madur                |
+-----------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Elliott Gould |   83 |          1938 | home       | home gran                 |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| George Clooney |   60 |          1961 | home       | home madur                |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------+------+---------------+------------+---------------------------+
| nom_actor | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------+------+---------------+------------+---------------------------+
| Brad Pitt |   58 |          1963 | home       | home madur                |
+-----------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Joaquin Phoenix |   47 |          1974 | home       | home madur                |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| Robert de Niro |   78 |          1943 | home       | home gran                 |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-------------+------+---------------+------------+---------------------------+
| nom_actor   | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------+------+---------------+------------+---------------------------+
| Zazie Beetz |   30 |          1991 | dona       | dona adulta               |
+-------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**
[Act11.sql](https://github.com/aleixdeumal/exercicis_mp02_uf03/blob/master/exercicis_mp02_uf03/DeumalAleix_Act_03_ProcEmm_MySQL/DeumalAleix_Act_03_ProcEmm_MySQL_Apartat_011.sql)
**2. Contingut del fitxer**
```sql
USE videoclub;
DROP FUNCTION IF EXISTS Ex11;

DELIMITER //
CREATE FUNCTION Ex11(Peli SMALLINT UNSIGNED)
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE Visualitzats SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO Visualitzats
   FROM     PRESTECS
   WHERE    id_peli = Peli;

   RETURN Visualitzats;
END//
DELIMITER ;
-- SELECT
  SELECT  titol_peli Titol, Ex11(1) "Quantitat exemplars"
   FROM    PELLICULES
   WHERE   id_peli = 1;
```

**3. Sortida de la creació del procediment**
```sql
   mysql> USE videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> DROP FUNCTION IF EXISTS Ex11;
--------------
DROP FUNCTION IF EXISTS Ex11
--------------

Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER //
mysql> CREATE FUNCTION Ex11(Peli SMALLINT UNSIGNED)
    ->        RETURNS SMALLINT UNSIGNED
    ->        DETERMINISTIC
    -> BEGIN
    ->    DECLARE Visualitzats SMALLINT UNSIGNED;
    ->
    ->    SELECT   COUNT(*)
    ->         INTO Visualitzats
    ->    FROM     PRESTECS
    ->    WHERE    id_peli = Peli;
    ->
    ->    RETURN Visualitzats;
    -> END//
--------------
CREATE FUNCTION Ex11(Peli SMALLINT UNSIGNED)
       RETURNS SMALLINT UNSIGNED
       DETERMINISTIC
BEGIN
   DECLARE Visualitzats SMALLINT UNSIGNED;

   SELECT   COUNT(*)
        INTO Visualitzats
   FROM     PRESTECS
   WHERE    id_peli = Peli;

   RETURN Visualitzats;
END
--------------

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   mysql>   SELECT  titol_peli Titol, Ex11(1) "Quantitat exemplars"
    ->    FROM    PELLICULES
    ->    WHERE   id_peli = 1;
--------------
SELECT  titol_peli Titol, Ex11(1) "Quantitat exemplars"
   FROM    PELLICULES
   WHERE   id_peli = 1
--------------

+-------------+---------------------+
| Titol       | Quantitat exemplars |
+-------------+---------------------+
| La busqueda |                   3 |
+-------------+---------------------+
1 row in set (0.00 sec)

```

---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**
[Act12.sql](https://github.com/aleixdeumal/exercicis_mp02_uf03/blob/master/exercicis_mp02_uf03/DeumalAleix_Act_03_ProcEmm_MySQL/DeumalAleix_Act_03_ProcEmm_MySQL_Apartat_012.sql)
**2. Contingut del fitxer**
```sql
    USE videoclub;
    DROP FUNCTION IF EXISTS Ex12;
    DELIMITER //
    CREATE FUNCTION Ex12(CodiPeli SMALLINT UNSIGNED) 
        RETURNS SMALLINT
        DETERMINISTIC
    BEGIN
        DECLARE fi int default false;
        DECLARE CodiActor SMALLINT UNSIGNED;
        DECLARE curso cursor for
            SELECT   id_actor
            FROM ACTORS_PELLICULES
            WHERE id_peli = CodiPeli
            AND principal = 1;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    SET fi = 1;
    open curso;
    bucle:loop
        fetch curso into CodiActor;

        if fi = 1 then leave bucle;
        end if;
        RETURN CodiActor;
    END loop bucle;
    close curso;
    
    END//
DELIMITER ;

SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = Ex12(2) AND id_peli = 2;
    END
```

**3. Sortida de la creació del procediment**
```sql
   mysql> USE videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql>     DROP FUNCTION IF EXISTS Ex12;
--------------
DROP FUNCTION IF EXISTS Ex12
--------------

Query OK, 0 rows affected (0.01 sec)

mysql>     DELIMITER //
mysql>     CREATE FUNCTION Ex12(CodiPeli SMALLINT UNSIGNED)
    ->         RETURNS SMALLINT
    ->         DETERMINISTIC
    ->     BEGIN
    ->         DECLARE fi int default false;
    ->         DECLARE CodiActor SMALLINT UNSIGNED;
    ->         DECLARE curso cursor for
    ->             SELECT   id_actor
    ->             FROM ACTORS_PELLICULES
    ->             WHERE id_peli = CodiPeli
    ->             AND principal = 1;
    ->
    ->     DECLARE CONTINUE HANDLER FOR NOT FOUND
    ->     SET fi = 1;
    ->     open curso;
    ->     bucle:loop
    ->         fetch curso into CodiActor;
    ->
    ->         if fi = 1 then leave bucle;
    ->         end if;
    ->         RETURN CodiActor;
    ->     END loop bucle;
    ->     close curso;
    ->
    ->     END//
--------------
CREATE FUNCTION Ex12(CodiPeli SMALLINT UNSIGNED)
        RETURNS SMALLINT
        DETERMINISTIC
    BEGIN
        DECLARE fi int default false;
        DECLARE CodiActor SMALLINT UNSIGNED;
        DECLARE curso cursor for
            SELECT   id_actor
            FROM ACTORS_PELLICULES
            WHERE id_peli = CodiPeli
            AND principal = 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET fi = 1;
    open curso;
    bucle:loop
        fetch curso into CodiActor;

        if fi = 1 then leave bucle;
        end if;
        RETURN CodiActor;
    END loop bucle;
    close curso;

    END
--------------

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   mysql> SELECT ACTORS.nom_actor, PELLICULES.titol_peli
    -> FROM ACTORS , PELLICULES
    -> WHERE id_actor = Ex12(2) AND id_peli = 2;
--------------
SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = Ex12(2) AND id_peli = 2
--------------

+-----------+-------------+
| nom_actor | titol_peli  |
+-----------+-------------+
| Tom Hanks | LA TERMINAL |
+-----------+-------------+
1 row in set (0.00 sec)
```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**

**2. Contingut del fitxer**
```sql
   <El codi del vostre fitxer>
```

**3. Sortida de la creació del procediment**
```sql
   <La sortida de la creació del vostre procediment>
```

**4. Sortida de l'execució del procediment**
```sql
   <La sortida de l'execució del vostre procediment>
```

---

