package classe;

import java.sql.Date;
import java.util.Vector;

public class Commande extends Bibliotheque implements Comparable<Commande> {

    /*
     * ****************************** MEMBRES *******************************
     */
    private int comId;
    private int cliId;
    private int adrIdFacture;
    private int adrIdLivraison;
    private Date comDate;
    private int comStatut;
    private String comObservation;
    private String comIp;

    
    /*
     * ****************************** METHODES *******************************
     */
    // CONSTRUCTOR
    public Commande() {

    }

    public Commande(int comId, int cliId) {
        this.comId = comId;
        this.cliId = cliId;
    }
    
    public Commande(int comId, Date comDate, int comStatut) {
        this.comId = comId;
        this.comDate = comDate;
        this.comIp = comIp;
        this.comStatut = comStatut;
    }
    
    public Commande(int comId, Date comDate, String comIp, int comStatut) {
        this.comId = comId;
        this.comDate = comDate;
        this.comIp = comIp;
        this.comStatut = comStatut;
    }

    public Commande(int comId, int cliId, Date comDate, int comStatut, String comIp) {
        this.comId = comId;
        this.cliId = cliId;
        this.comDate = comDate;
        this.comStatut = comStatut;
        this.comIp = comIp;
    }
    
    public Commande(int comId, Date comDate, int comStatut, String comIp, String comObservation) {
        this.comId = comId;
        this.comDate = comDate;
        this.comStatut = comStatut;
        this.comIp = comIp;
        this.comObservation = comObservation;
    }

    // GETTER && SETTER
    
    
    public int getComId() {
        return comId;
    }

    public void setComId(int comId) {
        this.comId = comId;
    }

    public int getCliId() {
        return cliId;
    }

    public void setCliId(int cliId) {
        this.cliId = cliId;
    }

    public int getAdrIdFacture() {
        return adrIdFacture;
    }

    public void setAdrIdFacture(int adrIdFacture) {
        this.adrIdFacture = adrIdFacture;
    }

    public int getAdrIdLivraison() {
        return adrIdLivraison;
    }

    public void setAdrIdLivraison(int adrIdLivraison) {
        this.adrIdLivraison = adrIdLivraison;
    }

    public Date getComDate() {
        return comDate;
    }

    public void setComDate(Date comDate) {
        this.comDate = comDate;
    }

    public int getComStatut() {
        return comStatut;
    }

    public void setComStatut(int comStatut) {
        
        this.comStatut = comStatut;
    }

    public String getComObservation() {
        return comObservation;
    }

    public void setComObservation(String comObservation) {
        this.comObservation = comObservation;
    }

    public String getComIp() /*throws Exceptions*/ {
//        if (comIp == null) {
//            throw new Exceptions("Un nom ne peut etre null");
//        }
//        if (comIp.trim().isEmpty()) {
//            throw new Exceptions("Un nom ne peut etre vide");
//        }
//        if (comIp.trim().length() < 2) {
//            throw new Exceptions("Un nom doit faire au moins 2 caractères");
//        }
//        if (comIp.matches("([0-9]{3}[.]){3}([0-9]{3})")) {
//            throw new Exceptions("L'ip doit avoir un format IPv4");
//        }
        return comIp;
    }

    public void setComIp(String comIp) {
        this.comIp = comIp;
    }
    


    // toString
    @Override    
    public String toString() {
        return "Commande{" + "comId=" + comId + ", cliId=" + cliId + ", adrIdFacture=" + adrIdFacture + ", adrIdLivraison=" + adrIdLivraison + ", comDate=" + comDate + ", comStatut=" + comStatut + ", comObservation=" + comObservation + ", comIp=" + comIp + '}';
    }

    // getVector
    public Object getVector() {
        Vector v = new Vector();
        v.add(comId);
        v.add(comDate);
        v.add(comIp);
        v.add(comStatut);

        return v;
    }
    
     public Object getVector2() {
        Vector v = new Vector();
        v.add(comId);
        v.add(comDate);
        v.add(comStatut);
        
        return v;
    }

    /*
     * ***********************************************************************
     */
    // IMPLEMENTATION DE LA METHODE DE L'INTERFACE COMPARABLE
    // Trier par Rôles (== Droits / Statuts)
    @Override
    public int compareTo(Commande o) {
        Date comDate1 = this.comDate;
        Date comDate2 = o.comDate;

        if ((comDate1 == null) && (comDate2 == null)) {
            return 0;
        } else if (comDate1 == null) {
            return -1;
        } else if (comDate2 == null) {
            return 1;
        } else {
            int comparDate = comDate1.compareTo(comDate2);

            //tests ternaires pour tri sur autres champs
            int resultat = (comparDate != 0) ? comparDate : String.valueOf(this.comId).compareTo(String.valueOf(o.comId));

            return resultat;
        }

    }

    /*
     * ***********************************************************************
     */
}

/* CL - cdi1804 - 18.06.27 */
