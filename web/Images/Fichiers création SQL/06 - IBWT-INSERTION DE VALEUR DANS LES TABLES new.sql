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
('Littérature & fiction'),
('BD & jeunesse'),
('Art, culture & société'),
('Vie pratique'),
('Nature & loisirs'),
('Scolaire & universitaire'),
('Savoirs')

/*INSERTION DANS SOUS THEME*/

INSERT INTO SousTheme
(theId, souIntitule)
VALUES
(1,'romans policiers'),
(1,'les prix littéraires'),
(1,'Romans et littérature'),
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
('Presses de la Cité'),
('Grasset'),
('Actes Sud Editions'),
('Glénat Manga'),
('Kana'),
('Folio JuniorDargaud'),
('Folio Junior'),
('Editions Albert René'),
('HACHETTE ASTERIX'),
('Independently published'),
('Le Seuil'),
('BnF')

/*INSERTION DANS AUTEUR*/

INSERT INTO Auteur
(autNom, autPrenom)
VALUES
('Grangé','Jean-Christophe'),
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
('LEGAZ', 'Cécile', 'cecile.legaz@test.com', 'clegaz', 'FSO123J', 3, '2018-21-06 10:16')

/*INSERTION DANS OEUVRE*/


INSERT INTO Oeuvre
(oeuIsbn,tvaId,ediId,souId,utiId,oeuTitre,oeuDateParution,oeuResume,oeuNbrePage,oeuUrlImage,oeuPrix,oeuStock)
VALUES
('9782226392091',1,1,1,1,'La Terre des morts','2018-05-02','Quand le commandant Corso est chargé d''enquêter sur une série de meurtres de strip-teaseuses, il pense avoir affaire à une traque criminelle classique.
Il a tort : c''est d''un duel qu''il s''agit. Un combat à mort avec son principal suspect, Philippe Sobieski, peintre, débauché, assassin.
Mais ce duel est bien plus encore : une plongée dans les méandres du porno, du bondage et de la perversité sous toutes ses formes. Un vertige noir dans lequel Corso se perdra lui-même, apprenant à ses dépens qu''un assassin peut en cacher un autre, et que la réalité d''un flic peut totalement basculer, surtout quand il s''agit de la jouissance par le Mal.',560,'./Images/laterredesmorts.jpg',23.90,10),
('9782258113091',1,2,1,1,'Sang famille','2018-05-16','" Tel un soleil brutal, la lumière du phare des Enchaînés inonde la pièce. Une seconde à peine. Puis l''obscurité reprend le dessus, simplement percée du halo des lampes torches. 
Je vais mourir ici. 
C''est une certitude. 
Une seule question me hante, la dernière : jusqu''où sont-ils prêts à aller pour me faire avouer ? A fouiller ma mémoire, comme s''ils pouvaient en arracher les souvenirs qu''ils convoitent ? 
Tout est allé si vite, à peine quatre jours.
Je n''étais alors qu''un adolescent parmi d''autres.
Un orphelin.
C''est du moins ce qu''on avait toujours voulu me faire croire... "',420,'./Images/sangfamille.jpg',21.9,10),
('9782246855873',1,3,2,1,'La disparition de Josef Mengele - Prix Renaudot 2017','2017-08-16','1949  : Josef Mengele arrive en Argentine.
Caché derrière divers pseudonymes, l’ancien médecin tortionnaire à Auschwitz  croit pouvoir s’inventer une nouvelle vie à Buenos Aires. L’Argentine de Peron est bienveillante, le monde entier veut oublier les crimes nazis. Mais la traque reprend et le médecin SS doit s’enfuir au Paraguay puis au Brésil. Son errance de planque en planque, déguisé et rongé par l’angoisse, ne connaîtra plus de répit… jusqu’à sa mort mystérieuse sur une plage en 1979.
Comment le médecin SS a-t-il pu passer entre les mailles du filet, trente ans durant  ?
La Disparition de Josef Mengele est une plongée inouïe au cœur des ténèbres. Anciens nazis, agents du Mossad, femmes cupides et dictateurs d’opérette évoluent dans un monde corrompu par le fanatisme, la realpolitik, l’argent et l’ambition. Voici l’odyssée dantesque de Josef Mengele en Amérique du Sud. Le roman-vrai de sa cavale après-guerre.',240,'./Images/ladisparitiondejosephmengele.jpg',18.5,2),
('9782330078973',1,4,3,1,'L''ordre du jour - Prix Goncourt 2017','2017-04-29','Ils étaient vingt-quatre, près des arbres morts de la rive, vingt-quatre pardessus noirs, marron ou cognac, vingt-quatre paires d''épaules rembourrées de laine, vingt-quatre costumes trois pièces, et le même nombre de pantalons à pinces avec un large ourlet. Les ombres pénétrèrent le grand vestibule du palais du président de l''Assemblée ; mais bientôt, il n''y aura plus d''Assemblée, il n''y aura plus de président, et, dans quelques années, il n''y aura même plus de Parlement, seulement un amas de décombres fumants. Eric Vuillard',160,'./Images/lordredujour.jpg',16,1),
('9782344030042',1,5,5,1,'One Piece - Édition originale - Tome 87','2018-07-04','Un échec retentissant ! Après avoir vu leur “opération régicide” avortée, Luffy, Bege, César et leurs alliés se retrouvent dans une position plus que délicate ! Alors qu''ils réfléchissent à un moyen de quitter cette île pour échapper à la colère noire de Big Mom, un phénomène se produit... Les aventures de Luffy à la poursuite du One Piece continuent !',208,'./Images/onepiece87.jpg',6.9,12),
('9782344027523',1,5,5,1,'One Piece - Édition originale - Tome 86','2018-04-04','Capone détaille son projet d’assassinat contre Big Mom ! Hélas, pour espérer avoir une chance de blesser une femme aussi robuste, le seul moyen est de viser son point faible… Luffy et ses alliés viendront-ils à bout de leur terrible adversaire ?! Les aventures de Luffy à la poursuite du One Piece continuent !',208,'./Images/onepiece86.jpg',6.9,0),
('9782871294146',1,6,5,1,'Naruto, tome 1','2002-03-09','Naruto est un garçon un peu spécial. Il est toujours tout seul et son caractère fougueux ne l''aide pas vraiment à se faire apprécier dans son village. Malgré cela, il garde au fond de lui une ambition: celle de devenir un maître Hokage, la plus haute distinction dans l''ordre des ninjas, et ainsi obtenir la reconnaissance de ses pairs.',208,'./Images/naruto1.jpg',3,25),
('9782871294177',1,6,5,1,'Naruto, tome 2','2002-04-15','Sasuke, Sakura et Naruto passent un test dont le but est de s''emparer de clochettes que détient le professeur Kakashi. Il leur fait bien réaliser leur infériorité et leur manque d''expérience et finit par leur annoncer qu''ils n''ont aucune chance de devenir ninjas...',205,'./Images/naruto2.jpg',3,25),
('9782505070832',1,7,6,1,'Batman - tome 1 - Batman 1','2017-11-03','Marini réinterprète Batman pour la première fois en bande dessinée franco-belge. Quel lien secret Batman et le Joker partagent-ils avec une jeune fille mystérieuse ? Kidnappée par le Joker, le Chevalier noir doit plonger dans les profondeurs de Gotham City et s''engager dans une course contre la montre pour la retrouver. Les enjeux sont importants, et pour Batman, c''est personnel !',72,'./Images/batman1.jpg',14.99,8),
('9782505071389',1,7,6,1,'Batman - tome 2 - Batman 2','2018-06-15','Batman remue désespérément la ville de Gotham pour trouver des traces de la petite Alina, sa fille présumée, enlevée par son pire ennemi, le Joker.  Mais le clown psychopathe se moque pas mal de l''homme chauve-souris : pour lui, c''est Bruce Wayne qui détient la clé de son problème. Et le Joker est prêt à tout pour satisfaire les besoins de sa bien-aimée Harley Quinn. Même à sacrifier la vie d''une petite gamine. Car comme il le dit lui-même : « C''est dans les contes de fées que les histoires finissent bien... et ceci n''en est pas un ! »',72,'./Images/batman2.jpg',14.99,1),
('9782070584628',1,8,7,1,'Harry Potter, I : Harry Potter à l''école des sorciers','2017-10-12','Harry Potter est un garçon ordinaire. Mais le jour de ses onze ans, son existence bascule : un géant vient le chercher pour l''emmener dans une école de sorciers. Quel mystère entoure donc sa naissance et qui est l''effroyable V..., le mage dont personne n''ose prononcer le nom ? Voler à cheval sur des balais, jeter des sorts, combattre les Trolls : Harry Potter se révèle un sorcier vraiment doué. Mais un mystère entoure sa naissance et l''ffroyable V., le mage dont personne n''ose prononcer le nom. Quand il décide, avec ses amis, d''explorer les moindres recoins de son école, il va se trouver entraîné dans d''extraordinaires aventures.',320,'./Images/harrypotteralecoledessorciers.jpg',8.5,50),
('9782070584642',1,8,7,1,'Harry Potter, II : Harry Potter et la Chambre des Secrets','2017-10-12','Une rentrée fracassante en voiture volante, une étrange malédiction qui s''abat sur les élèves, cette deuxième année à l''école des sorciers ne s''annonce pas de tout repos ! Entre les cours de potions magiques, les matches de Quidditch et les combats de mauvais sorts, Harry et ses amis Ron et Hermione trouveront-ils le temps de percer le mystère de la Chambre des Secrets ? Le deuxième volume des aventures de Harry Potter : un livre magique pour sorciers confirmés.',368,'./Images/harrypotteretlachambredessecrets.jpg',8.5,60),
('9782864973270',1,9,4,1,'Astérix - Astérix et la Transitalique - n°37','2017-10-19','Les personnages créés par les deux génies du 9e art Albert Uderzo et René Goscinny sont de retour ! Après Astérix chez les Pictes et Le Papyrus de César, Astérix et Obélix reviennent dans Astérix et la Transitalique, le nouvel album signé par les talentueux Jean-Yves Ferri et Didier Conrad. N''en déplaise à Obélix, les Italiques, les habitants de l''Italie, ne sont pas tous des Romains, au contraire !',48,'./Images/asterixetlatransitalique.jpg',9.95,22),
('9782012101388',1,10,4,1,'Astérix - Astérix et Cléopâtre - n°6','2004-06-16','Cléopâtre fait le pari avec César que son peuple est encore capable de grandes réalisations.',48,'./Images/asterixetcleopatre.jpg',9.95,20),
('9782012101395',1,10,4,1,'Astérix - Le combat des chefs - n°7','2004-06-16','Le décurion Perclus demande au chef Gaulois Aplusbégalix de défier Abraracourcix en combat des chefs. Mais pour qu''il ait une chance de gagner, reste à éliminer Panoramix…',48,'./Images/asterixlecombatdeschefs.jpg',9.95,20),
('9782871293545',1,6,5,1,'Samurai Deeper Kyo, tome 1','2001-04-14','Quatre années ont passé depuis la terrible bataille de Sekigahara et les samouraïs qui ont survécu sont aujourd''hui des nomades errants à la recherche d''un sens à donner à leur existence. Kyo est l''un d''eux. Médicaments et artifices dans ses bagages, il suit une route dont il ne sait où elle le conduira!',190,'./Images/kyo1.jpg',6.85,40),
('9782871297154',1,6,5,1,'Samurai Deeper Kyo, tome 19','2005-02-04','Kyo explose de colère et affronte Chinmei à la "3e Porte"!! La "Planète noire" de Chinmei attaque le "Suzaku" de Kyo! Yuya et ses amis vont-ils frôler l''espoir ou le désespoir?',190,'./Images/kyo19.jpg',6.85,6),
('9781980923886',1,11,8,1,'Je rêvais d''une autre vie','2008-05-06','Effondrée, Nathalie découvre que depuis plusieurs années sa vie n’est qu’une illusion. Pour tenter de se relever après cette violente révélation, elle choisit de tout changer dans son existence. Elle quitte Paris et décide de se construire une nouvelle vie en province. La rénovation d’une vieille maison bretonne l’amène sur des chemins inattendus. Les lettres et le coffret cachés par Marie-Jeanne, la propriétaire précédente, l’obligent à avancer sur des sables mouvants. Au fil de ses recherches, Nathalie va découvrir la vie de Martina et Jean dans la France d’après-guerre. Quel lien Marie-Jeanne, la petite paysanne bretonne, a-t-elle créé en 1957 avec Martina, cette bourgeoise parisienne?? Cette enquête va redonner un sens à son existence et lui apprendre à se connaître. Les hommes qui croiseront sa route l’aideront à dépasser la trahison.',390,'./Images/jerevaisdunevie.jpg',14,10),
('9782021340747',1,12,8,1,'Bleu de Prusse','2018-05-03','" Bernie Gunther, rusé, subversif, sardonique et extrêmement drôle à l''occasion, illumine ce roman dur et stoïque. " Lee Child 1956. À peine remis des émotions des Pièges de l''exil, Bernie Gunther doit s''enfuir pour sauver sa peau : le marché que lui impose Erich Mielke, numéro deux de la Stasi, est inacceptable. Du cap Ferrat à Sarrebrück, sa cavale héroïque sera semée d''embuches. 1939. Parallèlement, selon une de ces constructions virtuoses dont il a le secret, Philip Kerr nous emmène à Berchtesgaden, où Hitler est attendu pour son cinquantième anniversaire. Quand un ingénieur est assassiné sur la terrasse du Berghof, le nid d''aigle du Führer, c''est la panique : jamais au grand jamais ce sacrilège ne doit être rendu public. Sommé par le général Heydrich de découvrir, et dans la plus absolue discrétion, le coupable, Bernie Gunther ne dispose que d''une semaine pour réussir. Or personne ne semble disposé à l''aider : Martin Bormann règne en tyran à Berchtesgaden – du moins tant que le tyran suprême n''est pas là – et s''y livre à maints trafics lucratifs alimentés par un réseau bien organisé. Et parmi les proches de Hitler en Bavière nombreux sont ceux qui ont des choses à cacher : ils feront tout pour que l''enquête échoue. Plus Gunther approchera de la vérité, plus sa vie sera menacée. Philip Kerr est né en 1956 à Édimbourg. Il a étudié le droit à l''université de Birmingham et la philosophie en Allemagne. Auteur de plus de trente livres acclamés dans le monde entier, il a reçu l''Ellis Peters Historical Dagger de la Crime Writers'' Association en 2009 et de nombreux autres prix. Il partage son temps entre Londres et les Cornouailles. Traduit de l''anglais par Jean Esch',672,'./Images/bleudeprusse.jpg',22.5,50),
('9782954539614',1,13,1,1,'Une fille en danger','2018-04-06','À Paris, dans une rue déserte du 18e arrondissement, le corps d’un homme sauvagement assassiné est retrouvé abandonné en haut d’un arbre. Toutes les traces laissées sur place accablent Aléna, une photographe apparemment sans histoire. Mais pourquoi la jeune femme aurait-elle commis ce crime insolite ? Et surtout, comment ? Gérard Coutard, détective au passé trouble est chargé de la surveiller. Il est connu dans la profession pour sa capacité à dénouer les affaires réputées hors-normes. Certains disent même que ses fréquents séjours en Afrique l’auraient doté de dons particuliers… Gérard découvrira rapidement que la jeune femme cache des capacités physiques étranges : elle marche anormalement vite, elle possède une force surhumaine, elle perçoit la présence de son collaborateur pourtant spécialiste en filature, elle dort très peu et surtout, elle semble souffrir d’une santé mentale altérée. Mais malgré tous ces éléments, Gérard restera convaincu de l’innocence de la photographe. Il percevra même qu’un danger plane sur elle et il se mettra en tête de la protéger, coûte que coûte, quitte à dévier de la mission de surveillance qui lui a été confiée, quitte à mettre ses proches en danger…',330,'./Images/unefilleendanger.jpg',9.99,50),
('9781976945618',1,11,1,1,'PROJET ARTHEMIS: Thriller scientifique','2018-01-21','Au-dessus de la Laponie , deux satellites se percutent. Les services secrets américains et suédois tentent d''étouffer l''affaire, mais Manuel, ingénieur le jour et hacker la nuit, met à jour un complot international. Son amie Charleen, travaillant à la NASA, est alors embarquée malgré elle dans une enquête dont elle ne sortira pas indemne. Lors d''une traque infernale vers les confins les plus sombres du DARKNET et du terrorisme informatique, elle découvrira un autre monde, parallèle au notre, où les hackers font la loi. Elle pourra compter sur un journaliste suédois dans sa course contre la montre pour arrêter le "projet ARTHEMIS". Y arriveront-ils à temps ? Dans la lignée des romans de Dan Brown, ce roman à suspense, mené tambour battant et mêlant aventures, technologie et amour, nous fait voyager du Chili à la Suède, en passant par le Maryland, siège de la NASA et de la NSA. Ingénieur en informatique et spécialisée dans le domaine spatial, Agneta Gerson signe ici un thriller autour d''un fait réel : la collision entre les satellites Iridium-33 et Kosmos-2251. ',238,'./Images/projetarthemis.jpg',12.90,22)

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
(1, 'Fête des pères', '2018-15-10 08:00', '2018-17-10 20:00','Profiter de la fêtes des pères pour offrir des livres',10, './Images/feteperes1.jpg' ),
(2, 'Salon du livre', '2018-09-11 08:00', '2018-15-11 20:00','Le salon de toutes les envies, de nombreuses dédicaces',null,'./Images/salonlivre1.png' ),
(2, 'Spécial rentrée !', '2018-03-09 07:00', '2018-06-09 12:00','La rentrée des classes, retour de vacances, profiter de nos promotions',10,'./Images/salonrentrée2.jpg'),
(2, 'Nöel', '2018-22-12 07:00', '2018-27-12 12:00','Profiter de nöel pour faire plaisir à vos proches',15,'./Images/Evenementnoel.jpg')
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
('Poulain','Amélie','F','poulain.amelie@at.org','5434','0687258700','01/05/2018'),
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
('84 rue du Général Ailleret', '','62300','LENS'),
('59 rue de Strasbourg','','93390','CLICHY-SOUS-BOIS'),
('87 Avenue des Tuileries','','67500','HAGUENAU'),
('86 rue Léon Dierx','','14100','LISIEUX'),
('30 rue Gouin de Beauchesne','','91240','SAINT-MICHEL-SUR-ORGE'),
('43 rue du Gue Jacquet','','86100','CHATELLERAULT'),
('41 Avenue De Marlioz','','06600','ANTIBES'),
('10 Rue Frédéric Chopin','','78000','VERSAILLES'),
('86 rue Victor Hugo','','29900','CONCARNEAU'),
('10 place Stanislas','','44100','NANTES'),
('33 rue Sadi Carnot','','15000','AURILLAC'),
('53  rue Petite Fusterie','','38300','BOURGOIN-JALLIEU'),
('88 Rue du Palais','','93800','ÉPINAY-SUR-SEINE'),
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
('Mathématiques'),
('Biologie'),
('Chimie'),
('Physique'),
('Eau de rose'),
('Amour'),
('Romantique'),
('Théâtre'),
('Comédie'),
('Comique'),
('Dramatique'),
('Drame'),
('Polar'),
('Thiller'),
('Enquête')

/*INSERTION DANS FactureAdresse*/



INSERT INTO FactureAdresse
(adrId,cliId,facNom,facPrenom, facGenre)
VALUES
(1,1,'Dupont','Laurent','H'),
(3,2,'Chandonnet','Christine','F'),
(5,3,'Montminy','Saville', 'H'),
(7,4,'Aubert','Alain','H'),
(9,5,'Poulain','Amélie', 'F'),
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
(10,5,'Poulain','Amélie','F'),
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
('9781980923886',1,1,'2018-13-06 17:22','Avec ces destins de femmes qui s''entrecroisent, Gabrielle Desabers sait tenir le lecteur en haleine. Jusqu''à la conclusion, lorsque les pièces du puzzle finissent par s''imbriquer. Des femmes qui, chacune à sa manière, finissent par devenir qui elles sont. Par vivre la vie qui leur convient. Parce qu''il n''est jamais trop tard et qu''il faut parfois du temps pour se (re)prendre en main, cette histoire parlera à tous ceux (surtout toutes celles !) qui veulent croire en leurs rêves.',5,'233.70.68.61','NON LU'),
('9782330078973',2,10,'2018-20-06 12:15','j''ai cru bêtement qu''il s''agissait d''un nouvel opus et je n''ai pas lu les commentaires....Quelle naïveté de ma part. Un ancien Bussi, soi-disant "revisité", bref, j''ai perdu mon argent et je ne peux m''en prendre qu''à moi-même. Monsieur Bussi a bien raison de ré-éditer d''anciennes pages, tant qu''il y a des gens comme moi pour se faire avoir. C''est le dernier livre que j''achète de cet auteur, le précédent roman m''étant "tombé des mains".',1,'177.252.153.251','NON LU'),
('9782871294146',3,2,'2018-18-06 14:50','Les livres préférés de mon fils de 9 ans. Je ne me trompe jamais quand je lui commande ces ouvrages. Ils les adorent. Ils se lisent de la droite vers la gauche et ça lui plait beaucoup.Bref, du manga comme il les aime. Livré en un temps record. Amazon Prime pour les fêtes de fin d''année c''est vraiment un avantage non négligeable.',5,'192.166.1.1','NON LU'),
('9782871294177',4,3,'2018-18-06 15:50','je kiff naruto et donc forcément les roman aussi. on apprend pas mal de choses sur sasuke et itachi. on lit en étant a leurs place et on peut ressentire ce qu''ils ont ressentie a certain moment de leurs vie.',5,'192.167.1.1','NON LU'),
('9782070584628',5,3,'2018-15-06 16:03','Tout le monde connait Harry Potter mais qui a lu les livres? Après avoir longtemps bataillé avec mon fils qui se contentait des DVD, il a enfin craqué et dévoré toute la série se rendantcompte de la richesse de son contenu par rapport à l''adaptation cinéma.',5,'192.167.1.1','NON LU'),
('9782070584642',6,4,'2018-15-07 15:03','Dommage : l''histoire est super mais les voies des personnages faites par Giraudoux sont vraiment bizarres. ça casse le scénario, ça coupe l''attention que l''on devrait avoir, ça rend l''histoire moins attractive.',2,'192.167.1.1','NON LU'),
('9782871294146',7,4,'2018-15-06 15:03','Je n''ai pas du tout reussi a entrer dans ma lecture, ce qui est bien dommage etant donne que le personnage m''intrigue enormement a la base',2,'192.168.165.1','NON LU'),
('9782871293545',8,4,'2018-15-06 16:03','L''originalité de ce livre est de proposer de fondre deux héros totalement antithétiques dans une seule personne. l''ancrage dans une période historique japonaise rend l''oeuvre passionante et la trâme de l''intrigue qui a cependant un peu de mal à se mettre ne place se referme peu à peu sur les personnages. Les mystères se multiplient et s''assombrissent l''oeuvre pour faire plapiter le lecteur. On trouve aussi du plaisir dans la psychologie des personnages qui révèelent leur faiblesse les uns aux autres tout en tentant de les cacher. Les dessins sont soignés et appréciables. En conclusion, pour les amateurs de manga comportant des samouraïs, une oeuvre assez peu ordinaire que je vous conseille de découvrir.',4,'192.165.1.1','NON LU')