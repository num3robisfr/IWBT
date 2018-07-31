package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class beanCatalog {
    
    ArrayList<beanOeuvre> listeOeuvres=new ArrayList();
    ArrayList<beanOeuvre> listeNouveautes=new ArrayList();
    ArrayList<beanOeuvre> listeOeuvresEvenement = new ArrayList();

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
        
        
        try {
            String query = "SELECT * FROM ListesOeuvres2 WHERE " + filtre + " Titre like '%" + recherche + "%'";
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
                listeOeuvres.add(o);            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        } 
        return listeOeuvres;
    }    

public ArrayList<beanOeuvre> remplirListeNouveautes(Connection connexion) {
        
        
        try {
            String query = "SELECT * FROM ListeNouveautes";
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
                listeNouveautes.add(o);            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        } 
        return listeNouveautes;
    }    
public ArrayList<beanOeuvre> remplirListeOeuvresEvenement (Connection connexion, String filtre) {
        
        
        try {
            String query = "SELECT * FROM ListesOeuvresEvenement WHERE EvenementId = " + filtre ;
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
                listeOeuvres.add(o);            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Oops:SQL:" + ex.getMessage());
        } 
        return listeOeuvres;
    }    

}
