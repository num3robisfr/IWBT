use IBWT

GO
create VIEW ListeAdresseClientFacturation AS

SELECT

CONCAT(cli.cliNom,' ',cli.cliPrenom) AS 'Client',
facId AS 'FacLivId',
fac.cliId AS 'FacClientId',
CONCAT(fac.facNom,' ',fac.facPrenom) AS 'FactureNomPrenom',
fac.facGenre AS 'FactureGenre',
adr.adrId AS 'AdresseId',
adr.adrVoie AS 'AdresseVoie', 
adr.adrComplement AS 'AdresseComplement',
adr.adrVille AS 'AdresseVille',
adr.adrPays AS 'AdressePays',
adrObservation AS 'AdresseObservation',
sta.staNom AS 'AdresseStatut'


FROM Client cli
JOIN FactureAdresse  fac
ON cli.cliId = fac.cliId
JOIN Adresse adr
ON fac.adrId = adr.adrId
JOIN Statut sta
ON sta.staNbre = adr.adrStatut

