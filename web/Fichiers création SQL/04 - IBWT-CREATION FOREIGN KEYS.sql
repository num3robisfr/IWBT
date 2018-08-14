use IBWT

   alter table FactureAdresse 
   add constraint fkFactureAdresse
   foreign key (adrId)
   references Adresse (adrId)

   alter table FactureAdresse 
   add constraint fkFactureAdresseClient
   foreign key (cliId)
   references Client (cliId)

/******************************************************/

   alter table LivraisonAdresse 
   add constraint fkLivraisonAdresse
   foreign key (adrId)
   references Adresse (adrId)

   alter table LivraisonAdresse 
   add constraint fkLivraisonAdresseClient
   foreign key (cliId)
   references Client (cliId)

/******************************************************/

   alter table Commande
   add constraint fkCommandeClient
   foreign key (cliId)
   references Client (cliId)

   alter table Commande
   add constraint fkCommandeFacture
   foreign key (adrIdFacture)
   references Adresse (adrId)

   alter table Commande
   add constraint fkCommandeLivraison
   foreign key (adrIdLivraison)
   references Adresse (adrId)

/******************************************************/

   alter table Commentaire
   add constraint fkCommentaire
   foreign key (oeuIsbn)
   references Oeuvre (oeuIsbn)

   alter table Commentaire
   add constraint fkCommentaireLigneDeCommande
   foreign key (ligId) 
   references LigneDeCommande (ligId)

   alter table Commentaire
   add constraint fkCommentaireClient
   foreign key (cliId)
   references Client (cliId)

/******************************************************/

   alter table CoupDeCoeur
   add constraint fkCoupDeCoeurUtilisateur
   foreign key (utiId)
   references Utilisateur (utiId)

   alter table CoupDeCoeur
   add constraint fkCoupDeCoeurOeuvre
   foreign key (oeuIsbn)
   references Oeuvre (oeuIsbn)
   ON UPDATE CASCADE

/******************************************************/

   alter table Evenement
   add constraint fkEvenement
   foreign key (utiId)
   references Utilisateur (utiId)

/******************************************************/

   alter table LigneDeCommande
   add constraint fkLigneDeCommandeCommande
   foreign key (comId)
   references Commande (comId)

   alter table LigneDeCommande
   add constraint fkLigneDeCommandeOeuvre
   foreign key (oeuIsbn)
   references Oeuvre (oeuIsbn)
   ON UPDATE CASCADE

/******************************************************/

   alter table Oeuvre
   add constraint fkOeuvreTva
   foreign key (tvaId)
   references Tva (tvaId)

   alter table Oeuvre
   add constraint fkOeuvreEdition
   foreign key (ediId)
   references Editeur (ediId)

   alter table Oeuvre
   add constraint fkOeuvreSousTheme
   foreign key (souId)
   references SousTheme

   alter table Oeuvre
   add constraint fkOeuvreUtilisateur
   foreign key (utiId)
   references Utilisateur (utiId)

/******************************************************/
	
   alter table Paiement
   add constraint fkPaiementServiceBancaire
   foreign key (serId)
   references ServiceBancaire (serId)

   alter table Paiement
   add constraint fkPaiementCommande
   foreign key (comId)
   references Commande (comId)

/******************************************************/

   alter table SousTheme
   add constraint fkSousTheme
   foreign key (theId)
   references Theme (theId)