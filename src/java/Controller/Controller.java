package Controller;

import Model.beanCatalog;
import Model.beanConnect;
import Model.beanOeuvre;
import Model.beanPanier;
import java.io.IOException;
import java.util.ArrayList;
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

        String url = "/WEB-INF/jspAccueil.jsp";

        if (this.getServletContext().getAttribute("connexion") == null) {
            beanConnect beanc = new beanConnect();
            this.getServletContext().setAttribute("connexion", beanc);
        }
        beanConnect beanc = (beanConnect) this.getServletContext().getAttribute("connexion");
        HttpSession session = request.getSession();

        if ("catalog".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspCatalog.jsp";
//            beanConnect beanc = new beanConnect();
            beanCatalog beanca = new beanCatalog();
            beanca.setListeOeuvres(beanca.remplirListeOeuvres(beanc.getConnexion(), "", ""));
            session.setAttribute("liste", beanca.getListeOeuvres());
            for (beanOeuvre b : beanca.getListeOeuvres()) {
                System.out.println(b);
            }
            request.setAttribute("beanca", beanca.getListeOeuvres());
        }
        if ("oeuvre".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspOeuvre.jsp";
            for (beanOeuvre b : (ArrayList<beanOeuvre>) session.getAttribute("liste")) {
                System.out.println("+++++++++" + b.getOeuTitre());
                if (b.getOeuIsbn().equals(request.getParameter("isbn"))) {
                    System.out.println(">>>>>>>>>>>>>>>>" + b);
                    request.setAttribute("oeuvre", b);
                }

            }
        }

        if ("affichePanier".equals(request.getParameter("section"))) {
            url = "/WEB-INF/jspPanier.jsp";

            if (beanc == null) {
                beanc = new beanConnect();
                System.out.println("whuuut ?!!!");
            } else {
                System.out.println("yeah !");
            }

            beanPanier panier = (beanPanier) session.getAttribute("panier");
            if (panier == null) {
                panier = new beanPanier();
                session.setAttribute("panier", panier);
            }
            request.setAttribute("isempty", panier.isEmpty());
            request.setAttribute("list", panier.getList());
        }

        if ("panier".equals(request.getParameter("section"))) {
            beanPanier panier = (beanPanier) session.getAttribute("panier");
            if (panier == null) {
                panier = new beanPanier();
                session.setAttribute("panier", panier);
            }

            if (request.getParameter("doIt") != null) {
                panier.add(request.getParameter("ref"),
                        request.getParameter("qty"));
            }
            if (request.getParameter("add") != null) {
                panier.add(request.getParameter("add"));
            }
            if (request.getParameter("dec") != null) {
                panier.dec(request.getParameter("dec"));
            }
            if (request.getParameter("del") != null) {
                panier.del(request.getParameter("del"));
            }
            if (request.getParameter("clean") != null) {
                panier.clean();
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
