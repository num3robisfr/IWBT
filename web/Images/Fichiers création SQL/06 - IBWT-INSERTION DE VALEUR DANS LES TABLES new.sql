USE IBWT

/*INSERTION DANS TVA*/

INSERT INTO Tva
(tvaTaux) 
VALUES
(5.5)

/*INSERTION DANS THEME*/

INSERT INTO Theme
(theIntitule) 
VALUES
('Litt�rature & fiction'),
('BD & jeunesse'),
('Art, culture & soci�t�'),
('Vie pratique'),
('Nature & loisirs'),
('Scolaire & universitaire'),
('Savoirs')

/*INSERTION DANS SOUS THEME*/

INSERT INTO SousTheme
(theId, souIntitule)
VALUES
(1,'romans policiers'),
(1,'les prix litt�raires'),
(1,'Romans et litt�rature'),
(2,'BD'),
(2,'Manga'),
(2,'Comics'),
(1,'Fantastique'),
(1,'Polar Historique')

--INSERTION DANS ServiceBancaire

INSERT INTO ServiceBancaire
(serNom)
VALUES
('AXA BANQUE'),
('BANQUE POPULAIRE'),
('LA BANQUE POSTALE'),
('ING DIRECT'),
('BNP PARIBAS'),
('CAISSE D'+char(146)+'EPARGNE'),
('CREDIT AGRICOLE'),
('SOCIETE GENERALE'),
('LCL'),
('CIC')

/*INSERTION DANS EDITEUR*/

INSERT INTO Editeur
(ediNom) 
VALUES
('Albin Michel'),
('Presses de la Cit�'),
('Grasset'),
('Actes Sud Editions'),
('Gl�nat Manga'),
('Kana'),
('Folio JuniorDargaud'),
('Folio Junior'),
('Editions Albert Ren�'),
('HACHETTE ASTERIX'),
('Independently published'),
('Le Seuil'),
('BnF')

/*INSERTION DANS AUTEUR*/

INSERT INTO Auteur
(autNom, autPrenom)
VALUES
('Grang�','Jean-Christophe'),
('Bussi','Michel'),
('Guez','Olivier'),
('Vuillard','Eric'),
('Oda','Eiichiro'),
('Kishimoto','Masashi'),
('Enrico','Marini'),
('Rolwling','J. K.'),
('Uderzo','Albert'),
('Kamijyo','Akimine'),
('Desabers','Gabrielle'),
('Kerr','Philip'),
('Vitto', 'Cara'),
('Gerson','Agneta')

-- INSERTION VALEURS DANS LA TABLE UTILISATEUR

INSERT INTO Utilisateur
( utiNom, utiPrenom, utiEmail, utiLogin, utiMotDePasse, utiDroit, utiDateEntree)
VALUES
('PHALEMPIN', 'Nicolas', 'nicolas.phalempin@test.com', 'nphalempin', 'FSO123I', 0, '2018-01-06 09:12'),
('MARTINEZ', 'Thierry', 'thierry.martinez@test.com', 'tmartinez', 'FSO456I', 1, '2018-09-06 11:50'),
('BOUSSAID', 'Nourdine', 'nourdine.boussaid@test.com', 'nboussaid', 'FSO789I', 2, '2018-16-06 16:45'),
('LEGAZ', 'C�cile', 'cecile.legaz@test.com', 'clegaz', 'FSO123J', 3, '2018-21-06 10:16')

/*INSERTION DANS OEUVRE*/


