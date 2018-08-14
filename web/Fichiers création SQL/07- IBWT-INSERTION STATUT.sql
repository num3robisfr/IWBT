use IBWT


INSERT INTO [dbo].[Statut]
           ([staNbre]
           ,[staNom]
           ,[staMsg])
     VALUES
	   /*********************************************DROITS***********************************************************************/
		
           (0
           ,'ADMINISTRATEUR'
           ,'TOUS LES DROITS (DROITS DE GESTION D''UTILISATEURS, DE MODERATION, DES OEUVRES, DES PROMOS, ET GESTION DES COMPTES CLIENTS)' ),
		   (1
           ,'MODERATEUR'
           ,'DROITS DE MODERATION, DE GESTION DES OEUVRES, DES PROMOS ET GESTION DES COMPTES CLIENTS'),
		   (2
           ,'COMMERCIAL'
           ,'DROITS DE GESTION DES OEUVRES ET DES PROMOS'),
		   (3
		   ,'INTERIMAIRE'
           ,'DROITS DE GESTION DES OEUVRES'),
		   (4
           ,'VISITEUR'
           ,'AUCUN DROITS DE GESTION, SIMPLE UTILISATION DU SITE'),

		  /*********************************************STATUT DES OEUVRES*******************************************************/
		   (10
           ,'DISPONIBLE'
           ,'CETTE OEUVRE EST EN STOCK'),
		   (11
           ,'NON DISPONIBLE'
           ,'CETTE OEUVRE N''EST PLUS DISPONIBLE'),
		   (12
           ,'EN COURS DE RÉAPPROVISSIONNEMENT'
           ,'CETTE OEUVRE EST EN COURS DE RÉAPPROVISSIONNEMENT'),
		   (13
           ,'HORS LIGNE'
           ,'CETTE OEUVRE N''EST PAS ENCORE VISIBLE EN LIGNE'),

		  /*********************************************STATUT DES COMMENTAIRES*******************************************************/
		   (20
		   ,'NON LU'
           ,'LE COMMENTAIRE N''A PAS ÉTÉ TRAITÉ'),
		   (21
           ,'VALIDE'
           ,'LE COMMENTAIRE EST VALIDÉ'),
		   (22     
		   ,'EN COURS DE VALIDATION'
           ,'LE COMMENTAIRE EST EN COURS DE VALIDATION'),
		   (23
           ,'REFUSÉ'
           ,'LE COMMENTAIRE EST REFUSÉ'),

		   /*********************************************STATUT DES COMMANDES*******************************************************/

		   (30
           ,'EN COURS DE PRÉPARATION'
           ,'LA COMMANDE EST EN COURS DE PRÉPARATION'),
		   (31
           ,'COMMANDE EN TRANSIT'
           ,'LA COMMANDE A ÉTÉ TRANSMISE AU TRANSPORTEUR'),
		   (32
           ,'LIVRÉE'
           ,'LA COMMANDE A ÉTÉ LIVRÉE'),
		   (33
           ,'NON LIVRÉE'
           ,'LA COMMANDE N''A PAS PU ETRE LIVRÉE'),
		   (34
           ,'COMMANDE REFUSÉE'
           ,'LA COMMANDE A ETE REFUSÉE'),

		   /*********************************************STATUT DES ADRESSES*******************************************************/

		   (40
           ,'NPAI'
           ,'LE CLIENT N''HABITE PAS A L''ADRESSE INDIQUÉE'),
		   (41
           ,'ADRESSE INÉXISTENTE'
           ,'L''ADRESSE N''ÉXISTE PAS'),
		   (42
           ,'VALIDE'
           ,'L''ADRESSE EST VALIDÉE')

		   SELECT*FROM Statut
