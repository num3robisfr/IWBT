package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class beanCatalog implements Serializable {

    ArrayList<beanOeuvre> listeOeuvres;
    ArrayList<beanOeuvre> listeNouveautes;
    ArrayList<beanOeuvre> listeOeuvresEvenement;

    public beanCatalog() {
    }

    public ArrayList<beanOeuvre> getListeOeuvres() {
        return listeOeuvres;
    }

    public void setListeOeuvres(ArrayList<beanOeuvre> listeOeuvres) {
        this.listeOeuvres = listeOeuvres;
    }

    public ArrayList<beanOeuvre> getListeNouveautes() {
        return listeNouveautes;
    }

    public void setListeNouveautes(ArrayList<beanOeuvre> listeNouveautes) {
        this.listeNouveautes = listeNouveautes;
    }

    public ArrayList<beanOeuvre> getListeOeuvresEvenement() {
        return listeOeuvresEvenement;
    }

    public void setListeOeuvresEvenement(ArrayList<beanOeuvre> listeOeuvresEvenement) {
        this.listeOeuvresEvenement = listeOeuvresEvenement;
    }

    public ArrayList<beanOeuvre> remplirListeOeuvres(Connection connexion, String filtre, String recherche) {

        listeOeuvres = new ArrayList();
        String query = "SELECT * FROM ListesOeuvres2 WHERE " + filtre + " Titre like '%" + recherche + "%'";

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {

                beanOeuvre o = new beanOeuvre(rs.getString("ISBN"),
                        rs.getString("Titre"),
                        rs.getString("Sous Titre"),
                        rs.getString("Auteur"),
                        rs.getString("Editeur"),
                        rs.getString("Date de parution"),
                        rs.getString("Resume"),
                        new Integer(rs.getInt("Nbre de page")),
                        rs.getString("Image"),
                        rs.getString("Theme"),
                        rs.getString("Sous Theme"),
                        new Float(rs.getFloat("Prix")),
                        rs.getString("Tva"),
                        rs.getString("Nbre de cmt"),
                        rs.getString("Moyenne des notes"),
                        rs.getString("Statut"),
                        rs.getString("Nbre de Cdc"));
                listeOeuvres.add(o);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        }
        return listeOeuvres;
    }

    public ArrayList<beanOeuvre> remplirListeNouveautes(Connection connexion) {

        listeNouveautes = new ArrayList();
        String query = "SELECT * FROM ListeNouveautes";

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {

                beanOeuvre o = new beanOeuvre(rs.getString("ISBN"),
                        rs.getString("Titre"),
                        rs.getString("Sous Titre"),
                        rs.getString("Auteur"),
                        rs.getString("Editeur"),
                        rs.getString("Date de parution"),
                        rs.getString("Resume"),
                        new Integer(rs.getInt("Nbre de page")),
                        rs.getString("Image"),
                        rs.getString("Theme"),
                        rs.getString("Sous Theme"),
                        new Float(rs.getFloat("Prix")),
                        rs.getString("Tva"),
                        rs.getString("Nbre de cmt"),
                        rs.getString("Moyenne des notes"),
                        rs.getString("Statut"),
                        rs.getString("Nbre de Cdc"));
                listeNouveautes.add(o);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        }
        return listeNouveautes;
    }

    public ArrayList<beanOeuvre> remplirListeOeuvresEvenement(Connection connexion, String filtre) {

        listeOeuvresEvenement = new ArrayList();
        String query = "SELECT * FROM ListesOeuvresEvenement WHERE EvenementId = " + filtre;
        
        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {

                beanOeuvre o = new beanOeuvre(rs.getString("ISBN"),
                        rs.getString("Titre"),
                        rs.getString("Sous Titre"),
                        rs.getString("Auteur"),
                        rs.getString("Editeur"),
                        rs.getString("Date de parution"),
                        rs.getString("Resume"),
                        new Integer(rs.getInt("Nbre de page")),
                        rs.getString("Image"),
                        rs.getString("Theme"),
                        rs.getString("Sous Theme"),
                        new Float(rs.getFloat("Prix")),
                        rs.getString("Tva"),
                        rs.getString("Nbre de cmt"),
                        rs.getString("Moyenne des notes"),
                        rs.getString("Statut"),
                        rs.getString("Nbre de Cdc"));
                listeOeuvresEvenement.add(o);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        }
        return listeOeuvresEvenement;
    }

}
