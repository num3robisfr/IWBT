package classe;

import java.util.Vector;

public class LigneDeCommande {
    
    /*
     * ****************************** MEMBRES *******************************
     */
    private String ligId;
    private String comId;
    private String oeuIsbn;
    private int ligQteCommandee;
    private Double ligPrix;
    private Double ligTva;
    private Double ligTauxPromo;
    
    /*
     * ****************************** METHODES *******************************
     */
    // CONSTRUCTOR

    public LigneDeCommande() {
    }
    
    public LigneDeCommande(String comId, int ligQteCommandee, Double ligPrix, Double ligTva) {
        this.comId = comId;
        this.ligQteCommandee = ligQteCommandee;
        this.ligPrix = ligPrix;
        this.ligTva = ligTva;
    }
    
    public LigneDeCommande(String oeuIsbn, int ligQteCommandee) {
        this.oeuIsbn = oeuIsbn;
        this.ligQteCommandee = ligQteCommandee;
    }

    public LigneDeCommande(String ligId, String comId, String oeuIsbn, int ligQteCommandee, Double ligPrix, Double ligTva) {
        this.ligId = ligId;
        this.comId = comId;
        this.oeuIsbn = oeuIsbn;
        this.ligQteCommandee = ligQteCommandee;
        this.ligPrix = ligPrix;
        this.ligTva = ligTva;
    }
    
    public LigneDeCommande(String ligId, String comId, String oeuIsbn, int ligQteCommandee, Double ligPrix, Double ligTva, Double ligTauxPromo) {
        this.ligId = ligId;
        this.comId = comId;
        this.oeuIsbn = oeuIsbn;
        this.ligQteCommandee = ligQteCommandee;
        this.ligPrix = ligPrix;
        this.ligTva = ligTva;
        this.ligTauxPromo = ligTauxPromo;
    }
    
    // GETTER && SETTER

    public String getLigId() {
        return ligId;
    }

    public void setLigId(String ligId) {
        this.ligId = ligId;
    }

    public String getComId() {
        return comId;
    }

    public void setComId(String comId) {
        this.comId = comId;
    }

    public String getOeuIsbn() {
        return oeuIsbn;
    }

    public void setOeuIsbn(String oeuIsbn) {
        this.oeuIsbn = oeuIsbn;
    }

    public int getLigQteCommandee() {
        return ligQteCommandee;
    }

    public void setLigQteCommandee(int ligQteCommandee) {
        this.ligQteCommandee = ligQteCommandee;
    }

    public Double getLigPrix() {
        return ligPrix;
    }

    public void setLigPrix(Double ligPrix) {
        this.ligPrix = ligPrix;
    }

    public Double getLigTva() {
        return ligTva;
    }

    public void setLigTva(Double ligTva) {
        this.ligTva = ligTva;
    }

    public Double getLigTauxPromo() {
        return ligTauxPromo;
    }

    public void setLigTauxPromo(Double ligTauxPromo) {
        this.ligTauxPromo = ligTauxPromo;
    }
    
    
    /**************************************************************************/
                                /* AUTRES METHODES */
    /**************************************************************************/
    
    
    public void ajouterQte(int qty) {
        this.ligQteCommandee+= qty;
    }
    
    // toString

    @Override
    public String toString() {
        return "LigneDeCommande{" + "ligId=" + ligId + ", comId=" + comId + ", oeuIsbn=" + oeuIsbn + ", ligQteCommandee=" + ligQteCommandee + ", ligPrix=" + ligPrix + ", ligTva=" + ligTva + ", ligTauxPromo=" + ligTauxPromo + '}';
    }
    
    // getVector
    public Object getVector() {
        Vector v = new Vector();
        v.add(comId);
        v.add(ligQteCommandee);
        v.add(ligPrix);
        v.add(ligTva);
        
        return v;
    }
    public Object getVectorFacture() {
        Vector v = new Vector();
        v.add(comId);
        v.add(oeuIsbn);
        v.add(ligQteCommandee);
        v.add(ligPrix);
        v.add(ligTva);
        v.add(ligTauxPromo);
        
        
        return v;
    }
    
    
    /*
     * ***********************************************************************
     */
    
    
    
    
}

/* CL - cdi1804 - 18.06.27 */
