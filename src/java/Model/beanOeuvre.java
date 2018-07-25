package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class beanOeuvre implements Serializable {

    private String oeuIsbn;
    private String oeuTitre;
    private String oeuSousTitre;
    private String autNom;
    private String ediNom;
    private String oeuDateParution;
    private String oeuResume;
    private Integer oeuNbrePage;
    private String oeuUrlImage;
    private String theIntitule;
    private String souIntitule;
    private Float oeuPrix;
    private String tvaTaux;
    private String oeuNbreCmt;
    private String oeuMoyenneCmt;
    private Integer oeuQte;
    private String oeuStatut;

    public beanOeuvre() {
    }

    public beanOeuvre(String oeuIsbn, String oeuTitre, String oeuSousTitre, String autNom, String ediNom, String oeuDateParution, String oeuResume, Integer oeuNbrePage, String oeuUrlImage, String theIntitule, String souIntitule, Float oeuPrix, String tvaTaux, String oeuNbreCmt, String oeuMoyenneCmt, String oeuStatut) {
        this.oeuIsbn = oeuIsbn;
        this.oeuTitre = oeuTitre;
        this.oeuSousTitre = oeuSousTitre;
        this.autNom = autNom;
        this.ediNom = ediNom;
        this.oeuDateParution = oeuDateParution;
        this.oeuResume = oeuResume;
        this.oeuNbrePage = oeuNbrePage;
        this.oeuUrlImage = oeuUrlImage;
        this.theIntitule = theIntitule;
        this.souIntitule = souIntitule;
        this.oeuPrix = oeuPrix;
        this.tvaTaux = tvaTaux;
        this.oeuNbreCmt = oeuNbreCmt;
        this.oeuMoyenneCmt = oeuMoyenneCmt;
        this.oeuStatut = oeuStatut;
    }

    public String getOeuIsbn() {
        return oeuIsbn;
    }

    public void setOeuIsbn(String oeuIsbn) {
        this.oeuIsbn = oeuIsbn;
    }

    public String getOeuTitre() {
        return oeuTitre;
    }

    public void setOeuTitre(String oeuTitre) {
        this.oeuTitre = oeuTitre;
    }

    public String getOeuSousTitre() {
        return oeuSousTitre;
    }

    public void setOeuSousTitre(String oeuSousTitre) {
        this.oeuSousTitre = oeuSousTitre;
    }

    public String getAutNom() {
        return autNom;
    }

    public void setAutNom(String autNom) {
        this.autNom = autNom;
    }

    public String getEdiNom() {
        return ediNom;
    }

    public void setEdiNom(String ediNom) {
        this.ediNom = ediNom;
    }

    public String getOeuDateParution() {
        return oeuDateParution;
    }

    public void setOeuDateParution(String oeuDateParution) {
        this.oeuDateParution = oeuDateParution;
    }

    public String getOeuResume() {
        return oeuResume;
    }

    public void setOeuResume(String oeuResume) {
        this.oeuResume = oeuResume;
    }

    public Integer getOeuNbrePage() {
        return oeuNbrePage;
    }

    public void setOeuNbrePage(Integer oeuNbrePage) {
        this.oeuNbrePage = oeuNbrePage;
    }

    public String getOeuUrlImage() {
        return oeuUrlImage;
    }

    public void setOeuUrlImage(String oeuUrlImage) {
        this.oeuUrlImage = oeuUrlImage;
    }

    public String getTheIntitule() {
        return theIntitule;
    }

    public void setTheIntitule(String theIntitule) {
        this.theIntitule = theIntitule;
    }

    public String getSouIntitule() {
        return souIntitule;
    }

    public void setSouIntitule(String souIntitule) {
        this.souIntitule = souIntitule;
    }

    public Float getOeuPrix() {
        return oeuPrix;
    }

    public void setOeuPrix(Float oeuPrix) {
        this.oeuPrix = oeuPrix;
    }

    public String getTvaTaux() {
        return tvaTaux;
    }

    public void setTvaTaux(String tvaTaux) {
        this.tvaTaux = tvaTaux;
    }

    public String getOeuNbreCmt() {
        return oeuNbreCmt;
    }

    public void setOeuNbreCmt(String oeuNbreCmt) {
        this.oeuNbreCmt = oeuNbreCmt;
    }

    public String getOeuMoyenneCmt() {
        return oeuMoyenneCmt;
    }

    public void setOeuMoyenneCmt(String oeuMoyenneCmt) {
        this.oeuMoyenneCmt = oeuMoyenneCmt;
    }

    public Integer getOeuQte() {
        return oeuQte;
    }

    public void setOeuQte(Integer oeuQte) {
        this.oeuQte = oeuQte;
    }

    public String getOeuStatut() {
        return oeuStatut;
    }

    public void setOeuStatut(String oeuStatut) {
        this.oeuStatut = oeuStatut;
    }

    /********************************************************************************************************************/
    
    @Override
    public String toString() {
        return "Titre = " + oeuTitre ;
    }
    
}
