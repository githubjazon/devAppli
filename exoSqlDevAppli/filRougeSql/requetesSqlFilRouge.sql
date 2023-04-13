--Ecrire des requêtes d'interrogation de la base de données



    --Afficher la liste des commandes ( la liste doit faire apparaitre la date, les informations du client, le plat et le prix )

      SELECT c.date_commande 
      AS "Date", c.nom_client 
      AS "Nom du client", c.telephone_client 
      AS "Téléphone du client", c.email_client 
      AS "Mail du client", c.adresse_client 
      AS "Adresse du client", p.libelle 
      AS"Plat", p.prix 
      AS"Prix" 
      FROM commande c
      JOIN plat p
      ON c.id_plat = p.id_categorie;  





    Afficher la liste des plats en spécifiant la catégorie

    Afficher les catégories et le nombre de plats actifs dans chaque catégorie

    Liste des plats les plus vendus par ordre décroissant

    Le plat le plus rémunérateur

    Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant)

--Ecrire des requêtes de modification de la base de données

    Ecrivez une requête permettant de supprimer les plats non actif de la base de données

    Ecrivez une requête permettant de supprimer les commandes avec le statut livré

    Ecrivez un script sql permettant d'ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie.

    Ecrivez une requête permettant d'augmenter de 10% le prix des plats de la catégorie 'Pizza'
