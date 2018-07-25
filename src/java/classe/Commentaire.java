/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classe;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author thierry
 */
public class Commentaire implements Serializable {

    private String cmtId;
    private String oeuIsbn;
    private String cmtNomOeuvre;
    private String ligId;
    private String cliId;
    private Date cmtDate;
    private String cmtTexte;
    private String cmtNote;
    private String cmtIp;
    private String cmtStatut;
    private String cmtClient;
    private String cmtObservation;

    /**
     * *************************************constructeurs***************************************
     */
    public Commentaire() {
    }

    public Commentaire(String cmtId, String oeuIsbn, String cmtNomOeuvre, String cliId, Date cmtDate, String cmtTexte, String cmtNote, String cmtIp, String cmtStatut, String cmtClient) {
        this.cmtId = cmtId;
        this.oeuIsbn = oeuIsbn;
        this.cmtNomOeuvre = cmtNomOeuvre;
        this.cliId = cliId;
        this.cmtDate = cmtDate;
        this.cmtTexte = cmtTexte;
        this.cmtNote = cmtNote;
        this.cmtIp = cmtIp;
        this.cmtStatut = cmtStatut;
        this.cmtClient = cmtClient;

    }

    public Commentaire(String oeuIsbn, String cmtNomOeuvre, String cliId, Date cmtDate, String cmtTexte, String cmtNote, String cmtIp, String cmtStatut, String cmtClient) {
        this.oeuIsbn = oeuIsbn;
        this.cmtNomOeuvre = cmtNomOeuvre;
        this.cliId = cliId;
        this.cmtDate = cmtDate;
        this.cmtTexte = cmtTexte;
        this.cmtNote = cmtNote;
        this.cmtIp = cmtIp;
        this.cmtStatut = cmtStatut;
        this.cmtClient = cmtClient;
    }

    public String getCmtId() {
        return cmtId;
    }

    public void setCmtId(String cmtId) {
        this.cmtId = cmtId;
    }

    public String getOeuIsbn() {
        return oeuIsbn;
    }

    public void setOeuIsbn(String oeuIsbn) {
        this.oeuIsbn = oeuIsbn;
    }

    public String getCmtNomOeuvre() {
        return cmtNomOeuvre;
    }

    public void setCmtNomOeuvre(String cmtNomOeuvre) {
        this.cmtNomOeuvre = cmtNomOeuvre;
    }

    public String getLigId() {
        return ligId;
    }

    public void setLigId(String ligId) {
        this.ligId = ligId;
    }

    public String getCliId() {
        return cliId;
    }

    public void setCliId(String cliId) {
        this.cliId = cliId;
    }

    public Date getCmtDate() {
        return cmtDate;
    }

    public void setCmtDate(Date cmtDate) {
        this.cmtDate = cmtDate;
    }

    public String getCmtTexte() {
        return cmtTexte;
    }

    public void setCmtTexte(String cmtTexte) {
        this.cmtTexte = cmtTexte;
    }

    public String getCmtNote() {
        return cmtNote;
    }

    public void setCmtNote(String cmtNote) {
        this.cmtNote = cmtNote;
    }

    public String getCmtIp() {
        return cmtIp;
    }

    public void setCmtIp(String cmtIp) {
        this.cmtIp = cmtIp;
    }

    public String getCmtStatut() {
        return cmtStatut;
    }

    public void setCmtStatut(String cmtStatut) {
        this.cmtStatut = cmtStatut;
    }

    public String getCmtClient() {
        return cmtClient;
    }

    public void setCmtClient(String cmtClient) {
        this.cmtClient = cmtClient;
    }

    public String getCmtObservation() {
        return cmtObservation;
    }

    /**
     * *************************************getters et
     * setters***************************************
     */
    public void setCmtObservation(String cmtObservation) {
        this.cmtObservation = cmtObservation;
    }

    /**
     * *************************************autres méthodes
     * **********************************************************************
     */
    @Override
    public String toString() {
        return cmtNomOeuvre;
    }

}
