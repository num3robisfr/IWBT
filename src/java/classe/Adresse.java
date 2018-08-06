
package classe;

import java.io.Serializable;

public class Adresse implements Serializable{
    
    private int adrId;
    private int cliId;
    private String nomAdresse;
    private String prenomAdresse;
    private String adrVoie;
    private String adrComplement;
    private String adrCodePostal;
    private String adrVille;
    private String adrPays;
    private int adrStatut;

    public Adresse() {
    }

    public Adresse(int adrId, int cliId, String adrVoie, String adrComplement, String adrCodePostal, String adrVille) {
        this.adrId = adrId;
        this.cliId = cliId;
        this.adrVoie = adrVoie;
        this.adrComplement = adrComplement;
        this.adrCodePostal = adrCodePostal;
        this.adrVille = adrVille;
    }

    public Adresse(int adrId, int cliId, String nomAdresse, String prenomAdresse, String adrVoie, String adrComplement, String adrCodePostal, String adrVille) {
        this.adrId = adrId;
        this.cliId = cliId;
        this.nomAdresse = nomAdresse;
        this.prenomAdresse = prenomAdresse;
        this.adrVoie = adrVoie;
        this.adrComplement = adrComplement;
        this.adrCodePostal = adrCodePostal;
        this.adrVille = adrVille;
    }
    
    public Adresse(int adrId, int cliId, String nomAdresse, String prenomAdresse, String adrVoie, String adrComplement, String adrCodePostal, String adrVille, String adrPays) {
        this.adrId = adrId;
        this.cliId = cliId;
        this.nomAdresse = nomAdresse;
        this.prenomAdresse = prenomAdresse;
        this.adrVoie = adrVoie;
        this.adrComplement = adrComplement;
        this.adrCodePostal = adrCodePostal;
        this.adrVille = adrVille;
        this.adrPays = adrPays;
    }

    public Adresse(int adrId, int cliId, String nomAdresse, String prenomAdresse, String adrVoie, String adrComplement, String adrCodePostal, String adrVille, String adrPays, int adrStatut) {
        this.adrId = adrId;
        this.cliId = cliId;
        this.nomAdresse = nomAdresse;
        this.prenomAdresse = prenomAdresse;
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

    public String getNomAdresse() {
        return nomAdresse;
    }

    public void setNomAdresse(String nomAdresse) {
        this.nomAdresse = nomAdresse;
    }

    public String getPrenomAdresse() {
        return prenomAdresse;
    }

    public void setPrenomAdresse(String prenomAdresse) {
        this.prenomAdresse = prenomAdresse;
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
        return "Adresse{" + ", adrId=" + adrId + ", adrVoie=" + adrVoie +", adrComplement=" + adrComplement + ", adrCodePostal=" + adrCodePostal + ", adrVille=" + adrVille + ", adrPays=" + adrPays + '}';
    }
    
    
    
}
