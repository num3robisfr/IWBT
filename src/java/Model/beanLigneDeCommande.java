/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author thierry
 */
public class beanLigneDeCommande {

    private int comId;
    private int cliId;
    private String client;
    private Date comDate;
    private String comStatut;
    private String comIsbn;
    private String comTitre;
    private int comQty;
    private float comPrixUnitaireHT;
    private float comPrixUnitaireTTC;
    private float comTva;
    private int comPromo;
    private float comTotalTtc; 
    private String comUrlImage;

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////                                Constructeurs
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public beanLigneDeCommande() {
    }

    public beanLigneDeCommande(int comId, int cliId, String client, Date comDate, String comStatut, String comIsbn, String comTitre, int comQty, float comPrixUnitaireHT, float comPrixUnitaireTTC, float comTva, int comPromo, float comTotalTtc, String comUrlImage) {
        this.comId = comId;
        this.cliId = cliId;
        this.client = client;
        this.comDate = comDate;
        this.comStatut = comStatut;
        this.comIsbn = comIsbn;
        this.comTitre = comTitre;
        this.comQty = comQty;
        this.comPrixUnitaireHT = comPrixUnitaireHT;
        this.comPrixUnitaireTTC = comPrixUnitaireTTC;
        this.comTva = comTva;
        this.comPromo = comPromo;
        this.comTotalTtc = comTotalTtc;
        this.comUrlImage = comUrlImage;
    }



    

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////                                Getters Setters
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

    public Date getComDate() {
        return comDate;
    }

    public void setComDate(Date comDate) {
        this.comDate = comDate;
    }

    public String getComStatut() {
        return comStatut;
    }

    public void setComStatut(String comStatut) {
        this.comStatut = comStatut;
    }

    public String getComIsbn() {
        return comIsbn;
    }

    public void setComIsbn(String comIsbn) {
        this.comIsbn = comIsbn;
    }

    public String getComTitre() {
        return comTitre;
    }

    public void setComTitre(String comTitre) {
        this.comTitre = comTitre;
    }

    public float getComPrixUnitaireHT() {
        return comPrixUnitaireHT;
    }

    public void setComPrixUnitaireHT(float comPrixUnitaireHT) {
        this.comPrixUnitaireHT = comPrixUnitaireHT;
    }

    public float getComPrixUnitaireTTC() {
        return comPrixUnitaireTTC;
    }

    public void setComPrixUnitaireTTC(float comPrixUnitaireTTC) {
        this.comPrixUnitaireTTC = comPrixUnitaireTTC;
    }

    public float getComTva() {
        return comTva;
    }

    public void setComTva(float comTva) {
        this.comTva = comTva;
    }

    public int getComPromo() {
        return comPromo;
    }

    public void setComPromo(int comPromo) {
        this.comPromo = comPromo;
    }

    public String getComUrlImage() {
        return comUrlImage;
    }

    public void setComUrlImage(String comUrlImage) {
        this.comUrlImage = comUrlImage;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public int getComQty() {
        return comQty;
    }

    public void setComQty(int comQty) {
        this.comQty = comQty;
    }

    public float getComTotalTtc() {
        return comTotalTtc;
    }

    public void setComTotalTtc(float comTotalTtc) {
        this.comTotalTtc = comTotalTtc;
    }

    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////                                toString
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @Override
    public String toString() {
        return "beanLigneDeCommande{" + "comId=" + comId + ", cliId=" + cliId + ", client=" + client + ", comDate=" + comDate + ", comStatut=" + comStatut + ", comIsbn=" + comIsbn + ", comTitre=" + comTitre + ", comQty=" + comQty + ", comPrixUnitaireHT=" + comPrixUnitaireHT + ", comPrixUnitaireTTC=" + comPrixUnitaireTTC + ", comTva=" + comTva + ", comPromo=" + comPromo + ", comTotalTtc=" + comTotalTtc + ", comUrlImage=" + comUrlImage + '}';
    }
    
    
    

}
