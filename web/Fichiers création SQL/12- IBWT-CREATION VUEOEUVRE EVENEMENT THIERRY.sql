use IBWT

GO
create VIEW ListesOeuvresEvenement AS

SELECT
evt.eveId as 'EvenementId',
evt.eveIntitule as 'InTitule',
oeu.oeuIsbn AS 'ISBN',
oeuTitre AS 'Titre',
oeuSousTitre AS 'Sous Titre',
CONCAT(autPrenom,' ',autNom) AS 'Auteur',
ediNom AS 'Editeur',
oeuDateParution AS 'Date de parution',
oeuResume AS 'Resume',
oeuNbrePage AS 'Nbre de page',
oeuUrlImage AS 'Image',
theIntitule AS 'Theme',
souIntitule AS 'Sous Theme',
CAST(oeuPrix AS decimal (4,2)) AS 'Prix',
tvaTaux AS 'Tva',
COUNT(DISTINCT cmtId) AS 'Nbre de cmt',
AVG (cmtNote) AS 'Moyenne des notes',
oeuStock AS 'Stock',
staNom AS 'Statut',
COUNT(DISTINCT cmtId) AS 'Nbre de Cdc'
FROM
Theme the
JOIN SousTheme sou
ON the.theId = sou.theId
JOIN Oeuvre oeu
ON sou.souId = oeu.souId
JOIN Impact imp
ON oeu.oeuIsbn = imp.oeuIsbn
JOIN Evenement evt
ON imp.eveId = evt.eveId
LEFT JOIN CoupDeCoeur cou
ON oeu.oeuIsbn = cou.oeuIsbn
LEFT JOIN Commentaire com
ON com.oeuIsbn = oeu.oeuIsbn
JOIN Tva
ON tva.tvaId = oeu.tvaId
JOIN Editeur edi
ON oeu.ediId = edi.ediId
JOIN Ecriture ecr
ON oeu.oeuIsbn = ecr.oeuIsbn
JOIN Auteur aut
ON ecr.autId = aut.autId
JOIN Statut sta
ON staNbre = oeuStatut
GROUP BY evt.eveId, evt.eveIntitule, oeu.oeuIsbn, oeuTitre, oeuSousTitre,autPrenom, autNom, 
ediNom, oeuDateParution, oeuResume, oeuNbrePage, oeuUrlImage, theIntitule, souIntitule, tvaTaux, oeuPrix, oeuStock, staNom