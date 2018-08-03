package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class beanClient implements Serializable {

    private int Id;
    private String nom;
    private String prenom;
    private String genre;
    private String email;
    private String password;
    private String telephone;
    private String observation;
    private Date dateEntree;
    private Date dateSortie;

    public beanClient() {
    }

    public beanClient(String nom, String prenom, String genre, String email, String password, String telephone) {
        this.nom = nom;
        this.prenom = prenom;
        this.genre = genre;
        this.email = email;
        this.password = password;
        this.telephone = telephone;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public Date getDateEntree() {
        return dateEntree;
    }

    public void setDateEntree(Date dateEntree) {
        this.dateEntree = dateEntree;
    }

    public Date getDateSortie() {
        return dateSortie;
    }

    public void setDateSortie(Date dateSortie) {
        this.dateSortie = dateSortie;
    }

    public String checkLogin(Connection connexion, String email, String motdepasse) {

        String nomClient = null;
        String query = "SELECT * FROM Client WHERE cliEmail = '" + email + "' AND cliMotDePasse = '" + motdepasse + "'";

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()!=false) {
                nomClient = rs.getString("cliPrenom") +" "+ rs.getString("cliNom").toUpperCase();
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        }
        System.out.println(query);
        System.out.println(nomClient);
        return nomClient;
    }

    public int AddClient(Connection connexion) {
        int cliId = 0;

        try {

            String query = "INSERT INTO Client "
                    + "(cliNom, cliPrenom, cliGenre, cliEmail, cliMotDePasse, cliTelephone) "
                    + "VALUES "
                    + "(?,?,?,?,?,?)";
            PreparedStatement pstmt = connexion.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, this.nom);
            pstmt.setString(2, this.prenom);
            pstmt.setString(3, this.genre);
            pstmt.setString(4, this.email);
            pstmt.setString(5, this.password);
            pstmt.setString(6, this.telephone);

            pstmt.executeUpdate();

            ResultSet clefs = pstmt.getGeneratedKeys();

            if (clefs.next()) {
                cliId = clefs.getInt(1);
            }
        } catch (SQLException ex) {
            cliId = 0;
            System.out.println("erreur requete AddClient : " + ex);
        }

        return cliId;
    }
    
}
