
package classe;

public class Facture extends Bibliotheque {

/*
 * ****************************** MEMBRES *******************************
 */
    private String facId;
    private String facDate;
    private String cliId;
    private String facAdrId;

    
/*
 * ****************************** METHODES *******************************
 */
    // CONSTRUCTOR
    public Facture() {

    }
    
    public Facture(String facId, String cliId, String facAdrId) {
        this.facId = facId;
        this.cliId = cliId;
        this.facAdrId = facAdrId;
    }
    
    // GETTER && SETTER
    
    public String getFacId() {
        return facId;
    }

    public void setFacId(String facId) {
        this.facId = facId;
    }

    public String getFacDate() {
        return facDate;
    }

    public void setFacDate(String facDate) {
        this.facDate = facDate;
    }

    public String getCliId() {
        return cliId;
    }

    public void setCliId(String cliId) {
        this.cliId = cliId;
    }

    public String getFacAdrId() {
        return facAdrId;
    }

    public void setFacAdrId(String facAdrId) {
        this.facAdrId = facAdrId;
    }
    
    // toString
    @Override
    public String toString() {
        return "Facture{" + "facId=" + facId + ", facDate=" + facDate + ", cliId=" + cliId + ", facAdrId=" + facAdrId + '}';
    }
    
    
    

    /*
     * ***********************************************************************
     */   
}

/* CL - cdi1804 - 18.07.06 */
