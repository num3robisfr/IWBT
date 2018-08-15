package Controller;

import Model.*;
import Model.beanAgendaEvenement;
import classe.Adresse;
import classe.Evenement;
import classe.LigneDeCommande;
import exception.Exceptions;
import static outil.VerifSaisie.*;
import static outil.OutilsFormatage.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    private Cookie getCookie(Cookie[] cookies, String name) {
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals(name)) {
                    return c;
                }
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

//------------------------------------------------------------------------------
//                         LES VARIABLES GLOBALES
//------------------------------------------------------------------------------ 
        HttpSession session = request.getSession();
        ServletContext application = this.getServletContext();

        beanConnect beanc = (beanConnect) this.getServletContext().getAttribute("beanc");
        beanCatalog beanca = (beanCatalog) session.getAttribute("beanca");
        beanAgendaEvenement beanae = (beanAgendaEvenement) session.getAttribute("beanae");
        beanTheme beant = (beanTheme) session.getAttribute("beant");
        beanSousTheme beanst = (beanSousTheme) session.getAttribute("beanst");
        beanClient beancl = (beanClient) session.getAttribute("beancl");
        ArrayList<beanLigneDeCommande> listeCommande = new ArrayList<>();
        beanCompteClient bcc = new beanCompteClient();

        String checkLogin;
        int id = 0;
        int tampon = 0;
        Map<String, String> erreurs = new HashMap<>();
        Map<String, String> client = new HashMap();
        Map<String, String> resultat = new HashMap();
        ArrayList<Integer> commande = new ArrayList<>();
        String url = "/WEB-INF/jspAccueil.jsp";

        Cookie c = getCookie(request.getCookies(), "username");
        Cookie d = getCookie(request.getCookies(), "ID");

//------------------------------------------------------------------------------
//                             SERIALIZATION
//------------------------------------------------------------------------------ 
        if (beanc == null) {
            beanc = new beanConnect();
            application.setAttribute("beanc", beanc);
        }

        if (beanca == null) {
            beanca = new beanCatalog();
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", ""));
            beanca.setListeNouveautes(beanca.remplirListeNouveautes(beanc.getConnexion()));
            session.setAttribute("beanca", beanca);
        }

        if (beanae == null) {
            beanae = new beanAgendaEvenement();
            beanae.setListeEvenement(beanae.ChargerListeEvenement(beanc.getConnexion(), "WHERE eveDateDebut >= getdate() and eveDateDebut < (getdate()+90)"));
            session.setAttribute("beanae", beanae);
        }

        if (beant == null) {
            beant = new beanTheme();
            session.setAttribute("beant", beant);
        }
        request.setAttribute("AllTheme", beant.getAllTheme(beanc.getConnexion()));

        if (beanst == null) {
            beanst = new beanSousTheme();
            session.setAttribute("beanst", beanst);
        }
        request.setAttribute("AllSousTheme", beanst.GetSousTheme(beanc.getConnexion()));

        if (beancl == null) {
            beancl = new beanClient();
            session.setAttribute("beancl", beancl);
        }

        if (d == null) {
            request.setAttribute("Id", -1);
        } else {
            id = Integer.valueOf(d.getValue());
            d = new Cookie("ID", String.valueOf(id));
            d.setMaxAge(3600 * 24 * 7);
            response.addCookie(d);
            listeCommande = bcc.ChargerListeCommande(beanc.getConnexion(), id);
            session.setAttribute("listeCommande", listeCommande);
        }

        if (c == null) {
            request.setAttribute("okay", "0");

        } else {
            checkLogin = c.getValue();
            c = new Cookie("username", checkLogin);

            c.setMaxAge(3600 * 24 * 7);
            response.addCookie(c);
            request.setAttribute("nom", checkLogin);
            request.setAttribute("okay", "2");

        }