INSERT INTO Oeuvre
(oeuIsbn,tvaId,ediId,souId,utiId,oeuTitre,oeuDateParution,oeuResume,oeuNbrePage,oeuUrlImage,oeuPrix,oeuStock)
VALUES
('9782226392091',1,1,1,1,'La Terre des morts','2018-05-02','Quand le commandant Corso est charg� d''enqu�ter sur une s�rie de meurtres de strip-teaseuses, il pense avoir affaire � une traque criminelle classique.
Il a tort : c''est d''un duel qu''il s''agit. Un combat � mort avec son principal suspect, Philippe Sobieski, peintre, d�bauch�, assassin.
Mais ce duel est bien plus encore : une plong�e dans les m�andres du porno, du bondage et de la perversit� sous toutes ses formes. Un vertige noir dans lequel Corso se perdra lui-m�me, apprenant � ses d�pens qu''un assassin peut en cacher un autre, et que la r�alit� d''un flic peut totalement basculer, surtout quand il s''agit de la jouissance par le Mal.',560,'./Images/laterredesmorts.jpg',23.90,10),
('9782258113091',1,2,1,1,'Sang famille','2018-05-16','" Tel un soleil brutal, la lumi�re du phare des Encha�n�s inonde la pi�ce. Une seconde � peine. Puis l''obscurit� reprend le dessus, simplement perc�e du halo des lampes torches. 
Je vais mourir ici. 
C''est une certitude. 
Une seule question me hante, la derni�re : jusqu''o� sont-ils pr�ts � aller pour me faire avouer ? A fouiller ma m�moire, comme s''ils pouvaient en arracher les souvenirs qu''ils convoitent ? 
Tout est all� si vite, � peine quatre jours.
Je n''�tais alors qu''un adolescent parmi d''autres.
Un orphelin.
C''est du moins ce qu''on avait toujours voulu me faire croire... "',420,'./Images/sangfamille.jpg',21.9,10),
('9782246855873',1,3,2,1,'La disparition de Josef Mengele - Prix Renaudot 2017','2017-08-16','1949  : Josef Mengele arrive en Argentine.
Cach� derri�re divers pseudonymes, l�ancien m�decin tortionnaire � Auschwitz  croit pouvoir s�inventer une nouvelle vie � Buenos Aires. L�Argentine de Peron est bienveillante, le monde entier veut oublier les crimes nazis. Mais la traque reprend et le m�decin SS doit s�enfuir au Paraguay puis au Br�sil. Son errance de planque en planque, d�guis� et rong� par l�angoisse, ne conna�tra plus de r�pit� jusqu�� sa mort myst�rieuse sur une plage en 1979.
Comment le m�decin SS a-t-il pu passer entre les mailles du filet, trente ans durant  ?
La Disparition de Josef Mengele est une plong�e inou�e au c�ur des t�n�bres. Anciens nazis, agents du Mossad, femmes cupides et dictateurs d�op�rette �voluent dans un monde corrompu par le fanatisme, la realpolitik, l�argent et l�ambition. Voici l�odyss�e dantesque de Josef Mengele en Am�rique du Sud. Le roman-vrai de sa cavale apr�s-guerre.',240,'./Images/ladisparitiondejosephmengele.jpg',18.5,2),
('9782330078973',1,4,3,1,'L''ordre du jour - Prix Goncourt 2017','2017-04-29','Ils �taient vingt-quatre, pr�s des arbres morts de la rive, vingt-quatre pardessus noirs, marron ou cognac, vingt-quatre paires d''�paules rembourr�es de laine, vingt-quatre costumes trois pi�ces, et le m�me nombre de pantalons � pinces avec un large ourlet. Les ombres p�n�tr�rent le grand vestibule du palais du pr�sident de l''Assembl�e ; mais bient�t, il n''y aura plus d''Assembl�e, il n''y aura plus de pr�sident, et, dans quelques ann�es, il n''y aura m�me plus de Parlement, seulement un amas de d�combres fumants. Eric Vuillard',160,'./Images/lordredujour.jpg',16,1),
('9782344030042',1,5,5,1,'One Piece - �dition originale - Tome 87','2018-07-04','Un �chec retentissant ! Apr�s avoir vu leur �op�ration r�gicide� avort�e, Luffy, Bege, C�sar et leurs alli�s se retrouvent dans une position plus que d�licate ! Alors qu''ils r�fl�chissent � un moyen de quitter cette �le pour �chapper � la col�re noire de Big Mom, un ph�nom�ne se produit... Les aventures de Luffy � la poursuite du One Piece continuent !',208,'./Images/onepiece87.jpg',6.9,12),
('9782344027523',1,5,5,1,'One Piece - �dition originale - Tome 86','2018-04-04','Capone d�taille son projet d�assassinat contre Big Mom ! H�las, pour esp�rer avoir une chance de blesser une femme aussi robuste, le seul moyen est de viser son point faible� Luffy et ses alli�s viendront-ils � bout de leur terrible adversaire ?! Les aventures de Luffy � la poursuite du One Piece continuent !',208,'./Images/onepiece86.jpg',6.9,0),
('9782871294146',1,6,5,1,'Naruto, tome 1','2002-03-09','Naruto est un gar�on un peu sp�cial. Il est toujours tout seul et son caract�re fougueux ne l''aide pas vraiment � se faire appr�cier dans son village. Malgr� cela, il garde au fond de lui une ambition: celle de devenir un ma�tre Hokage, la plus haute distinction dans l''ordre des ninjas, et ainsi obtenir la reconnaissance de ses pairs.',208,'./Images/naruto1.jpg',3,25),
('9782871294177',1,6,5,1,'Naruto, tome 2','2002-04-15','Sasuke, Sakura et Naruto passent un test dont le but est de s''emparer de clochettes que d�tient le professeur Kakashi. Il leur fait bien r�aliser leur inf�riorit� et leur manque d''exp�rience et finit par leur annoncer qu''ils n''ont aucune chance de devenir ninjas...',205,'./Images/naruto2.jpg',3,25),
('9782505070832',1,7,6,1,'Batman - tome 1 - Batman 1','2017-11-03','Marini r�interpr�te Batman pour la premi�re fois en bande dessin�e franco-belge. Quel lien secret Batman et le Joker partagent-ils avec une jeune fille myst�rieuse ? Kidnapp�e par le Joker, le Chevalier noir doit plonger dans les profondeurs de Gotham City et s''engager dans une course contre la montre pour la retrouver. Les enjeux sont importants, et pour Batman, c''est personnel !',72,'./Images/batman1.jpg',14.99,8),
('9782505071389',1,7,6,1,'Batman - tome 2 - Batman 2','2018-06-15','Batman remue d�sesp�r�ment la ville de Gotham pour trouver des traces de la petite Alina, sa fille pr�sum�e, enlev�e par son pire ennemi, le Joker.  Mais le clown psychopathe se moque pas mal de l''homme chauve-souris : pour lui, c''est Bruce Wayne qui d�tient la cl� de son probl�me. Et le Joker est pr�t � tout pour satisfaire les besoins de sa bien-aim�e Harley Quinn. M�me � sacrifier la vie d''une petite gamine. Car comme il le dit lui-m�me : � C''est dans les contes de f�es que les histoires finissent bien... et ceci n''en est pas un ! �',72,'./Images/batman2.jpg',14.99,1),
('9782070584628',1,8,7,1,'Harry Potter, I : Harry Potter � l''�cole des sorciers','2017-10-12','Harry Potter est un gar�on ordinaire. Mais le jour de ses onze ans, son existence bascule : un g�ant vient le chercher pour l''emmener dans une �cole de sorciers. Quel myst�re entoure donc sa naissance et qui est l''effroyable V..., le mage dont personne n''ose prononcer le nom ? Voler � cheval sur des balais, jeter des sorts, combattre les Trolls : Harry Potter se r�v�le un sorcier vraiment dou�. Mais un myst�re entoure sa naissance et l''ffroyable V., le mage dont personne n''ose prononcer le nom. Quand il d�cide, avec ses amis, d''explorer les moindres recoins de son �cole, il va se trouver entra�n� dans d''extraordinaires aventures.',320,'./Images/harrypotteralecoledessorciers.jpg',8.5,50),
('9782070584642',1,8,7,1,'Harry Potter, II : Harry Potter et la Chambre des Secrets','2017-10-12','Une rentr�e fracassante en voiture volante, une �trange mal�diction qui s''abat sur les �l�ves, cette deuxi�me ann�e � l''�cole des sorciers ne s''annonce pas de tout repos ! Entre les cours de potions magiques, les matches de Quidditch et les combats de mauvais sorts, Harry et ses amis Ron et Hermione trouveront-ils le temps de percer le myst�re de la Chambre des Secrets ? Le deuxi�me volume des aventures de Harry Potter : un livre magique pour sorciers confirm�s.',368,'./Images/harrypotteretlachambredessecrets.jpg',8.5,60),
('9782864973270',1,9,4,1,'Ast�rix - Ast�rix et la Transitalique - n�37','2017-10-19','Les personnages cr��s par les deux g�nies du 9e art Albert Uderzo et Ren� Goscinny sont de retour ! Apr�s Ast�rix chez les Pictes et Le Papyrus de C�sar, Ast�rix et Ob�lix reviennent dans Ast�rix et la Transitalique, le nouvel album sign� par les talentueux Jean-Yves Ferri et Didier Conrad. N''en d�plaise � Ob�lix, les Italiques, les habitants de l''Italie, ne sont pas tous des Romains, au contraire !',48,'./Images/asterixetlatransitalique.jpg',9.95,22),
('9782012101388',1,10,4,1,'Ast�rix - Ast�rix et Cl�op�tre - n�6','2004-06-16','Cl�op�tre fait le pari avec C�sar que son peuple est encore capable de grandes r�alisations.',48,'./Images/asterixetcleopatre.jpg',9.95,20),
('9782012101395',1,10,4,1,'Ast�rix - Le combat des chefs - n�7','2004-06-16','Le d�curion Perclus demande au chef Gaulois Aplusb�galix de d�fier Abraracourcix en combat des chefs. Mais pour qu''il ait une chance de gagner, reste � �liminer Panoramix�',48,'./Images/asterixlecombatdeschefs.jpg',9.95,20),
('9782871293545',1,6,5,1,'Samurai Deeper Kyo, tome 1','2001-04-14','Quatre ann�es ont pass� depuis la terrible bataille de Sekigahara et les samoura�s qui ont surv�cu sont aujourd''hui des nomades errants � la recherche d''un sens � donner � leur existence. Kyo est l''un d''eux. M�dicaments et artifices dans ses bagages, il suit une route dont il ne sait o� elle le conduira!',190,'./Images/kyo1.jpg',6.85,40),
('9782871297154',1,6,5,1,'Samurai Deeper Kyo, tome 19','2005-02-04','Kyo explose de col�re et affronte Chinmei � la "3e Porte"!! La "Plan�te noire" de Chinmei attaque le "Suzaku" de Kyo! Yuya et ses amis vont-ils fr�ler l''espoir ou le d�sespoir?',190,'./Images/kyo19.jpg',6.85,6),
('9781980923886',1,11,8,1,'Je r�vais d''une autre vie','2008-05-06','Effondr�e, Nathalie d�couvre que depuis plusieurs ann�es sa vie n�est qu�une illusion. Pour tenter de se relever apr�s cette violente r�v�lation, elle choisit de tout changer dans son existence. Elle quitte Paris et d�cide de se construire une nouvelle vie en province. La r�novation d�une vieille maison bretonne l�am�ne sur des chemins inattendus. Les lettres et le coffret cach�s par Marie-Jeanne, la propri�taire pr�c�dente, l�obligent � avancer sur des sables mouvants. Au fil de ses recherches, Nathalie va d�couvrir la vie de Martina et Jean dans la France d�apr�s-guerre. Quel lien Marie-Jeanne, la petite paysanne bretonne, a-t-elle cr�� en 1957 avec Martina, cette bourgeoise parisienne?? Cette enqu�te va redonner un sens � son existence et lui apprendre � se conna�tre. Les hommes qui croiseront sa route l�aideront � d�passer la trahison.',390,'./Images/jerevaisdunevie.jpg',14,10),
('9782021340747',1,12,8,1,'Bleu de Prusse','2018-05-03','" Bernie Gunther, rus�, subversif, sardonique et extr�mement dr�le � l''occasion, illumine ce roman dur et sto�que. " Lee Child 1956. � peine remis des �motions des Pi�ges de l''exil, Bernie Gunther doit s''enfuir pour sauver sa peau : le march� que lui impose Erich Mielke, num�ro deux de la Stasi, est inacceptable. Du cap Ferrat � Sarrebr�ck, sa cavale h�ro�que sera sem�e d''embuches. 1939. Parall�lement, selon une de ces constructions virtuoses dont il a le secret, Philip Kerr nous emm�ne � Berchtesgaden, o� Hitler est attendu pour son cinquanti�me anniversaire. Quand un ing�nieur est assassin� sur la terrasse du Berghof, le nid d''aigle du F�hrer, c''est la panique : jamais au grand jamais ce sacril�ge ne doit �tre rendu public. Somm� par le g�n�ral Heydrich de d�couvrir, et dans la plus absolue discr�tion, le coupable, Bernie Gunther ne dispose que d''une semaine pour r�ussir. Or personne ne semble dispos� � l''aider : Martin Bormann r�gne en tyran � Berchtesgaden � du moins tant que le tyran supr�me n''est pas l� � et s''y livre � maints trafics lucratifs aliment�s par un r�seau bien organis�. Et parmi les proches de Hitler en Bavi�re nombreux sont ceux qui ont des choses � cacher : ils feront tout pour que l''enqu�te �choue. Plus Gunther approchera de la v�rit�, plus sa vie sera menac�e. Philip Kerr est n� en 1956 � �dimbourg. Il a �tudi� le droit � l''universit� de Birmingham et la philosophie en Allemagne. Auteur de plus de trente livres acclam�s dans le monde entier, il a re�u l''Ellis Peters Historical Dagger de la Crime Writers'' Association en 2009 et de nombreux autres prix. Il partage son temps entre Londres et les Cornouailles. Traduit de l''anglais par Jean Esch',672,'./Images/bleudeprusse.jpg',22.5,50),
('9782954539614',1,13,1,1,'Une fille en danger','2018-04-06','� Paris, dans une rue d�serte du 18e arrondissement, le corps d�un homme sauvagement assassin� est retrouv� abandonn� en haut d�un arbre. Toutes les traces laiss�es sur place accablent Al�na, une photographe apparemment sans histoire. Mais pourquoi la jeune femme aurait-elle commis ce crime insolite ? Et surtout, comment ? G�rard Coutard, d�tective au pass� trouble est charg� de la surveiller. Il est connu dans la profession pour sa capacit� � d�nouer les affaires r�put�es hors-normes. Certains disent m�me que ses fr�quents s�jours en Afrique l�auraient dot� de dons particuliers� G�rard d�couvrira rapidement que la jeune femme cache des capacit�s physiques �tranges : elle marche anormalement vite, elle poss�de une force surhumaine, elle per�oit la pr�sence de son collaborateur pourtant sp�cialiste en filature, elle dort tr�s peu et surtout, elle semble souffrir d�une sant� mentale alt�r�e. Mais malgr� tous ces �l�ments, G�rard restera convaincu de l�innocence de la photographe. Il percevra m�me qu�un danger plane sur elle et il se mettra en t�te de la prot�ger, co�te que co�te, quitte � d�vier de la mission de surveillance qui lui a �t� confi�e, quitte � mettre ses proches en danger�',330,'./Images/unefilleendanger.jpg',9.99,50),
('9781976945618',1,11,1,1,'PROJET ARTHEMIS: Thriller scientifique','2018-01-21','Au-dessus de la Laponie , deux satellites se percutent. Les services secrets am�ricains et su�dois tentent d''�touffer l''affaire, mais Manuel, ing�nieur le jour et hacker la nuit, met � jour un complot international. Son amie Charleen, travaillant � la NASA, est alors embarqu�e malgr� elle dans une enqu�te dont elle ne sortira pas indemne. Lors d''une traque infernale vers les confins les plus sombres du DARKNET et du terrorisme informatique, elle d�couvrira un autre monde, parall�le au notre, o� les hackers font la loi. Elle pourra compter sur un journaliste su�dois dans sa course contre la montre pour arr�ter le "projet ARTHEMIS". Y arriveront-ils � temps ? Dans la lign�e des romans de Dan Brown, ce roman � suspense, men� tambour battant et m�lant aventures, technologie et amour, nous fait voyager du Chili � la Su�de, en passant par le Maryland, si�ge de la NASA et de la NSA. Ing�nieur en informatique et sp�cialis�e dans le domaine spatial, Agneta Gerson signe ici un thriller autour d''un fait r�el : la collision entre les satellites Iridium-33 et Kosmos-2251. ',238,'./Images/projetarthemis.jpg',12.90,22)

/*INSERTION DANS ECRITURE*/

INSERT INTO Ecriture
(oeuIsbn,autId)
VALUES
('9782226392091',1),
('9782258113091',2),
('9782246855873',3),
('9782330078973',4),
('9782344030042',5),
('9782344027523',5),
('9782871294146',6),
('9782871294177',6),
('9782505070832',7),
('9782505071389',7),
('9782070584628',8),
('9782070584642',8),
('9782864973270',9),
('9782012101388',9),
('9782012101395',9),
('9782871293545',10),
('9782871297154',10),
('9781980923886',11),
('9782021340747',12),
('9782954539614',13),
('9781976945618',14)

-- INSERTION DANS EVENEMENT

INSERT INTO Evenement
(utiId, eveIntitule, eveDateDebut, eveDateFin, eveObservation,eveTauxPromo,eveUrl)
VALUES
(1, 'F�te des p�res', '2018-15-10 08:00', '2018-17-10 20:00','Profiter de la f�tes des p�res pour offrir des livres',10, './Images/feteperes1.jpg' ),
(2, 'Salon du livre', '2018-09-11 08:00', '2018-15-11 20:00','Le salon de toutes les envies, de nombreuses d�dicaces',null,'./Images/salonlivre1.png' ),
(2, 'Sp�cial rentr�e !', '2018-03-09 07:00', '2018-06-09 12:00','La rentr�e des classes, retour de vacances, profiter de nos promotions',10,'./Images/salonrentr�e2.jpg'),
(2, 'N�el', '2018-22-12 07:00', '2018-27-12 12:00','Profiter de n�el pour faire plaisir � vos proches',15,'./Images/Evenementnoel.jpg')
/*INSERTION DANS CoupDeCoeur*/

INSERT INTO CoupDeCoeur
(utiId, oeuIsbn)
VALUES
(1, '9781976945618'),
(2, '9781980923886'),
(1, '9781980923886'),
(2, '9782070584628'),
(3, '9782070584628'),
(1, '9782505070832'),
(2, '9782954539614'),
(1, '9782344027523'),
(2, '9782344027523'),
(3, '9782344027523')

/*INSERTION DANS Client*/


INSERT INTO Client
(cliNom,cliPrenom,cliGenre,cliEmail,cliMotDePasse,cliTelephone,cliDateEntree) 
VALUES
('Saindon','Yvon','H','YvonSaindon@teleworm.us','2489','0696616571','23/11/2017'),
('Chandonnet','Christine','F', 'Chandonnet.Christine@Praesenteudui.org','2717','0647552357','06/03/2018'),
('Montminy','Saville','F','SavilleMontminy@rhyta.com','5989','0618963022','09/01/2018'),
('Aubert','Alain','H', 'Aubert.alain@sitamet.fr','8205','0657795441','19/08/2017'),
('Poulain','Am�lie','F','poulain.amelie@at.org','5434','0687258700','01/05/2018'),
('Provencher','Coralie','F','provencher.coralie@semutdolor.net','6321','0668438063','24/12/2017'),
('Courtois','Patrice','H', 'courtois.patrick@rhoncusidmollis.net','7058','0676257807','28/02/2017'),
('Mailloux','Henry','H', 'henry.mailloux@mattisCras.ca','7983','0621496606','20/02/2018'),
('Dupuis','Orlane','F','o.dupuis@cursus.org','7765','0697021581','15/04/2017'),
('Brodeur','Madeleine','F','madeleine.brodeur@laoreet.net','4860','0668149155','14/01/2017')


/*INSERTION DANS Adresse*/

INSERT INTO Adresse
(adrVoie,adrComplement,adrCodePostal,adrVille)
VALUES
('43 Rue de la pompe','','13700','MARIGNANE'),
('68 Avenue De Marlioz','','95100','ARGENTEUIL'),
('60 Rue Roussy','','45000','ORLEANS'),
('65 rue de la Mare aux Carats','','34080','MONTPELLIER'),
('49 rue Porte d''Orange','','33150','CENON'),
('1 rue Descartes','','67200','STRASBOURG'),
('84 rue du G�n�ral Ailleret', '','62300','LENS'),
('59 rue de Strasbourg','','93390','CLICHY-SOUS-BOIS'),
('87 Avenue des Tuileries','','67500','HAGUENAU'),
('86 rue L�on Dierx','','14100','LISIEUX'),
('30 rue Gouin de Beauchesne','','91240','SAINT-MICHEL-SUR-ORGE'),
('43 rue du Gue Jacquet','','86100','CHATELLERAULT'),
('41 Avenue De Marlioz','','06600','ANTIBES'),
('10 Rue Fr�d�ric Chopin','','78000','VERSAILLES'),
('86 rue Victor Hugo','','29900','CONCARNEAU'),
('10 place Stanislas','','44100','NANTES'),
('33 rue Sadi Carnot','','15000','AURILLAC'),
('53  rue Petite Fusterie','','38300','BOURGOIN-JALLIEU'),
('88 Rue du Palais','','93800','�PINAY-SUR-SEINE'),
('18 Boulevard de Normandie','','94120','FONTENAY-SOUS-BOIS')



/*INSERTIONS DANS Impact*/
use IBWT

INSERT INTO Impact
(eveId, oeuIsbn)
VALUES

(1, '9781980923886'),
(1, '9782012101388'),
(1, '9782012101395'),
(1, '9782021340747'),
(1, '9782226392091'),
(1, '9782954539614'),
(1, '9781976945618'),

(2, '9782070584628'),
(2, '9782070584642'),
(2, '9782226392091'),
(2, '9782246855873'),
(2, '9782258113091'),
(2, '9782330078973'),
(2, '9782344027523'),
(2, '9782344030042'),
(2, '9782505070832'),
(2, '9782505071389'),
(2, '9782864973270'),
(2, '9782871293545'),
(2, '9782871294146'),
(2, '9782871294177'),
(2, '9782871297154'),
(2, '9782954539614'),

(3, '9782012101388'),
(3, '9782012101395'),
(3, '9782070584628'),
(3, '9782070584642'),
(3, '9782246855873'),
(3, '9782258113091'),
(3, '9782864973270'),
(3, '9782954539614')


/*INSERTION DANS MotCle*/

INSERT INTO MotCle
(motTag)
VALUES
('Jeunesse'),
('BD'),
('Manga'),
('Comics'),
('Fiction'),
('Action'),
('Fantasy'),
('Science-Fantasy'),
('Science-Fiction'),
('Voyage'),
('Evasion'),
('Aventure'),
('Science sociale'),
('Science politique'),
('Math�matiques'),
('Biologie'),
('Chimie'),
('Physique'),
('Eau de rose'),
('Amour'),
('Romantique'),
('Th��tre'),
('Com�die'),
('Comique'),
('Dramatique'),
('Drame'),
('Polar'),
('Thiller'),
('Enqu�te')

/*INSERTION DANS FactureAdresse*/



INSERT INTO FactureAdresse
(adrId,cliId,facNom,facPrenom, facGenre)
VALUES
(1,1,'Dupont','Laurent','H'),
(3,2,'Chandonnet','Christine','F'),
(5,3,'Montminy','Saville', 'H'),
(7,4,'Aubert','Alain','H'),
(9,5,'Poulain','Am�lie', 'F'),
(11,6,'Provencher','Coralie','F'),
(13,7,'Courtois','Patrice','H'),
(15,8,'Mailloux','Henry','H'),
(17,9,'Dupuis','Orlane', 'F'),
(18,10,'Brodeur','Madeleine', 'F')

/*INSERTION DANS LivraisonAdresse*/



INSERT INTO LivraisonAdresse
(adrId,cliId,livNom,livPrenom, livGenre)
VALUES
(1,1,'Saindon','Yvon', 'H'),
(4,2,'Nadeau','Mathilde','F'),
(6,3,'Montminy','Saville','H'),
(8,4,'Aubert','Alain','H'),
(10,5,'Poulain','Am�lie','F'),
(11,6,'Provencher','Coralie','F'),
(13,7,'Courtois','Patrice','H'),
(15,8,'Mailloux','Henry','H'),
(17,9,'Dupuis','Orlane','F'),
(20,10,'Brodeur','Madeleine','F')

--Insertion dans Commande



INSERT INTO Commande
(cliId, adrIdFacture, adrIdLivraison, comDate,comStatut,comIp)
VALUES
(1,1,1, '2018-13-06 17:22', '30','233.70.68.61'),
(10,10,10, '2018-20-06 12:15','32', '177.252.153.251'),
(2,3,4,'2018-18-06 14:50','30','225.196.97.169'),
(3,5,6, '2018-15-06 15:03','32', '229.34.85.251'),
(4,7,8, '2018-15-06 15:03','31', '243.251.12.149'),
(3,5,5,'2018-17-06 15:03','30', '229.34.85.251')

--Insertion dans Transporteur

INSERT INTO Transporteur
(traNom)
VALUES
('COLISSIMO'),
('UPS'),
('TNT'),
('DPD'),
('DHL'),
('FEDEX'),
('CHRONOPOST')


-- INSERTION DANS Expedition

INSERT INTO Expedition
(traId,comId,expDateEnvoi,expDateLivraison)
VALUES
(1,1,'2018-14-06 08:30','2018-20-06 08:25'),
(1,2,'2018-20-06 18:02','2018-27-06 09:45'),
(7,3,'2018-18-06 17:16','2018-25-06 14:50'),
(5,4,'2018-15-06 16:45','2018-23-06 10:00')

--Insertion dans Ligne de Commande


INSERT INTO LigneDeCommande
(comId, oeuIsbn, ligQteCommandee,ligPrix,ligTva)
VALUES
(1, '9781980923886', 1,14.00,5.5),

(2, '9782330078973', 3,16,5.5),

(3, '9782871294146', 1,3,5.5),
(3, '9782871294177', 1,3,5.5),

(4, '9782070584628', 1, 8.5,5.5),
(4, '9782070584642', 1,8.5,5.5),

(5, '9782871294146', 1,3,5.5),
(5, '9782871293545', 1, 6.85,5.5),
(5, '9782505070832', 1, 14.99,5.5),

(6, '9782871294146', 2, 8.5,5.5),

(6, '9782871294177', 1,3,5.5)

--Insertion Dans Paiement

INSERT INTO Paiement
(serId, comId, paiDate)
VALUES
(8, 1, '2018-13-06 17:22'),
(5, 2, '2018-20-06 12:15'),
(6, 3, '2018-18-06 14:50'),
(4, 4, '2018-15-06 15:03'),
(9, 5, '2018-15-06 15:03')

-- INSERTION DANS Commentaire

INSERT INTO Commentaire
(oeuIsbn,ligId,cliId,cmtDate,cmtTexte,cmtNote,cmtIp,cmtStatut)
VALUES
('9781980923886',1,1,'2018-13-06 17:22','Avec ces destins de femmes qui s''entrecroisent, Gabrielle Desabers sait tenir le lecteur en haleine. Jusqu''� la conclusion, lorsque les pi�ces du puzzle finissent par s''imbriquer. Des femmes qui, chacune � sa mani�re, finissent par devenir qui elles sont. Par vivre la vie qui leur convient. Parce qu''il n''est jamais trop tard et qu''il faut parfois du temps pour se (re)prendre en main, cette histoire parlera � tous ceux (surtout toutes celles !) qui veulent croire en leurs r�ves.',5,'233.70.68.61','NON LU'),
('9782330078973',2,10,'2018-20-06 12:15','j''ai cru b�tement qu''il s''agissait d''un nouvel opus et je n''ai pas lu les commentaires....Quelle na�vet� de ma part. Un ancien Bussi, soi-disant "revisit�", bref, j''ai perdu mon argent et je ne peux m''en prendre qu''� moi-m�me. Monsieur Bussi a bien raison de r�-�diter d''anciennes pages, tant qu''il y a des gens comme moi pour se faire avoir. C''est le dernier livre que j''ach�te de cet auteur, le pr�c�dent roman m''�tant "tomb� des mains".',1,'177.252.153.251','NON LU'),
('9782871294146',3,2,'2018-18-06 14:50','Les livres pr�f�r�s de mon fils de 9 ans. Je ne me trompe jamais quand je lui commande ces ouvrages. Ils les adorent. Ils se lisent de la droite vers la gauche et �a lui plait beaucoup.Bref, du manga comme il les aime. Livr� en un temps record. Amazon Prime pour les f�tes de fin d''ann�e c''est vraiment un avantage non n�gligeable.',5,'192.166.1.1','NON LU'),
('9782871294177',4,3,'2018-18-06 15:50','je kiff naruto et donc forc�ment les roman aussi. on apprend pas mal de choses sur sasuke et itachi. on lit en �tant a leurs place et on peut ressentire ce qu''ils ont ressentie a certain moment de leurs vie.',5,'192.167.1.1','NON LU'),
('9782070584628',5,3,'2018-15-06 16:03','Tout le monde connait Harry Potter mais qui a lu les livres? Apr�s avoir longtemps bataill� avec mon fils qui se contentait des DVD, il a enfin craqu� et d�vor� toute la s�rie se rendantcompte de la richesse de son contenu par rapport � l''adaptation cin�ma.',5,'192.167.1.1','NON LU'),
('9782070584642',6,4,'2018-15-07 15:03','Dommage : l''histoire est super mais les voies des personnages faites par Giraudoux sont vraiment bizarres. �a casse le sc�nario, �a coupe l''attention que l''on devrait avoir, �a rend l''histoire moins attractive.',2,'192.167.1.1','NON LU'),
('9782871294146',7,4,'2018-15-06 15:03','Je n''ai pas du tout reussi a entrer dans ma lecture, ce qui est bien dommage etant donne que le personnage m''intrigue enormement a la base',2,'192.168.165.1','NON LU'),
('9782871293545',8,4,'2018-15-06 16:03','L''originalit� de ce livre est de proposer de fondre deux h�ros totalement antith�tiques dans une seule personne. l''ancrage dans une p�riode historique japonaise rend l''oeuvre passionante et la tr�me de l''intrigue qui a cependant un peu de mal � se mettre ne place se referme peu � peu sur les personnages. Les myst�res se multiplient et s''assombrissent l''oeuvre pour faire plapiter le lecteur. On trouve aussi du plaisir dans la psychologie des personnages qui r�v�elent leur faiblesse les uns aux autres tout en tentant de les cacher. Les dessins sont soign�s et appr�ciables. En conclusion, pour les amateurs de manga comportant des samoura�s, une oeuvre assez peu ordinaire que je vous conseille de d�couvrir.',4,'192.165.1.1','NON LU')