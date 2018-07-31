package classe;

import java.sql.Date;

public class Evenement {

    private String eveId;
    private String utiId;
    private String eveIntitule;
    private String eveDateDebut;
    private String eveDateFin;
    private String eveTauxPromo;
    private String eveUrl;
    private String eveDescription;

    /**
     * ******************************************contructeur************************************************
     */
    public Evenement() {
    }

    public Evenement(String eveId, String eveIntitule, String eveDateDebut, String eveDateFin, String eveTauxPromo, String eveUrl, String eveDescription) {
        this.eveId = eveId;
        this.eveIntitule = eveIntitule;
        this.eveDateDebut = eveDateDebut;
        this.eveDateFin = eveDateFin;
        this.eveTauxPromo = eveTauxPromo;
        this.eveUrl = eveUrl;
        this.eveDescription = eveDescription;
        
    }


    /**
     * ******************************************getters
     * setters************************************************
     */
    public String getEveUrl() {
        return eveUrl;
    }

    public void setEveUrl(String eveUrl) {
        this.eveUrl = eveUrl;
    }

    public String getEveId() {
        return eveId;
    }

    public void setEveId(String eveId) {
        this.eveId = eveId;
    }

    public String getUtiId() {
        return utiId;
    }

    public void setUtiId(String utiId) {
        this.utiId = utiId;
    }

    public String getEveIntitule() {
        return eveIntitule;
    }

    public void setEveIntitule(String eveIntitule) {
        this.eveIntitule = eveIntitule;
    }

    public String getEveDateDebut() {
        return eveDateDebut;
    }

    public void setEveDateDebut(String eveDateDebut) {
        this.eveDateDebut = eveDateDebut;
    }

    public String getEveDateFin() {
        return eveDateFin;
    }

    public void setEveDateFin(String eveDateFin) {
        this.eveDateFin = eveDateFin;
    }

    public String getEveTauxPromo() {
        return eveTauxPromo;
    }

    public void setEveTauxPromo(String eveTauxPromo) {
        this.eveTauxPromo = eveTauxPromo;
    }

    public String getEveDescription() {
        return eveDescription;
    }

    public void setEveDescription(String eveDescription) {
        this.eveDescription = eveDescription;
    }

    /**
     * ******************************************autres
     * methode************************************************
     */
    @Override
    public String toString() {
        return eveIntitule;
    }

    
        /**
     * ******************************************methode InverserDate*************
     * --------------------prend un string de type 2000/12/01 et renvoit 01-12-2000
     * methode************************************************
     */
    public static String InverserDate(String Date){

        Date = Date.substring(6, Date.length()) + "-" + Date.substring(3, 5) + "-" + Date.substring(0, 2);
    return Date;
    }
    
    

    
}
