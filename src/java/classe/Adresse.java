
package classe;

import java.io.Serializable;

public class Adresse implements Serializable{
    
    private int adrId;
    private int cliId;
    private String adrNom;
    private String adrPrenom;
    private String adrGenre;
    private String adrVoie;
    private String adrComplement;
    private String adrCodePostal;
    private String adrVille;
    private String adrPays;
    private int adrStatut;

    public Adresse() {
    }

    public Adresse(int adrId, int cliId, String adrNom, String adrPrenom, String adrGenre, String adrVoie, String adrComplement, String adrCodePostal, String adrVille, String adrPays, int adrStatut) {
        this.adrId = adrId;
        this.cliId = cliId;
        this.adrNom = adrNom;
        this.adrPrenom = adrPrenom;
        this.adrGenre = adrGenre;
        this.adrVoie = adrVoie;
        this.adrComplement = adrComplement;
        this.adrCodePostal = adrCodePostal;
        this.adrVille = adrVille;
        this.adrPays = adrPays;
        this.adrStatut = adrStatut;
    }

    public int getAdrId() {
        return adrId;
    }

    public void setAdrId(int adrId) {
        this.adrId = adrId;
    }

    public int getCliId() {
        return cliId;
    }

    public void setCliId(int cliId) {
        this.cliId = cliId;
    }

    public String getAdrNom() {
        return adrNom;
    }

    public void setAdrNom(String adrNom) {
        this.adrNom = adrNom;
    }

    public String getAdrPrenom() {
        return adrPrenom;
    }

    public void setAdrPrenom(String adrPrenom) {
        this.adrPrenom = adrPrenom;
    }

    public String getAdrGenre() {
        return adrGenre;
    }

    public void setAdrGenre(String adrGenre) {
        this.adrGenre = adrGenre;
    }

    public String getAdrVoie() {
        return adrVoie;
    }

    public void setAdrVoie(String adrVoie) {
        this.adrVoie = adrVoie;
    }

    public String getAdrComplement() {
        return adrComplement;
    }

    public void setAdrComplement(String adrComplement) {
        this.adrComplement = adrComplement;
    }

    public String getAdrCodePostal() {
        return adrCodePostal;
    }

    public void setAdrCodePostal(String adrCodePostal) {
        this.adrCodePostal = adrCodePostal;
    }

    public String getAdrVille() {
        return adrVille;
    }

    public void setAdrVille(String adrVille) {
        this.adrVille = adrVille;
    }

    public String getAdrPays() {
        return adrPays;
    }

    public void setAdrPays(String adrPays) {
        this.adrPays = adrPays;
    }

    public int getAdrStatut() {
        return adrStatut;
    }

    public void setAdrStatut(int adrStatut) {
        this.adrStatut = adrStatut;
    }

    @Override
    public String toString() {
        return "Adresse{" + "adrId=" + adrId + ", cliId=" + cliId + ", adrNom=" + adrNom + ", adrPrenom=" + adrPrenom + ", adrGenre=" + adrGenre + ", adrVoie=" + adrVoie + ", adrComplement=" + adrComplement + ", adrCodePostal=" + adrCodePostal + ", adrVille=" + adrVille + ", adrPays=" + adrPays + ", adrStatut=" + adrStatut + '}';
    }

    
    


    



    
    
    
}
