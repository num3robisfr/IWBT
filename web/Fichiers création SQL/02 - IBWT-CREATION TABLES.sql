use IBWT

   create table Adresse (
   adrId                int identity		 not null,
   adrVoie				varchar(250)         not null,
   adrComplement        varchar(250)         null,
   adrCodePostal        varchar(5)           not null,
   adrVille             varchar(150)         not null,
   adrPays              varchar(150)         not null,
   adrStatut            int                  not null,
   adrObservation       varchar(max)         null
   )

   create table FactureAdresse (
   facId                int identity         not null,
   adrId                int                  not null,
   cliId                int                  not null,
   facNom               varchar(150)         null,
   facPrenom            varchar(150)         null,
   facGenre				varchar(1)			 null	
   )

   create table LivraisonAdresse (
   livId                int identity         not null,
   adrId                int                  not null,
   cliId                int                  not null,
   livNom               varchar(150)         null,
   livPrenom            varchar(150)         null,
   livGenre				varchar(1)			 null	
   )

   create table Auteur (
   autId                int identity         not null,
   autNom               varchar(150)          not null,
   autPrenom            varchar(150)          not null,
   autDescription       varchar(max)         null
   )

   create table Client (
   cliId                int identity         not null,
   cliNom               varchar(150)          not null,
   cliPrenom            varchar(150)          not null,
   cliGenre				varchar(1)			not null,	
   cliEmail             varchar(100)         not null,
   cliMotDePasse        varchar(50)          not null,
   cliTelephone         varchar(10)          not null,
   cliObservation       varchar(max)         null,
   cliDateEntree        datetime             not null,
   cliDateSortie        datetime             null
   )

   create table Commande (  
   comId                int identity         not null,
   cliId                int                  not null,
   adrIdFacture         int                  not null,
   adrIdLivraison       int                  not null,
   comDate              datetime             not null,
   comStatut            int                  null,
   comObservation       varchar(max)         null,
   comIp                varchar(15)          not null
   )

   create table Commentaire (
   cmtId                int identity         not null,
   oeuIsbn              varchar(13)          not null,
   ligId                int                  not null,
   cliId                int                  not null,
   cmtDate              datetime             not null,
   cmtTexte             varchar(max)         not null,
   cmtNote              smallint             not null,
   cmtIp                varchar(15)          not null,
   cmtStatut            varchar(50)          not null,
   cmtObservation       varchar(max)         null
   )

   create table ContenuSite (
   conId                int identity         not null,
   conIntitule          varchar(100)         not null,
   conDescription       varchar(max)         not null
   )

   create table CoupDeCoeur (
   couId                int identity         not null,
   utiId                int                  not null,
   oeuIsbn              varchar(13)          not null
   )

   create table Descriptif (
   oeuIsbn              varchar(13)          not null,
   motId                int                  not null
   )

   create table Ecriture (
   oeuIsbn              varchar(13)          not null,
   autId                int                  not null
   )

   create table Editeur (
   ediId                int identity         not null,
   ediNom               varchar(100)         not null,
   ediInfos             varchar(max)         null,
   ediObservation       varchar(max)         null
   )

   create table Evenement (
   eveId                int identity         not null,
   utiId                int                  not null,
   eveIntitule          varchar(100)         not null,
   eveDateDebut         datetime             not null,
   eveDateFin           datetime             not null,
   eveTauxPromo         int			         null,
   eveUrl				varchar(100)		 null,
   eveObservation       varchar(max)         null
   )

   create table Expedition (
   traId                int                  not null,
   comId                int                  not null,
   expNumSuivi          int identity      not null,
   expDateEnvoi         datetime             null,
   expDateLivraison     datetime             null
   )

   create table Impact (
   eveId                int                  not null,
   oeuIsbn              varchar(13)          not null
   )

   create table LigneDeCommande (
   ligId                int identity         not null,
   comId                int                  not null,
   oeuIsbn              varchar(13)          not null,
   ligQteCommandee      smallint             not null,
   ligPrix              decimal(8,2)         not null,
   ligTva               decimal(5,2)         not null,
   ligTauxPromo         smallint             null
   )

   create table Moderation (
   cmtId                int                  not null,
   utiId                int                  not null
   )

   create table MotCle (
   motId                int identity         not null,
   motTag               varchar(50)          not null
   )

   create table Oeuvre (
   oeuIsbn              varchar(13)          not null,
   tvaId                int                  not null,
   ediId                int                  not null,
   souId                int                  not null,
   utiId                int                  not null,
   oeuTitre             varchar(150)         not null,
   oeuSousTitre         varchar(150)         null,
   oeuDateParution      date                 null,
   oeuResume            varchar(max)         not null,
   oeuNbrePage          int                  not null,
   oeuUrlImage          varchar(250)         not null,
   oeuPrix              decimal(8,2)         not null,
   oeuStock             int                  not null,
   oeuStatut            int                  not null,
   oeuObservation       varchar(max)         null
   )

   create table ServiceBancaire (
   serId                int identity         not null,
   serNom               varchar(100)         not null
   )

   create table SousTheme (
   souId                int identity         not null,
   theId                int                  not null,
   souIntitule          varchar(100)         not null
   )

   create table Statut (
   staNbre              smallint             not null,
   staNom               varchar(50)          not null,
   staMsg               varchar(max)         null
   )

   create table Theme (
   theId                int identity         not null,
   theIntitule          varchar(50)          not null
   )

   create table Paiement (
   paiNum               int identity         not null,
   serId                int                  not null,
   comId                int                  not null,
   paiDate              datetime             not null
   )

   create table Transporteur (
   traId                int identity         not null,
   traNom               varchar(50)          not null,
   traFraisDePort       decimal(5,2)         not null
   )

   create table Tva (
   tvaId                int identity         not null,
   tvaTaux              decimal(5,2)         not null
   )

   create table Utilisateur (
   utiId                int identity         not null,
   utiNom               varchar(150)          not null,
   utiPrenom            varchar(150)          not null,
   utiEmail				varchar(100)		 not null,
   utiLogin             varchar(50)          not null,
   utiMotDePasse        varchar(50)          not null,
   utiDroit             int                  not null,
   utiDateEntree        datetime             not null,
   utiDateSortie        datetime             null
   )






