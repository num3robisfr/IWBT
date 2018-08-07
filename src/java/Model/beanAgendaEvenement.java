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

    private ArrayList<Evenement> listeEvenement;

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
    public ArrayList<Evenement> ChargerListeEvenement(Connection connexion, String filtre) {

        listeEvenement = new ArrayList<Evenement>();

        String query = "SELECT * FROM Evenement " + filtre
                + " ORDER BY  eveDateDebut ASC ";

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Evenement e = new Evenement(rs.getString("eveId"),
                        rs.getString("eveIntitule"),
                        outil.OutilsFormatage.formaterDate(rs.getDate("eveDateDebut")),
                        outil.OutilsFormatage.formaterDate(rs.getDate("eveDateFin")),
                        rs.getInt("eveTauxPromo"),
                        rs.getString("eveUrl"),
                        rs.getString("eveObservation"));
                listeEvenement.add(e);
            }
            rs.close();
            stmt.close();
            connexion.close();

        } catch (SQLException e) {
            System.err.print("ERREUR SQL " + e.getMessage());
        }
        return listeEvenement;
    }
}
