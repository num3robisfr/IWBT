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
           ,'EN COURS DE R�APPROVISSIONNEMENT'
           ,'CETTE OEUVRE EST EN COURS DE R�APPROVISSIONNEMENT'),
		   (13
           ,'HORS LIGNE'
           ,'CETTE OEUVRE N''EST PAS ENCORE VISIBLE EN LIGNE'),

		  /*********************************************STATUT DES COMMENTAIRES*******************************************************/
		   (20
		   ,'NON LU'
           ,'LE COMMENTAIRE N''A PAS �T� TRAIT�'),
		   (21
           ,'VALIDE'
           ,'LE COMMENTAIRE EST VALID�'),
		   (22     
		   ,'EN COURS DE VALIDATION'
           ,'LE COMMENTAIRE EST EN COURS DE VALIDATION'),
		   (23
           ,'REFUS�'
           ,'LE COMMENTAIRE EST REFUS�'),

		   /*********************************************STATUT DES COMMANDES*******************************************************/

		   (30
           ,'EN COURS DE PR�PARATION'
           ,'LA COMMANDE EST EN COURS DE PR�PARATION'),
		   (31
           ,'COMMANDE EN TRANSIT'
           ,'LA COMMANDE A �T� TRANSMISE AU TRANSPORTEUR'),
		   (32
           ,'LIVR�E'
           ,'LA COMMANDE A �T� LIVR�E'),
		   (33
           ,'NON LIVR�E'
           ,'LA COMMANDE N''A PAS PU ETRE LIVR�E'),
		   (34
           ,'COMMANDE REFUS�E'
           ,'LA COMMANDE A ETE REFUS�E'),

		   /*********************************************STATUT DES ADRESSES*******************************************************/

		   (40
           ,'NPAI'
           ,'LE CLIENT N''HABITE PAS A L''ADRESSE INDIQU�E'),
		   (41
           ,'ADRESSE IN�XISTENTE'
           ,'L''ADRESSE N''�XISTE PAS'),
		   (42
           ,'VALIDE'
           ,'L''ADRESSE EST VALID�E')

		   SELECT*FROM Statut
