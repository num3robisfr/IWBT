package Model;

import classe.Adresse;
import classe.Commande;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class beanCompteClient implements Serializable {

    private beanClient client;
    private ArrayList<Adresse> listeAdresseLivraison;
    private ArrayList<Adresse> listeAdresseFacturation;
    private ArrayList<Commande> commandesClient;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    Constructeurs
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    public beanCompteClient() {
    }


    public beanCompteClient(beanClient client, ArrayList<Adresse> listeAdresseLivraison, ArrayList<Commande> commandesClient) {
        this.client = client;
        this.listeAdresseLivraison = listeAdresseLivraison;
        this.commandesClient = commandesClient;
    }

    public beanCompteClient(beanClient client, ArrayList<Commande> commandesClient) {
        this.client = client;
        this.commandesClient = commandesClient;
    }

    public beanCompteClient(beanClient client, ArrayList<Adresse> listeAdresseLivraison, ArrayList<Adresse> listeAdresseFacturation, ArrayList<Commande> commandesClient) {
        this.client = client;
        this.listeAdresseLivraison = listeAdresseLivraison;
        this.listeAdresseFacturation = listeAdresseFacturation;
        this.commandesClient = commandesClient;
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    Getters & Setters
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    public beanClient getClient() {
        return client;
    }

    public void setClient(beanClient client) {
        this.client = client;
    }

    public ArrayList<Adresse> getListeAdresseLivraison() {
        return listeAdresseLivraison;
    }

    public void setListeAdresseLivraison(ArrayList<Adresse> listeAdresseLivraison) {
        this.listeAdresseLivraison = listeAdresseLivraison;
    }

    public ArrayList<Adresse> getListeAdresseFacturation() {
        return listeAdresseFacturation;
    }

    public void setListeAdresseFacturation(ArrayList<Adresse> listeAdresseFacturation) {
        this.listeAdresseFacturation = listeAdresseFacturation;
    }

    public ArrayList<Commande> getCommandesClient() {
        return commandesClient;
    }

    public void setCommandesClient(ArrayList<Commande> commandesClient) {
        this.commandesClient = commandesClient;
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    Autres Méthodes
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    @Override
    public String toString() {
        return "beanCompteClient{" + "client=" + client + ", listeAdresseLivraison=" + listeAdresseLivraison + ", listeAdresseFacturation=" + listeAdresseFacturation + ", commandesClient=" + commandesClient + '}';
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    remplir le bean, récupérer les infos de la base
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    public ArrayList<Adresse> ChargerListeAdresseFacturation(Connection connexion, int cliId) {

        listeAdresseFacturation = new ArrayList<Adresse>();

        String query = "SELECT * FROM ListeAdresseClientFacturation WHERE FacClientId = " + cliId;

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Adresse a = new Adresse(rs.getInt(Integer.valueOf("AdresseId")),
                        rs.getInt(Integer.valueOf("FacClientId")),
                        rs.getString("FactureNom"),
                        rs.getString("FacturePrenom"),
                        rs.getString("AdresseVoie"),
                        rs.getString("AdresseComplement"),
                        rs.getString("AdresseVille"),
                        rs.getString("AdressePays"),
                        rs.getString("AdresseObservation"),
                        rs.getInt(Integer.valueOf("AdresseStatut")));
                listeAdresseFacturation.add(a);

            }
            rs.close();
            stmt.close();
            connexion.close();
        } catch (SQLException e) {
            System.err.print("ERREUR SQL " + e.getMessage());
        }
        return listeAdresseFacturation;
    }

    public ArrayList<Adresse> ChargerListeAdresseLivraison(Connection connexion, int cliId) {

        listeAdresseLivraison = new ArrayList<Adresse>();

        String query = "SELECT * FROM ListeAdresseClientLivraison WHERE LivClientId = " + cliId;

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Adresse a = new Adresse(rs.getInt(Integer.valueOf("AdresseId")),
                        rs.getInt(Integer.valueOf("LivClientId")),
                        rs.getString("LivraisonNom"),
                        rs.getString("LivraisonPrenom"),
                        rs.getString("AdresseVoie"),
                        rs.getString("AdresseComplement"),
                        rs.getString("AdresseVille"),
                        rs.getString("AdressePays"),
                        rs.getString("AdresseObservation"),
                        rs.getInt(Integer.valueOf("AdresseStatut")));
                listeAdresseLivraison.add(a);

            }
            rs.close();
            stmt.close();
            connexion.close();
        } catch (SQLException e) {
            System.err.print("ERREUR SQL " + e.getMessage());
        }
        return listeAdresseLivraison;
    }


}
