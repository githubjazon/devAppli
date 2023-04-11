-- Rechercher le prénom des employés et le numéro de la région de leur département

    SELECT employe.prenom, dept.noregion FROM employe INNER JOIN dept ON employe.nodep = dept.nodept;

-- Rechercher le numéro du département, le nom du département, le nom des employés classés par numéro de département (renommer les tables utilisées)

    SELECT dept.nodept 
    AS "Numéro de département", dept.nom 
    AS "Nom du département", employe.prenom 
    AS "Prénom des employés"
    FROM employe employe 
    JOIN dept dept ON employe.nodep = dept.nodept 
    ORDER BY dept.nodept ASC;

-- Rechercher le nom des employés du département Distribution

    SELECT employe.nom 
    AS " Nom des employés du département distribution"
    FROM employe
    JOIN dept ON employe.nodep = dept.nodept
    WHERE dept.nom = 'distribution';

-- Rechercher le nom et le salaire des employés qui gagnent plus que leur patron, et le nom et le salaire de leur patron (PAS FINI)

    SELECT nom, salaire
    FROM employe
    WHERE titre = 'president';

--Rechercher le nom et le titre des employés qui ont le même titre que "Amartakaldire"

    SELECT e1.nom, e1.titre
    FROM employe e1, employe e2
    WHERE e1.titre = e2.titre AND e2.nom = 'Amartakaldire';

--Rechercher le nom, le salaire et le numéro de département des employés qui gagnent plus qu'un seul employé du département 31, classés par numéro de département et salaire

    SELECT e1.nom, e1.salaire, e1.nodep
    FROM employe e1
    WHERE e1.salaire > (SELECT MIN(e2.salaire) 
    FROM employe e2 
    WHERE e2.nodep = '31')
    ORDER BY e1.nodep, e1.salaire;

--Rechercher le nom, le salaire et le numéro de département des employés qui gagnent plus que tous les employés du département 31, classés par numéro de département et salaire

    SELECT e.nom, e.salaire, e.nodep
    FROM employe e
    WHERE e.salaire > ALL (
    SELECT e2.salaire
    FROM employe e2
    WHERE e2.nodep = 31
    )
    ORDER BY e.nodep, e.salaire;

--Rechercher le nom et le titre des employés du service 31 qui ont un titre que l'on trouve dans le département 32

    SELECT employe.nom, employe.titre 
    FROM employe 
    WHERE employe.nodep = '31' 
    AND employe.titre IN (
    SELECT DISTINCT titre 
    FROM employe 
    WHERE nodep = '32');

--Rechercher le nom et le titre des employés du service 31 qui ont un titre l'on ne trouve pas dans le département 32

    SELECT e.nom, e.titre 
    FROM employe e 
    WHERE e.nodep = 31 
    AND e.titre 
    NOT IN (SELECT titre FROM employe WHERE nodep = 32);

--Rechercher le nom, le titre et le salaire des employés qui ont le même titre et le même salaire que Fairant

    SELECT e1.nom, e1.titre, e1.salaire
    FROM employe e1
    JOIN employe e2 
    ON e1.titre = e2.titre 
    AND e1.salaire = e2.salaire
    WHERE e2.prenom = 'teddy';

--Rechercher le numéro de département, le nom du département, le nom des employés, en affichant aussi les départements dans lesquels il n'y a personne, classés par numéro de département

    SELECT dept.nodept 
    AS "Numéro de département", dept.nodept 
    AS "Nom du département", employe.nom 
    AS "Nom de l'employé"
    FROM dept
    LEFT JOIN employe ON dept.nodept = employe.nodep
    ORDER BY dept.nodept;

--Calculer le nombre d'employés de chaque titre

    SELECT titre, COUNT(*) as "Nombre d'employés"
    FROM employe
    GROUP BY titre;

--Calculer la moyenne des salaires et leur somme, par région

    SELECT dept.noregion as "Région", 
       AVG(employe.salaire) as "Moyenne salaire",
       SUM(employe.salaire) as "Somme salaire"
    FROM employe 
    LEFT JOIN dept 
    ON employe.nom = dept.noregion 
    GROUP BY dept.noregion;












