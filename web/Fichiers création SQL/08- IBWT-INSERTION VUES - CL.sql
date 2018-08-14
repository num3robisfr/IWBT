use IBWT
GO

CREATE view Statutcommande 
AS
SELECT 
com.comId 'NUMERO_DE_COMMANDE',
com.comStatut 'NB_ETAT_DE_LA_COMMANDE ',
sta.staMsg 'MSG_ETAT_DE_LA_COMMANDE '

FROM
Commande com
JOIN Statut sta
ON com.comStatut = sta.staNbre

GO
CREATE view Statututilisateur
AS
SELECT 
uti.utiId 'NUMERO_UTILISATEUR',
uti.utiDroit 'NB_ROLE ',
sta.staNom 'NOM_ROLE ',
sta.staMsg 'MSG_ROLE '

FROM
Utilisateur uti
JOIN Statut sta
ON uti.utiDroit = sta.staNbre

GO
CREATE view Statutadresse
AS
SELECT 
adr.adrId 'ID_DE_L_ADRESSE',
adr.adrStatut 'NB_STATUT_ADRESSE ',
sta.staMsg 'MSG_STATUT_ADRESSE '

FROM
Adresse adr
JOIN Statut sta
ON adr.adrStatut = sta.staNbre

GO
CREATE view AdresseLivraisonClient
AS
SELECT DISTINCT 
cli.cliId 'ID_CLIENT',
adr.adrId 'ID_ADRESSE',
adr.adrVoie 'ADR_VOIE',
adr.adrComplement'ADR_COMPLEMENT',
adr.adrCodePostal 'ADR_CODEPOSTAL', 
adr.adrVille 'ADR_VILLE',
adr.adrPays 'ADR_PAYS'
FROM Client cli
INNER JOIN LivraisonAdresse liv
ON cli.cliId = liv.cliId
INNER JOIN Adresse adr 
ON liv.adrId = adr.adrId
GROUP BY cli.cliId, adr.adrId, adr.adrVoie, adr.adrComplement, adr.adrCodePostal, adr.adrVille, adr.adrPays

GO
CREATE view AdresseFactureClient
AS
SELECT DISTINCT 
cli.cliId 'ID_CLIENT',
adr.adrId 'ID_ADRESSE',
adr.adrVoie 'ADR_VOIE',
adr.adrComplement'ADR_COMPLEMENT',
adr.adrCodePostal 'ADR_CODEPOSTAL', 
adr.adrVille 'ADR_VILLE',
adr.adrPays 'ADR_PAYS'
FROM Client cli
INNER JOIN FactureAdresse fac
ON cli.cliId = fac.cliId
INNER JOIN Adresse adr 
ON fac.adrId = adr.adrId
GROUP BY cli.cliId, adr.adrId, adr.adrVoie, adr.adrComplement, adr.adrCodePostal, adr.adrVille, adr.adrPays

GO
CREATE view Commande_AdresseFactureClient
AS
SELECT DISTINCT 
com.comId 'ID_COMMANDE',
afc.[ID_CLIENT] 'ID_CLIENT',
afc.[ID_ADRESSE] 'ID_ADRESSE',
afc.[ADR_VOIE] 'ADR_VOIE',
afc.[ADR_COMPLEMENT]'ADR_COMPLEMENT',
afc.[ADR_CODEPOSTAL] 'ADR_CODEPOSTAL', 
afc.[ADR_VILLE] 'ADR_VILLE',
afc.[ADR_PAYS] 'ADR_PAYS'
FROM Commande com
JOIN AdresseFactureClient afc
ON com.cliId = afc.[ID_CLIENT]

GO
CREATE view Client_Commande_AdresseFactureClient
AS
SELECT DISTINCT 
cli.cliNom 'FAC_DESTINATAIRE_NOM',
cli.cliPrenom 'FAC_DESTINATAIRE_PRENOM',
cafc.[ID_COMMANDE] 'ID_COMMANDE',
cafc.[ID_CLIENT] 'ID_CLIENT',
cafc.[ID_ADRESSE] 'ID_ADRESSE',
cafc.[ADR_VOIE] 'ADR_VOIE',
cafc.[ADR_COMPLEMENT]'ADR_COMPLEMENT',
cafc.[ADR_CODEPOSTAL] 'ADR_CODEPOSTAL', 
cafc.[ADR_VILLE] 'ADR_VILLE',
cafc.[ADR_PAYS] 'ADR_PAYS'
FROM Client cli
JOIN Commande_AdresseFactureClient cafc
ON cli.cliId = cafc.[ID_CLIENT]

