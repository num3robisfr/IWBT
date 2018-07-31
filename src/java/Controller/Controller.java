package Controller;

import DAO.DataAccessTheme;
import Model.beanCatalog;
import Model.beanConnect;
import Model.beanOeuvre;
import Model.beanPanier;
import Model.beanPanierV2;
import classe.AgendaEvenement;
import classe.Evenement;
import classe.Theme;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String url = "/WEB-INF/jspAccueil.jsp";

        if (this.getServletContext().getAttribute("connexion") == null) {
            beanConnect beanc = new beanConnect();
            this.getServletContext().setAttribute("connexion", beanc);
        }
        beanConnect beanc = (beanConnect) this.getServletContext().getAttribute("connexion");
        HttpSession session = request.getSession();

        beanCatalog beanca = new beanCatalog();
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", ""));
            session.setAttribute("liste2", beanca.getListeOeuvres());
        //ca ne passe pas les paramètres :(  nico
        request.setAttribute("AllTheme", DataAccessTheme.getAllTheme());
        request.setAttribute("AllSousTheme", DataAccessTheme.getAllSousTheme());

        if ("catalog".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspCatalog.jsp";

            beanca.setListeNouveautes(beanca.remplirListeNouveautes(beanc.getConnexion()));
            session.setAttribute("liste", beanca.getListeNouveautes());
            request.setAttribute("beanca", beanca.getListeNouveautes());
            
            AgendaEvenement listeEvenement = new AgendaEvenement();
            listeEvenement.setListeEvenement(listeEvenement.ChargerListeEvenement());
            request.setAttribute("listeevenement", listeEvenement.getListeEvenement());
            session.setAttribute("listeEvenement", listeEvenement.getListeEvenement());
        }

        if ("OK".equals(request.getParameter("doit"))) {
            url = "/WEB-INF/jspCatalogue.jsp";
//            beanConnect beanc = new beanConnect();
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", request.getParameter("search")));
            request.setAttribute("beanca2", beanca.getListeOeuvres());
        }

        if ("oeuvre".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspOeuvre.jsp";
            for (beanOeuvre b : (ArrayList<beanOeuvre>) session.getAttribute("liste2")) {
                if (b.getOeuIsbn().equals(request.getParameter("isbn"))) {
                    request.setAttribute("oeuvre", b);
                }
            }
        }
        if ("theme".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspTheme.jsp";
            String theme=null;
            for (Theme t : DataAccessTheme.getAllTheme()) {
                if (Integer.valueOf(request.getParameter("theId"))==(t.getId())) {
                   theme=t.getIntitule();
                }
            }
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "Theme= '" + theme +"' AND ", ""));
            request.setAttribute("beanca3", beanca.getListeOeuvres());
            request.setAttribute("theme", theme);
        }
        
                if ("evenement".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspEvent.jsp";
            beanCatalog boe = new beanCatalog();
            boe.setListeOeuvresEvenement(boe.remplirListeOeuvresEvenement(beanc.getConnexion(), request.getParameter("intitule")));
            request.setAttribute("listeevenementoeuvre", boe.getListeOeuvresEvenement());
            session.setAttribute("listeevenementoeuvre",  boe.getListeOeuvresEvenement());
            for (Evenement e: (ArrayList<Evenement>) session.getAttribute("listeEvenement")) {
                if (e.getEveId().equals(request.getParameter("intitule"))) {
                    request.setAttribute("evenement", e);
                }
            }
        }

        if ("login".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspLogin.jsp";
        }

        if ("newCompteClient".equals(request.getParameter("section"))) {
            url = "/WEB-INF/newCompteClient.jsp";
        }

        if ("affichePanier".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspPanier.jsp";

//            if (beanc==null) {
//                beanc = new beanConnect();
//                System.out.println("whuuut ?!!!");
//            }
//            else {
//                System.out.println("yeah !");
//            }
            beanPanierV2 panier = (beanPanierV2) session.getAttribute("panier");
            if (panier == null) {
                panier = new beanPanierV2();
                session.setAttribute("panier", panier);
            }
            request.setAttribute("isempty", panier.isEmpty());
            request.setAttribute("list", panier.getList());

            if (request.getParameter("add") != null) {
                panier.add(request.getParameter("addUrlImage"), request.getParameter("add"));
            }
            if (request.getParameter("dec") != null) {
                panier.dec(request.getParameter("dec"));
                if (panier.isEmpty()) {
                    request.setAttribute("isempty", panier.isEmpty());
                    url = "/WEB-INF/jspPanier.jsp";
                }
            }
            if (request.getParameter("del") != null) {
                panier.del(request.getParameter("del"));
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

            beanPanierV2 panier = (beanPanierV2) session.getAttribute("panier");
            if (panier == null) {
                panier = new beanPanierV2();
                session.setAttribute("panier", panier);
            }

            if (request.getParameter("doIt") != null) {
                panier.add(request.getParameter("urlImage"),
                        request.getParameter("ref"),
                        request.getParameter("qty"));
            }
            if (request.getParameter("add") != null) {
                panier.add(request.getParameter("addUrlImage"), request.getParameter("add"));
            }

        }

        request.getRequestDispatcher(url).include(request, response);
    }

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

/* CL - cdi1804 - 18.07.23 */
