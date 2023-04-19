--Ecrire des requêtes d'interrogation de la base de données



    --Afficher la liste des commandes ( la liste doit faire apparaitre la date, les informations du client, le plat et le prix )

      SELECT 
        c.date_commande AS "Date",
        c.nom_client AS "Nom du client",
        c.telephone_client AS "Téléphone du client",
        c.email_client AS "Mail du client",
        c.adresse_client AS "Adresse du client", 
        p.libelle AS"Plat", 
        p.prix AS"Prix" 
      FROM commande c
      JOIN plat p
      ON c.id_plat = p.id
      ORDER BY c.date_commande;





    -- Afficher la liste des plats en spécifiant la catégorie

      SELECT p.libelle AS "Plat", c.libelle AS "Catégorie" FROM plat p
      JOIN categorie c
      ON p.id_categorie = c.id
      ORDER BY p.id_categorie ASC;


    -- Afficher les catégories et le nombre de plats actifs dans chaque catégorie 

      SELECT c.libelle AS categorie, COUNT(p.id) AS nombre_plats_actifs
      FROM categorie c
      LEFT JOIN plat p ON c.id = p.id_categorie
      WHERE p.active = 'actif'
      GROUP BY c.libelle; --Résultat vide ?


    -- Liste des plats les plus vendus par ordre décroissant

      SELECT p.id, p.libelle AS"Nom du plat", COUNT(c.id_plat) AS "nombre de commandes"
      FROM plat p
      LEFT JOIN commande c ON p.id = c.id_plat
      GROUP BY p.id, p.libelle
      ORDER BY c.id_plat DESC;


    -- Le plat le plus rémunérateur

      SELECT p.id, p.libelle AS"Nom du plat", p.prix, SUM(c.total) AS "Revenu total"
      FROM plat p
      LEFT JOIN commande c ON p.id = c.id_plat
      GROUP BY p.id, p.libelle, p.prix
      ORDER BY c.total DESC
      LIMIT 1;

    -- Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant)



--Ecrire des requêtes de modification de la base de données

    -- Ecrivez une requête permettant de supprimer les plats non actif de la base de données

      DELETE FROM plat
      WHERE active = 'non';

    -- Ecrivez une requête permettant de supprimer les commandes avec le statut livré

      DELETE FROM commande
      WHERE etat = 'livré';

    -- Ecrivez un script sql permettant d'ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie.

      -- Ajouter une nouvelle catégorie
      INSERT INTO categorie (libelle, image, active)
      VALUES ('Nouvelle catégorie', 'image.jpg', 'oui');
      SET @id_categorie = LAST_INSERT_ID();
      INSERT INTO plat (libelle, description, prix, image, id_categorie, active)
      VALUES ('Nouveau plat', 'Description du nouveau plat', 9.99, 'plat.jpg', @id_categorie, 'oui');


    -- Ecrivez une requête permettant d'augmenter de 10% le prix des plats de la catégorie 'Pizza'

      UPDATE plat
      SET prix = prix * 1.1
      WHERE id_categorie = (SELECT id_categorie FROM categorie WHERE libelle = 'Pizza');
