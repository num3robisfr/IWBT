use IBWT

   alter table Adresse 
   add constraint pkAdresse
   primary key (adrId)

   alter table FactureAdresse
   add constraint pkFactureAdresse
   primary key (facId)

   alter table LivraisonAdresse
   add constraint pkLivraisonAdresse
   primary key (livId)

   alter table Auteur
   add constraint pkAuteur
   primary key (autId)

   alter table Client
   add constraint pkClient
   primary key (cliId)

   alter table Commande
   add constraint pkCommande
   primary key (comId)

   alter table Commentaire
   add constraint pkCommentaire
   primary key (cmtId)

   alter table ContenuSite
   add constraint pkContenu
   primary key (conId)

   alter table CoupDeCoeur
   add constraint pkCoupDeCoeur
   primary key (couId)

   alter table Descriptif
   add constraint pkDescriptif
   primary key (oeuIsbn,motId)

   alter table Ecriture
   add constraint pkEcriture
   primary key (oeuIsbn,autId)

   alter table Editeur
   add constraint pkEditeur
   primary key (ediId)

   alter table Evenement
   add constraint pkEvenement
   primary key (eveId)

   alter table Expedition
   add constraint pkExpedition
   primary key (traId,comId)

   alter table Impact
   add constraint pkImpact
   primary key (eveId,oeuIsbn)

   alter table LigneDeCommande
   add constraint pkLigneDeCommande
   primary key (ligId)

   alter table Moderation
   add constraint pkModeration
   primary key (cmtId,utiId)

   alter table MotCle
   add constraint pkMotCle
   primary key (motId)

   alter table Oeuvre
   add constraint pkOeuvre
   primary key (oeuIsbn)

   alter table ServiceBancaire
   add constraint pkServiceBancaire
   primary key (serId)

   alter table SousTheme
   add constraint pkSousTheme
   primary key (souId)

   alter table Statut
   add constraint pkStatut
   primary key (staNbre)

   alter table Theme
   add constraint pkTheme
   primary key (theId)

   alter table Paiement
   add constraint pkPaiement
   primary key (paiNum)

   alter table Transporteur
   add constraint pkTransporteur
   primary key (traId)

   alter table Tva
   add constraint pkTva
   primary key (tvaId)

   alter table Utilisateur
   add constraint pkUtilisateur
   primary key (utiId)





