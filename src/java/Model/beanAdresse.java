/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author cdi311
 */
public class beanAdresse implements Serializable {
    
    private int id;
    private String adresse;
    private String complement;
    private String codePostal;
    private String ville;
    private int statut;

    public beanAdresse() {
    }

    public beanAdresse(String adresse, String complement, String codePostal, String ville, int statut) {
        this.adresse = adresse;
        this.complement = complement;
        this.codePostal = codePostal;
        this.ville = ville;
        this.statut = statut;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatut() {
        return statut;
    }

    public void setStatut(int statut) {
        this.statut = statut;
    }


    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getComplement() {
        return complement;
    }

    public void setComplement(String complement) {
        this.complement = complement;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public int AddAdresse(Connection connexion) {
        int adrId = 0;

        try {

            String query = "INSERT INTO Adresse "
                    + "(adrVoie, adrComplement, adrCodePostal, adrVille, adrStatut) "
                    + "VALUES "
                    + "(?,?,?,?,?)";
            PreparedStatement pstmt = connexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, this.adresse);
            pstmt.setString(2, this.complement);
            pstmt.setString(3, this.codePostal);
            pstmt.setString(4, this.ville);
            pstmt.setInt(5, this.statut);

            pstmt.executeUpdate();

            ResultSet clefs = pstmt.getGeneratedKeys();

            if (clefs.next()) {
                adrId = clefs.getInt(1);
            }
        } catch (SQLException ex) {
            adrId = 0;
            System.out.println("erreur requete AddAdresse : " + ex);
        }

        return adrId;
    }

    public int AddAdrFacturation(Connection connexion, int adrId, int cliId, beanClient bC) {
        

        try {

            String query = "INSERT INTO FactureAdresse "
                    + "(adrId, cliId, facNom, facPrenom, facGenre) "
                    + "VALUES "
                    + "(?,?,?,?,?)";
            PreparedStatement pstmt = connexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, adrId);
            pstmt.setInt(2, cliId);
            pstmt.setString(3, bC.getNom());
            pstmt.setString(4, bC.getPrenom());
            pstmt.setString(5, bC.getGenre());

            pstmt.executeUpdate();

            ResultSet clefs = pstmt.getGeneratedKeys();

            if (clefs.next()) {
                adrId = clefs.getInt(1);
            }
        } catch (SQLException ex) {
            adrId = 0;
            System.out.println("erreur requete AddAdrFacturation : " + ex);
        }

        return adrId;
    }

}
