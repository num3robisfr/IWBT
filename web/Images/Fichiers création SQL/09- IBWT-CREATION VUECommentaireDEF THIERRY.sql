use IBWT
go
create view VueCommentaireDef as
select
cmtId as 'cmtId',
cmt.oeuIsbn as 'oeuIsbn',
oeuTitre as 'Nom Oeuvre',
cmt.cliId as 'cliId',
cmtDate as 'cmtDate',
cmtTexte as 'cmtTexte',
cmtNote as 'cmtNote',
cmtIp as 'cmtIp',
cmtStatut as 'cmtStatut',
concat(cli.cliNom, ' ', cli.cliPrenom) as 'client'


from Commentaire cmt
join Oeuvre oeu
on cmt.oeuIsbn =  oeu.oeuIsbn 
join Client cli
on cli.cliId = cmt.cliId
--

