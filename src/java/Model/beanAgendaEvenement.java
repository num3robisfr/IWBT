/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import classe.Evenement;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author thierry
 */
public class beanAgendaEvenement implements Serializable {

    private ArrayList<Evenement> listeEvenement = new ArrayList<Evenement>();

    /* *************************************************************************************************** */
    public beanAgendaEvenement() {
    }

    public beanAgendaEvenement(ArrayList<Evenement> listeEvenement) {
        this.listeEvenement = listeEvenement;
    }

    /* *************************************************************************************************** */
    public ArrayList<Evenement> getListeEvenement() {
        return listeEvenement;
    }

    public void setListeEvenement(ArrayList<Evenement> listeEvenement) {
        this.listeEvenement = listeEvenement;
    }

    /* *************************************************************************************************** */
    public ArrayList<Evenement> ChargerListeEvenement() {

  
        Connection con = outil.ConnexionDB.GetConnection();
        String query = "SELECT * FROM Evenement "
                + " WHERE eveDateDebut != '2000-01-01 00:00:00.000' ";

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Evenement e = new Evenement(rs.getString("eveId"),
                        rs.getString("eveIntitule"),
                        outil.OutilsFormatage.formaterDate(rs.getDate("eveDateDebut")),
                        outil.OutilsFormatage.formaterDate(rs.getDate("eveDateFin")),
                        rs.getString("eveTauxPromo"),
                        rs.getString("eveUrl"),
                        rs.getString("eveObservation"));
                listeEvenement.add(e);
      
            }
            rs.close();
            stmt.close();
            try {
                con.close();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "PB de fermeture du flux");
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERREUR SQL " + e.getMessage());
        }
        return listeEvenement;
    }
}
