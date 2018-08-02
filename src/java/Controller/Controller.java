package Controller;

import Model.*;
import Model.beanAgendaEvenement;
import classe.Evenement;
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

        Map<String, String> erreurs = new HashMap<String, String>();
        Map<String, String> client = new HashMap<String, String>();
        String url = "/WEB-INF/jspAccueil.jsp";

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
            beanae.setListeEvenement(beanae.ChargerListeEvenement(beanc.getConnexion()));
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
//------------------------------------------------------------------------------
//                              LES SECTIONS
//------------------------------------------------------------------------------ 
        if ("catalog".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspCatalog.jsp";
            request.setAttribute("listeNouv", beanca.getListeNouveautes());
            request.setAttribute("listeEvenement", beanae.getListeEvenement());
        }

        if ("OK".equals(request.getParameter("doit"))) {
            url = "/WEB-INF/jspCatalogue.jsp";
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", request.getParameter("search")));
            request.setAttribute("listeSearch", beanca.getListeOeuvres());
        }

        if ("oeuvre".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspOeuvre.jsp";
            for (beanOeuvre b : (ArrayList<beanOeuvre>) beanca.getListeOeuvres()) {
                if (b.getOeuIsbn().equals(request.getParameter("isbn"))) {
                    request.setAttribute("oeuvre", b);
                }
            }
        }
        if ("theme".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspTheme.jsp";
            String theme = null;
            for (beanTheme t : beant.getAllTheme(beanc.getConnexion())) {
                if (Integer.valueOf(request.getParameter("theId")) == (t.getId())) {
                    theme = t.getIntitule();
                }
            }
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "Theme= '" + theme + "' AND ", ""));
            request.setAttribute("listeOeuvTheme", beanca.getListeOeuvres());
            request.setAttribute("theme", theme);
        }

        if ("evenement".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspEvent.jsp";
            beanca.setListeOeuvresEvenement(beanca.remplirListeOeuvresEvenement(beanc.getConnexion(), request.getParameter("intitule")));
            request.setAttribute("listeevenementoeuvre", beanca.getListeOeuvresEvenement());

            for (Evenement e : (ArrayList<Evenement>) beanae.getListeEvenement()) {
                if (e.getEveId().equals(request.getParameter("intitule"))) {
                    request.setAttribute("evenement", e);
                }
            }
        }

        if ("login".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspLogin.jsp";
            String checkLogin = "0";
            if (request.getParameter("oklogin") != null) {
                System.out.println(request.getParameter("login")+" "+request.getParameter("password"));
                checkLogin = beancl.checkLogin(beanc.getConnexion(), request.getParameter("login"), request.getParameter("password"));
            }
            if (checkLogin != null) {
                request.setAttribute("okay", checkLogin);
            } else {
                request.setAttribute("okay", "1");
            }
            
            
        }

        if ("newCompteClient".equals(request.getParameter("section"))) {
            url = "/WEB-INF/newCompteClient.jsp";
        }
        
        if ("addClient".equals(request.getParameter("client"))) {
            url = "/WEB-INF/newCompteClient.jsp";
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String numTel = request.getParameter("telephone");
            String dateNaissance = request.getParameter("dateNaissance");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String genre = request.getParameter("civilite");
            
            try {
                client.put("genre", retournerType(genre));
            } catch (Exception e) {
                System.out.println("Oops pb avce la methode retournerType");
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
                checkDate(dateNaissance);
                client.put("dateNaissance", dateNaissance);
            } catch (Exceptions e) {
                erreurs.put("dateNaissance", e.getMessage());
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
        
        if ("addAdresse".equals(request.getParameter("adresse"))){
            url = "/WEB-INF/newAdresse.jsp";
            
            Map<String, String> hM  = (HashMap<String, String>) session.getAttribute("client");
            
            beanClient bC = new beanClient(hM.get("nom"),hM.get("prenom"),hM.get("genre"),hM.get("email"),hM.get("password"),hM.get("numTel"));
            
        }

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
                panier.add(request.getParameter("urlImage"), request.getParameter("ref"), request.getParameter("titre"));
                url = "/WEB-INF/jspPanier.jsp";

            }
            if (request.getParameter("dec") != null) {
                panier.dec(request.getParameter("urlImage"), request.getParameter("ref"), request.getParameter("titre"));
                if (panier.isEmpty()) {
                    request.setAttribute("isempty", panier.isEmpty());
                    url = "/WEB-INF/jspPanier.jsp";
                }
            }
            if (request.getParameter("del") != null) {
                panier.del(request.getParameter("ref"));
                if (panier.isEmpty()) {
                    request.setAttribute("isempty", panier.isEmpty());
                    url = "/WEB-INF/jspPanier.jsp";
                }
            }
            if (request.getParameter("clean") != null) {
                panier.clean();
                request.setAttribute("isempty", panier.isEmpty());
                url = "/WEB-INF/jspPanier.jsp";
            }
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
                        request.getParameter("qty"));
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
                        request.getParameter("qty"));
            }

            if (request.getParameter("ref") != null) {
                panier.add(request.getParameter("urlImage"), request.getParameter("ref"), request.getParameter("titre"));

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