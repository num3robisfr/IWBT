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
import static outil.OutilsFormatage.*;

/**
 *
 * @author cdi311
 */
public class beanAdresse implements Serializable {
    
    private int id;
    private String genre;
    private String nom;
    private String prenom;
    private String adresse;
    private String complement;
    private String codePostal;
    private String ville;
    private int statut;
    private String type;

    public beanAdresse() {
    }

    public beanAdresse(int id, String genre, String nom, String prenom, String adresse, String complement, String codePostal, String ville, int statut, String type) {
        this.id = id;
        this.genre = genre;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.complement = complement;
        this.codePostal = codePostal;
        this.ville = ville;
        this.statut = statut;
        this.type = type;
    }
    
    

    public beanAdresse(String adresse, String complement, String codePostal, String ville, int statut) {
        this.adresse = adresse;
        this.complement = complement;
        this.codePostal = codePostal;
        this.ville = ville;
        this.statut = statut;
    }

    public beanAdresse(int id, String adresse, String complement, String codePostal, String ville, int statut, String type) {
        this.id = id;
        this.adresse = adresse;
        this.complement = complement;
        this.codePostal = codePostal;
        this.ville = ville;
        this.statut = statut;
        this.type = type;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
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

    public beanAdresse getAdressefacturation(Connection connexion, int cliId){
        beanAdresse ba = null;

        String query = "SELECT "
                + "fac.cliId as 'cliId', adr.adrId as 'adrId',facGenre as 'Genre', facNom as 'Nom', facPrenom as 'Prenom', adrVoie as 'Voie', adrComplement as 'Complement', adrCodePostal as 'CodePostal', adrVille as 'Ville', adrStatut as 'Statut' "
                + "FROM "
                + "FactureAdresse fac "
                + "JOIN Adresse adr "
                + "ON fac.adrId = adr.adrId "
                + "where fac.cliId = " + cliId;
        
        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                ba = new beanAdresse(rs.getInt("cliId"),
                        retournerCivilite(rs.getString("Genre")),
                        rs.getString("Nom"), rs.getString("Prenom"),
                        rs.getString("Voie"), rs.getString("Complement"), rs.getString("CodePostal"),
                        rs.getString("Ville"), rs.getInt("Statut"), "facturation");
            }
            
            rs.close();
            stmt.close();
            connexion.close();
            
        } catch (SQLException e) {
            System.out.println("erreur requete getAdresseFacturation" + e);
        }
       
        return ba;
    }
    
     public beanAdresse getAdresselivraison(Connection connexion, int cliId){
        beanAdresse ba = null;

        String query = "SELECT "
                + "liv.cliId as 'cliId', adr.adrId as 'adrId',livGenre as 'Genre', livNom as 'Nom', livPrenom as 'Prenom', adrVoie as 'Voie', adrComplement as 'Complement', adrCodePostal as 'CodePostal', adrVille as 'Ville', adrStatut as 'Statut' "
                + "FROM "
                + "LivraisonAdresse liv "
                + "JOIN Adresse adr "
                + "ON liv.adrId = adr.adrId "
                + "where liv.cliId = " + cliId;
        
        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                ba = new beanAdresse(rs.getInt("cliId"),
                        retournerCivilite(rs.getString("Genre")),
                        rs.getString("Nom"), rs.getString("Prenom"),
                        rs.getString("Voie"), rs.getString("Complement"), rs.getString("CodePostal"),
                        rs.getString("Ville"), rs.getInt("Statut"), "livraison");
            }
            
            rs.close();
            stmt.close();
            connexion.close();
            
        } catch (SQLException e) {
            System.out.println("erreur requete getAdresselivraison" + e);
        }
       
        return ba;
    }
   
}