//------------------------------------------------------------------------------
//                              LES SECTIONS
//------------------------------------------------------------------------------ 
        if ("catalog".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspCatalog.jsp";
            request.setAttribute("listeNouv", beanca.getListeNouveautes());
            beanae.setListeEvenement(beanae.ChargerListeEvenement(beanc.getConnexion(), "WHERE eveDateDebut >= getdate() and eveDateDebut < (getdate()+90)"));
            request.setAttribute("listeEvenement", beanae.getListeEvenement());
        }

        if ("OK".equals(request.getParameter("doit"))) {
            url = "/WEB-INF/jspCatalogue.jsp";
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", request.getParameter("search")));
            request.setAttribute("listeSearch", beanca.getListeOeuvres());
        }

        if ("oeuvre".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspOeuvre.jsp";
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", ""));
            for (beanOeuvre b : (ArrayList<beanOeuvre>) beanca.getListeOeuvres()) {
                if (b.getOeuIsbn().equals(request.getParameter("isbn"))) {
                    request.setAttribute("oeuvre", b);
                }
            }
        }
        if ("theme".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspTheme.jsp";
            String theme = null;
            for (beanTheme bt : beant.getAllTheme(beanc.getConnexion())) {
                if (Integer.valueOf(request.getParameter("theId")) == (bt.getId())) {
                    theme = bt.getIntitule();
                }
            }
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "Theme= '" + theme + "' AND ", ""));
            request.setAttribute("listeOeuvTheme", beanca.getListeOeuvres());
            request.setAttribute("theme", theme.toUpperCase());
        }

        if ("sousTheme".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspSousTheme.jsp";
            String sousTheme = request.getParameter("souId");
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "\"Sous Theme\"= '" + sousTheme + "' AND ", ""));
            request.setAttribute("listeOeuvSousTheme", beanca.getListeOeuvres());
            request.setAttribute("soustheme", sousTheme.toUpperCase());
        }

        /////////////////////////////////////////////////////////////////////////////////////
        ///             Clic dans la sidebar 'Agenda Evènements':                         ///
        ///             Affichage de la page Agenda Evènements,                           ///
        ///          chargement du bean  et mise en attribut de la requete                ///
        /////////////////////////////////////////////////////////////////////////////////////
        //
        if ("agenda".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspagendaEvenement.jsp";
            beanae.setListeEvenement(beanae.ChargerListeEvenement(beanc.getConnexion(), " WHERE eveDateFin >= getdate()"));
            request.setAttribute("listeEvenement", beanae.getListeEvenement());
        }

        /////////////////////////////////////////////////////////////////////////////////////
        ///                            Clic sur un Evènement:                           ///               
        ///    Gestion jsp Event : Gère l'affichage des promos et des livres concernés    ///
        /////////////////////////////////////////////////////////////////////////////////////
        //
        if ("evenement".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspEvent.jsp";
            beanca.setListeOeuvresEvenement(beanca.remplirListeOeuvresEvenement(beanc.getConnexion(), request.getParameter("intitule")));
            request.setAttribute("listeevenementoeuvre", beanca.getListeOeuvresEvenement());
            if (beanca.getListeOeuvresEvenement().isEmpty()) {
                request.setAttribute("listevide", "ok");
            } else {
                request.setAttribute("listevide", "notok");
            }
            Evenement evt = new Evenement();
            for (Evenement e : (ArrayList<Evenement>) beanae.getListeEvenement()) {
                if (e.getEveId().equals(request.getParameter("intitule"))) {
                    evt = e;
                    request.setAttribute("evenement", evt);
                    if (e.getEveTauxPromo() != 0) {
                        request.setAttribute("promo", "ok");
                    }
                }
            }
        }

        /////////////////////////////////////////////////////////////////////////////////////
        ///       Clic sur mes commandes dans la sidebar :                                ///
        ///   Gestion l'affichage des commandes d'un client                               ///
        /////////////////////////////////////////////////////////////////////////////////////
        //
        if ("listecommande".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspLogin.jsp";
            tampon = 0;
            if (c != null) {
                if (listeCommande != null) {
                    tampon = listeCommande.get(0).getComId();
                    commande.add(tampon);
                    listeCommande = bcc.ChargerListeCommande(beanc.getConnexion(), id);
                    session.setAttribute("listeCommande", listeCommande);

                    for (int i = 1; i < listeCommande.size(); i++) {
                        if (listeCommande.get(i).getComId() != tampon) {
                            commande.add(listeCommande.get(i).getComId());
                        }
                        tampon = listeCommande.get(i).getComId();
                    }
                    request.setAttribute("tabCommande", commande);
                }
            }
        }

        /////////////////////////////////////////////////////////////////////////////////////
        ///           Clic sur 'identifiez-vous'/'Mon compte' dans la sidebar :           ///
        ///       Gestion jsp login : page de connexion et de gestion de compte           ///
        /////////////////////////////////////////////////////////////////////////////////////
        //
        if ("login".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspLogin.jsp";
            checkLogin = "0";
            if (c != null) {
                checkLogin = c.getValue();
                request.setAttribute("okay", "2");
                listeCommande = bcc.ChargerListeCommande(beanc.getConnexion(), id);
                session.setAttribute("listeCommande", listeCommande);
                tampon = listeCommande.get(0).getComId();
                commande.add(tampon);

                for (int i = 1; i < listeCommande.size(); i++) {
                    if (listeCommande.get(i).getComId() != tampon) {
                        commande.add(listeCommande.get(i).getComId());
                    }
                    tampon = listeCommande.get(i).getComId();
                }
                request.setAttribute("tabCommande", commande);

            } else {
                request.setAttribute("okay", "0");
            }
            /////////////////////////////////////////////////////////////////////////////////////
            ///partie check login/mot de passe, créations Cookies,                      /////////
            ///et attribution des valeur de session et requetes pour gérer affichage    /////////
            /////////////////////////////////////////////////////////////////////////////////////
            //
            if (request.getParameter("oklogin") != null) {
                checkLogin = beancl.checkLogin(beanc.getConnexion(), request.getParameter("login"), request.getParameter("password"));

                if (checkLogin != null) {
                    beancl = new beanClient();
                    beancl = beancl.ChargerBeanClient("cliEmail", request.getParameter("login"), beanc.getConnexion());
                    session.setAttribute("beancl", beancl);
                    id = beancl.getId();

                    listeCommande = bcc.ChargerListeCommande(beanc.getConnexion(), id);
                    session.setAttribute("listeCommande", listeCommande);
                    if (listeCommande != null) {
                        tampon = listeCommande.get(0).getComId();
                        commande.add(tampon);

                        for (int i = 1; i < listeCommande.size(); i++) {
                            if (listeCommande.get(i).getComId() != tampon) {
                                commande.add(listeCommande.get(i).getComId());
                            }
                            tampon = listeCommande.get(i).getComId();

                        }
                        System.out.println(commande);
                        request.setAttribute("tabCommande", commande);
                    }

                    d = new Cookie("ID", String.valueOf(beancl.getId()));
                    d.setMaxAge(3600 * 24 * 7);
                    response.addCookie(d);
                    request.setAttribute("Id", id);

                    request.setAttribute("okay", "2");
                    request.setAttribute("nom", checkLogin);
                    c = new Cookie("username", checkLogin);
                    c.setMaxAge(3600 * 24 * 7);
                    response.addCookie(c);
                } else {
                    request.setAttribute("okay", "1");
                }
            }
            /////////////////////////////////////////////////////////////////////////////////////
            /////////échec connexion et attribution des requetes pour affichage       ///////////
            /////////////////////////////////////////////////////////////////////////////////////
            //
            if (checkLogin == null) {
                request.setAttribute("okay", "1");
            } else if (checkLogin.equals("0")) {
                request.setAttribute("okay", "0");
            }

        }

        /////////////////////////////////////////////////////////////////////////////////////
        ////////             Clic sur 'Deconnexion' dans le header :                    /////
        ////////                      Déconnexion, efface Cookies,                      /////
        ////////      et valorise les attributs pour gérer l'affichage  de la jsp       /////
        /////////////////////////////////////////////////////////////////////////////////////
        //
        if ("logout".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspLogin.jsp";
            d.setMaxAge(0);
            response.addCookie(d);
            request.setAttribute("Id", -1);
            c.setMaxAge(0);
            response.addCookie(c);
            request.setAttribute("okay", "0");
        }

        //////////////////////////////////////////////////////////////////////////////////////////////
        if ("newCompteClient".equals(request.getParameter("section"))) {
            url = "/WEB-INF/newCompteClient.jsp";
        }

        if ("addClient".equals(request.getParameter("client"))) {
            url = "/WEB-INF/newCompteClient.jsp";
            erreurs.clear();
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String numTel = request.getParameter("telephone");

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String genre = request.getParameter("civilite");

            try {
                client.put("genre", retournerType(genre));
            } catch (Exception e) {
                System.out.println("Oops pb avec la methode retournerType");
            }

            try {
                checkNom(nom);
                client.put("nom", nom);
            } catch (Exceptions e) {
                erreurs.put("nom", e.getMessage());
            }
            try {
                checkPrenom(prenom);
                client.put("prenom", prenom);
            } catch (Exceptions e) {
                erreurs.put("prenom", e.getMessage());
            }

            try {
                checkNumTel(numTel);
                client.put("numTel", numTel);
            } catch (Exceptions e) {
                erreurs.put("numTel", e.getMessage());
            }
            try {
                checkEmail(email);
                client.put("email", email);
            } catch (Exceptions e) {
                erreurs.put("email", e.getMessage());
            }
            try {
                checkMdp(password);
                client.put("password", password);
            } catch (Exceptions e) {
                erreurs.put("password", e.getMessage());
            }

            if (erreurs.isEmpty()) {
                System.out.println("addClient : pas d'erreur");
                url = "/WEB-INF/newAdresse.jsp";
            }

            request.setAttribute("erreurs", erreurs);
            request.setAttribute("client", client);
            session.setAttribute("client", client);
        }

        if ("newAdresse".equals(request.getParameter("section"))) {
            url = "/WEB-INF/newAdresse.jsp";
        }

        if ("addAdresse".equals(request.getParameter("adr"))) {
            url = "/WEB-INF/newAdresse.jsp";
            erreurs.clear();
            resultat.clear();
            Map<String, String> hMClient = (HashMap) session.getAttribute("client");
            Map<String, String> hMAdresse = new HashMap<>();
            //Map<String, String> resultat = new HashMap<>();

            beanClient bC = new beanClient(hMClient.get("nom"), hMClient.get("prenom"),
                    hMClient.get("genre"), hMClient.get("email"), hMClient.get("password"),
                    hMClient.get("numTel"));

            String adresse = request.getParameter("adresse");
            String complement = request.getParameter("complement");
            String codePostal = request.getParameter("codePostal");
            String ville = request.getParameter("ville");

            try {
                checkAdresse(adresse);
                hMAdresse.put("adresse", adresse);
            } catch (Exceptions e) {
                erreurs.put("adresse", e.getMessage());
            }
            hMAdresse.put("complement", complement);
            try {
                checkCodePostal(codePostal);
                hMAdresse.put("codePostal", codePostal);
            } catch (Exceptions e) {
                erreurs.put("codePostal", e.getMessage());
            }
            try {
                checkVille(ville);
                hMAdresse.put("ville", ville);
            } catch (Exceptions e) {
                erreurs.put("ville", e.getMessage());
            }

            if (erreurs.isEmpty()) {
                int cliId = bC.AddClient(beanc.getConnexion());
                if (cliId == 0) {
                    resultat.put("erreur", "erreur d'enregistrement");
                    System.out.println("pb d'enregistrement");
                }
                if (cliId > 0) {

                    beanAdresse bA = new beanAdresse(adresse, complement, codePostal, ville, 1);
                    int adrId = bA.AddAdresse(beanc.getConnexion());

                    if (adrId == 0) {
                        resultat.put("erreur", "erreur d'enregistrement");
                    }
                    if (adrId > 0) {
                        int res = bA.AddAdrFacturation(beanc.getConnexion(), adrId, cliId, bC);

                        resultat.put("message", "enregistrement effectué avec succés");
                    }

                }
            }

            request.setAttribute("erreurs", erreurs);
            request.setAttribute("adresse", hMAdresse);
            request.setAttribute("resultat", resultat);
        }

        //section pour la gestion du compte
        if ("infopersonnelle".equals(request.getParameter("section"))) {
            url = "/WEB-INF/CompteManager.jsp";

        }

        if ("modCompteClient".equals(request.getParameter("section"))) {
            url = "/WEB-INF/modCompteClient.jsp";

            if (d != null) {

                beancl = new beanClient();
                //beancl = beancl.ChargerBeanClient("cliId", d.getValue(), beanc.getConnexion());
                beancl = (beanClient) session.getAttribute("beancl");

                request.setAttribute("client", beancl);

            }

        }

        if ("modClient".equals(request.getParameter("client"))) {
            url = "/WEB-INF/modCompteClient.jsp";
            erreurs.clear();
            resultat.clear();
            int idClient = Integer.valueOf(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String numTel = request.getParameter("telephone");

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String genre = retournerType(request.getParameter("civilite"));
            //Map<String, String> resultat = new HashMap<>();

            beanClient bc = new beanClient(idClient,
                    nom, prenom, genre, email, password, numTel);

            try {
                checkNom(nom);
                client.put("nom", nom);
            } catch (Exceptions e) {
                erreurs.put("nom", e.getMessage());
            }
            try {
                checkPrenom(prenom);
                client.put("prenom", prenom);
            } catch (Exceptions e) {
                erreurs.put("prenom", e.getMessage());
            }

            try {
                checkNumTel(numTel);
                client.put("telephone", numTel);
            } catch (Exceptions e) {
                erreurs.put("numTel", e.getMessage());
            }
            try {
                checkEmail(email);
                client.put("email", email);
            } catch (Exceptions e) {
                erreurs.put("email", e.getMessage());
            }
            try {
                checkMdp(password);
                client.put("password", password);
            } catch (Exceptions e) {
                erreurs.put("password", e.getMessage());
            }

            if (erreurs.isEmpty()) {
                resultat.put("message", bc.ModClient(beanc.getConnexion()));
            }

            request.setAttribute("erreurs", erreurs);
            request.setAttribute("client", client);
            session.setAttribute("client", client);
            request.setAttribute("resultat", resultat);

        }

        if ("AdresseManager".equals(request.getParameter("section"))) {
            url = "/WEB-INF/AdresseManager.jsp";

            ArrayList<beanAdresse> bAdrFac = new ArrayList<beanAdresse>();
            ArrayList<beanAdresse> bAdrLiv = new ArrayList<beanAdresse>();
            
            if (d != null) {
            bAdrFac = bcc.ChargerListeAdresseFacturation(beanc.getConnexion(), Integer.valueOf(d.getValue()));
            request.setAttribute("adrfac", bAdrFac);
            bAdrLiv = bcc.ChargerListeAdresseLivraison(beanc.getConnexion(), Integer.valueOf(d.getValue()));
            request.setAttribute("adrliv", bAdrLiv);
            }
        }
        
        if ("Add".equals(request.getParameter("Adresse"))) {
            url = "/WEB-INF/AddAdresse.jsp";
        }
        
        if ("checkAdd".equals(request.getParameter("Adresse"))) {
                        url = "/WEB-INF/AddAdresse.jsp";
            erreurs.clear();
            resultat.clear();
            int idClient = Integer.valueOf(d.getValue());
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String genre = retournerType(request.getParameter("civilite"));
            String adresse = request.getParameter("adresse");
            String complement = request.getParameter("complement");
            String codePostal = request.getParameter("codePostal");
            String ville = request.getParameter("ville");
            String type = request.getParameter("type");
            
            try {
                checkNom(nom);
                client.put("nom", nom);
            } catch (Exceptions e) {
                erreurs.put("nom", e.getMessage());
            }
            try {
                checkPrenom(prenom);
                client.put("prenom", prenom);
            } catch (Exceptions e) {
                erreurs.put("prenom", e.getMessage());
            }
            try {
                checkAdresse(adresse);
                client.put("adresse", adresse);
            } catch (Exceptions e) {
                erreurs.put("adresse", e.getMessage());
            }
            client.put("complement", complement);
            try {
                checkCodePostal(codePostal);
                client.put("codePostal", codePostal);
            } catch (Exceptions e) {
                erreurs.put("codePostal", e.getMessage());
            }
            try {
                checkVille(ville);
                client.put("ville", ville);
            } catch (Exceptions e) {
                erreurs.put("ville", e.getMessage());
            }

            if(erreurs.isEmpty()){
                beanAdresse bA = new beanAdresse(idClient, genre, nom, prenom, adresse, complement, codePostal, ville, 1, type);
                beanClient bC = new beanClient(nom, prenom, genre);
                
                if (type.equals("facturation")) {
                    int adrId = bA.AddAdresse(beanc.getConnexion());
                    if (adrId == '0') {
                        resultat.put("erreur", "erreur d'enregistrement");
                    }
                    if (adrId != '0') {
                        int res = bA.AddAdrFacturation(beanc.getConnexion(), adrId, idClient, bC);
                        if (res == '0') {
                            resultat.put("erreur", "erreur d'enregistrement");
                        }
                        if (res != '0') {
                            resultat.put("message", "adresse ajoutée");
                        }
                    }
                }
                   if (type.equals("livraison")) {
                    int adrId = bA.AddAdresse(beanc.getConnexion());
                    if (adrId == '0') {
                        resultat.put("erreur", "erreur d'enregistrement");
                    }
                    if (adrId != '0') {
                        int res = bA.AddAdrLivraison(beanc.getConnexion(), adrId, idClient, bC);
                        if (res == '0') {
                            resultat.put("erreur", "erreur d'enregistrement");
                        }
                        if (res != '0') {
                            resultat.put("message", "adresse ajoutée");
                        }
                    }
                }
                
            }
        request.setAttribute("erreurs", erreurs);
        request.setAttribute("client", client);
        request.setAttribute("resultat", resultat);    
            
        }
        
        

        // partie Panier 
        if ("affichePanier".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspPanier.jsp";

            beanPanier panier = (beanPanier) session.getAttribute("panier");
            if (panier == null) {
                panier = new beanPanier();
                session.setAttribute("panier", panier);

            }
            request.setAttribute("isempty", panier.isEmpty());
            request.setAttribute("list", panier.getList());

            if (request.getParameter("add") != null) {
                panier.add(request.getParameter("urlImage"),
                        request.getParameter("ref"),
                        request.getParameter("titre"),
                        request.getParameter("prix"));
                url = "/WEB-INF/jspPanier.jsp";

            }
            if (request.getParameter("dec") != null) {
                panier.dec(request.getParameter("urlImage"),
                        request.getParameter("ref"),
                        request.getParameter("titre"),
                        request.getParameter("prix"));
                session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
                if (panier.isEmpty()) {
                    request.setAttribute("isempty", panier.isEmpty());
                    session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
                    url = "/WEB-INF/jspPanier.jsp";
                }
            }
            if (request.getParameter("del") != null) {
                panier.del(request.getParameter("ref"));
                session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
                if (panier.isEmpty()) {
                    request.setAttribute("isempty", panier.isEmpty());
                    session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
                    url = "/WEB-INF/jspPanier.jsp";
                }
            }

            if (request.getParameter("clean") != null) {
                panier.clean();
                session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
                request.setAttribute("isempty", panier.isEmpty());
                url = "/WEB-INF/jspPanier.jsp";
            }

            session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
            System.out.println("panier.getTotal() = " + panier.getTotal(request.getParameter("ref")));
        }

        if ("panier".equals(request.getParameter("section"))) {

            beanPanier panier = (beanPanier) session.getAttribute("panier");
            if (panier == null) {
                panier = new beanPanier();
                session.setAttribute("panier", panier);
            }

            if (request.getParameter("ajout") != null) {
                panier.add(request.getParameter("urlImage"),
                        request.getParameter("ref"),
                        request.getParameter("titre"),
                        request.getParameter("prix"));
                session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
                url = "Controller?section=oeuvre&isbn=request.getParameter(\"ref\")";
                for (beanOeuvre b : (ArrayList<beanOeuvre>) beanca.getListeOeuvres()) {
                    if (b.getOeuIsbn().equals(request.getParameter("ref"))) {
                        request.setAttribute("oeuvre", b);
                    }
                }
            }

            if (request.getParameter("ajoutV2") != null) {
                panier.add(request.getParameter("urlImage"),
                        request.getParameter("ref"),
                        request.getParameter("titre"),
                        request.getParameter("prix"));
                session.setAttribute("total", panier.getTotal(request.getParameter("ref")));
            }

        }

        request.getRequestDispatcher(url).include(request, response);
    }

//------------------------------------------------------------------------------
//                                 AUTRES
//------------------------------------------------------------------------------ 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
