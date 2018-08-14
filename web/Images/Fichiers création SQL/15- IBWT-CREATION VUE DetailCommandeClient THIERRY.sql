use IBWT
go
create view DetailCommandeClient
as
select
CONCAT(cli.cliNom,' ',cli.cliPrenom) AS'Client',
cli.cliId AS 'CliId',
com.comId As 'ComId',
com.comDate As 'DateCommande',
sta.staMsg As 'Statut',
ldc.oeuIsbn AS 'ISBN',
oeu.oeuTitre AS 'Titre',
ldc.ligQteCommandee AS 'Quantite',
ldc.ligPrix AS 'PrixUnitaireHT',
CAST(ldc.ligPrix + (((ldc.ligPrix * ldc.ligTva)/100))AS decimal(8,2)) AS 'PrixUnitaireTTC',
ldc.ligTva AS 'Tva',
ldc.ligTauxPromo AS 'Promo',
CAST(((ldc.ligPrix + (((ldc.ligPrix * ldc.ligTva)/100)))*ldc.ligQteCommandee) AS decimal(8,2)) AS 'TotalTTC',
oeu.oeuUrlImage AS 'UrlImage'



FROM Client cli
JOIN Commande com
ON cli.cliID = com.cliId
Join LigneDeCommande ldc
ON com.comId = ldc.comId
JOIN Oeuvre oeu
ON oeu.oeuIsbn = ldc.oeuIsbn
JOIN Statut sta
ON sta.staNbre = com.comStatut

