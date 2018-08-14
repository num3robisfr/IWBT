use IBWT

GO
create VIEW ListeAdresseClientLivraison AS

SELECT

CONCAT(cli.cliNom,' ',cli.cliPrenom) AS 'Client',
livId as 'LivraisonId',
liv.cliId AS 'LivClientId',
liv.livNom AS 'LivraisonNom',
liv.livPrenom AS 'LivraisonPrenom',
liv.livGenre AS 'LivGenre',
adr.adrId AS 'AdresseId',
adr.adrVoie AS 'AdresseVoie',
adr.adrComplement AS 'AdresseComplement',
adr.adrVille AS 'AdresseVille',
adr.adrPays AS 'AdressePays',
adrObservation AS 'AdresseObservation',
sta.staNom AS 'AdresseStatut'


FROM Client cli
JOIN LivraisonAdresse  liv
ON cli.cliId = liv.cliId
JOIN Adresse adr
ON liv.adrId = adr.adrId

JOIN Statut sta
ON sta.staNbre = adr.adrStatut