GO
CREATE view LigneCommandePrixHT 
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
oeu.oeuIsbn 'NUMERO_ISBN',
lig.ligQteCommandee 'QUANTITE',
lig.ligPrix 'PRIX_HT',
CONCAT(CAST(SUM(ligQteCommandee*ligPrix)AS DEC(8,2)) , '€ HT') 'TOTAL_HT'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
JOIN Oeuvre oeu
ON lig.oeuIsbn = oeu.oeuIsbn
GROUP BY com.comId, oeu.oeuIsbn, lig.ligQteCommandee, lig.ligPrix 

GO
CREATE view LigneCommandePrixPROMO
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
oeu.oeuIsbn 'NUMERO_ISBN',
lig.ligQteCommandee 'QUANTITE',
lig.ligPrix 'PRIX_HT',
lig.ligTauxPromo 'Taux Promo',
CONCAT(CAST(SUM(ligQteCommandee*(ligPrix+(ligPrix*(ligTauxPromo/100))))AS DEC(8,2)) , '€ HT') 'PRIX_PROMO_HT'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
JOIN Oeuvre oeu
ON lig.oeuIsbn = oeu.oeuIsbn
GROUP BY com.comId, oeu.oeuIsbn, lig.ligQteCommandee, lig.ligPrix, lig.ligTauxPromo

GO
CREATE view LigneCommandePrixTTC 
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
oeu.oeuIsbn 'NUMERO_ISBN',
lig.ligQteCommandee 'QUANTITE',
lig.ligPrix 'PRIX_HT',
lig.ligTva 'TVA',
CONCAT(CAST(SUM(ligQteCommandee*(ligPrix+(ligPrix*ligTva/100)))AS DEC(8,2)) , '€ TTC') 'TOTAL_TTC'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
JOIN Oeuvre oeu
ON lig.oeuIsbn = oeu.oeuIsbn
GROUP BY com.comId, oeu.oeuIsbn, lig.ligQteCommandee, lig.ligPrix,lig.ligTva

GO
CREATE view LigneCommandePrixPROMO_TTC 
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
oeu.oeuIsbn 'NUMERO_ISBN',
lig.ligQteCommandee 'QUANTITE',
lig.ligPrix 'PRIX_HT',
lig.ligTva 'TVA',
lig.ligTauxPromo 'Taux Promo',
CONCAT(CAST(SUM(ligQteCommandee*((ligPrix+(ligPrix*(ligTauxPromo/100)))+(ligPrix*ligTva/100)))AS DEC(8,2)) , '€ TTC') 'TOTAL_PROMO_TTC'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
JOIN Oeuvre oeu
ON lig.oeuIsbn = oeu.oeuIsbn
GROUP BY com.comId, oeu.oeuIsbn, lig.ligQteCommandee, lig.ligPrix,lig.ligTva, lig.ligTauxPromo

GO
CREATE view CommandePrixHT 
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
CONCAT(CAST(SUM(ligQteCommandee*ligPrix)AS DEC(8,2)) , '€ HT') 'TOTAL_HT'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
GROUP BY com.comId

GO
CREATE view CommandePrixPROMO
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
CONCAT(CAST(SUM(ligQteCommandee*(ligPrix+(ligPrix*(ligTauxPromo/100))))AS DEC(8,2)) , '€ HT') 'PRIX_PROMO_HT'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
JOIN Oeuvre oeu
ON lig.oeuIsbn = oeu.oeuIsbn
GROUP BY com.comId

GO
CREATE view CommandePrixTTC 
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
CONCAT(CAST(SUM(ligQteCommandee*(ligPrix+(ligPrix*ligTva/100)))AS DEC(8,2)) , '€ TTC') 'TOTAL_TTC'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
GROUP BY com.comId

GO
CREATE view CommandePrixPROMO_TTC 
AS
SELECT DISTINCT 
com.comId 'NUMERO_DE_COMMANDE',
CONCAT(CAST(SUM(ligQteCommandee*((ligPrix+(ligPrix*(ligTauxPromo/100)))+(ligPrix*ligTva/100)))AS DEC(8,2)) , '€ TTC') 'TOTAL_PROMO_TTC'
FROM Commande com
JOIN LigneDeCommande lig 
ON com.comId = lig.comId
GROUP BY com.comId



