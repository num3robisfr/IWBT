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
        return ville.toUpperCase();
    }

    public void setVille(String ville) {
        this.ville = ville.toUpperCase();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNom() {
        return nom.toUpperCase();
    }

    public void setNom(String nom) {
        this.nom = nom.toUpperCase();
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

    @Override
    public String toString() {
        return "beanAdresse{" + "id=" + id + ", genre=" + genre + ", nom=" + nom + ", prenom=" + prenom + ", adresse=" + adresse + ", complement=" + complement + ", codePostal=" + codePostal + ", ville=" + ville + ", statut=" + statut + ", type=" + type + '}';
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

    public int AddAdrLivraison(Connection connexion, int adrId, int cliId, beanClient bC){
        try {

            String query = "INSERT INTO LivraisonAdresse "
                    + "(adrId, cliId, livNom, livPrenom, livGenre) "
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
         
         beanAdresse listeAdresseFacturation = new beanAdresse();
         
         String query = "SELECT adr.adrId as 'adrId', "
                + "cli.cliId as 'cliId', "
                + "liv.livNom as 'Nom', "
                + "liv.livPrenom as 'Prenom', "
                + "liv.livGenre as 'Genre', "
                + "adr.adrVoie as 'NomVoie', "
                + "adr.adrComplement as 'Complement', "
                + "adr.adrCodePostal as 'CodePostal', "
                + "adr.adrVille as 'Ville', "
                + "adr.adrPays as 'Pays', "
                + "adr.adrStatut as 'Statut' "
                + "FROM "
                + "Adresse adr "
                + "JOIN LivraisonAdresse liv "
                + "ON adr.adrId = liv.adrId "
                + "JOIN Client cli "
                + "ON liv.cliId = cli.cliId "
                + "WHERE cli.cliId = " + cliId;

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                listeAdresseFacturation = new beanAdresse(
                        rs.getInt("adrId"),
                        retournerCivilite(rs.getString("Genre")),
                        rs.getString("Nom"),
                        rs.getString("Prenom"),
                        rs.getString("NomVoie"),
                        rs.getString("Complement"),
                        rs.getString("CodePostal"),
                        rs.getString("Ville"),
                        rs.getInt("Statut"),
                        "facturation");
                System.out.println("listeAdresseFacturation : " + listeAdresseFacturation);
            }
            rs.close();
            stmt.close();
            connexion.close();
        } catch (SQLException e) {
            System.err.print("ERREUR SQL " + e.getMessage());
        }
        return listeAdresseFacturation;

    }
   
    public String updateAdresse(Connection connexion){
           String message = "";
        
                try {

            String query = "UPDATE Adresse "
                    + "SET adrVoie = ?, "
                    + "adrComplement = ?, "
                    + "adrCodePostal = ?,"
                    + "adrVille =? "
                    + "WHERE "
                    + "adrId = ?";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            pstmt.setString(1, this.adresse);
            pstmt.setString(2, this.complement);
            pstmt.setString(3, this.codePostal);
            pstmt.setString(4, this.ville);
            pstmt.setInt(5, this.id);

            pstmt.executeUpdate();
            message = "Modification effectuée";

            pstmt.close();
            connexion.close();
        } catch (SQLException ex) {
            message = "Erreur de modification de l'adresse";
        }
        
        return message;
    }
    
    public String updateAdresseFacture(Connection connexion, int cliId){
                   String message = "";
        
                try {

            String query = "UPDATE FactureAdresse "
                    + "SET facNom = ?, "
                    + "facPrenom = ?, "
                    + "facGenre = ? "
                    + "WHERE "
                    + "adrId = ? and cliId = ?";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            pstmt.setString(1, this.nom);
            pstmt.setString(2, this.prenom);
            pstmt.setString(3, this.genre);
            pstmt.setInt(4, this.id);
            pstmt.setInt(5, cliId);

            pstmt.executeUpdate();
            message = "Modification effectuée";

            pstmt.close();
            connexion.close();
        } catch (SQLException ex) {
            message = "Erreur de modification de la table FactureAdresse";
        }
        
        return message;
    }
    
    public String updateAdresseLivraison(Connection connexion, int cliId){
                          String message = "";
        
                try {

            String query = "UPDATE LivraisonAdresse "
                    + "SET livNom = ?, "
                    + "livPrenom = ?, "
                    + "livGenre = ? "
                    + "WHERE "
                    + "adrId = ? and cliId = ?";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            pstmt.setString(1, this.nom);
            pstmt.setString(2, this.prenom);
            pstmt.setString(3, this.genre);
            pstmt.setInt(4, this.id);
            pstmt.setInt(5, cliId);

            pstmt.executeUpdate();
            message = "Modification effectuée";

            pstmt.close();
            connexion.close();
        } catch (SQLException ex) {
            message = "Erreur de modification de la table FactureAdresse";
        }
        
        return message; 
    }
}
