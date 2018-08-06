
package classe;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Vector;

public class Bibliotheque implements Serializable{
    
    
    /*
     * ****************************** MEMBRES *******************************
     */
    private ArrayList laBibliotheque = new ArrayList();

    /*
     * ****************************** METHODES *******************************
     */
    
    // CONSTRUCTOR
    public Bibliotheque() {
        
    }
    
    // GETTER && SETTER

    public ArrayList getLaBibliotheque() {
        return laBibliotheque;
    }

    public void setLaBibliotheque(ArrayList laBibliotheque) {
        this.laBibliotheque = laBibliotheque;
    }
    
    // toString

    @Override
    public String toString() {
        return "Bibliotheque{" + "laBibliotheque=" + laBibliotheque + '}';
    }
    
    /*
    ****************************************************************************
        METHODES POUR REMPLIR LA BIBLIOTHEQUE - ARRAYLIST - 
    ****************************************************************************
     */
    public void add(Commande com) {

        this.laBibliotheque.add(com);

    }
    public void add(beanClient cli) {

        this.laBibliotheque.add(cli);

    }
    public void add(Statut sta) {

        this.laBibliotheque.add(sta);

    }
    public void add(Adresse adr) {

        this.laBibliotheque.add(adr);

    }
    public void add(Vector v) {

        this.laBibliotheque.add(v);
    }
    public void add(ArrayList a) {

        this.laBibliotheque.add(a);
    }
    public void add(Bibliotheque b) {

        this.laBibliotheque.add(b);
    }
    public void add(String s) {

        this.laBibliotheque.add(s);
    }
    public void add(Object o) {

        this.laBibliotheque.add(o);
    }
}

/* CL - cdi1804 - 18.07.03 */

