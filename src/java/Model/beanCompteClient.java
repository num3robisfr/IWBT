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
    private ArrayList<beanLigneDeCommande> commandesClient;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    Constructeurs
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    public beanCompteClient() {
    }

    public beanCompteClient(beanClient client, ArrayList<Adresse> listeAdresseLivraison, ArrayList<beanLigneDeCommande> commandesClient) {
        this.client = client;
        this.listeAdresseLivraison = listeAdresseLivraison;
        this.commandesClient = commandesClient;
    }

    public beanCompteClient(beanClient client, ArrayList<beanLigneDeCommande> commandesClient) {
        this.client = client;
        this.commandesClient = commandesClient;
    }

    public beanCompteClient(beanClient client, ArrayList<Adresse> listeAdresseLivraison, ArrayList<Adresse> listeAdresseFacturation, ArrayList<beanLigneDeCommande> commandesClient) {
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

    public ArrayList<beanLigneDeCommande> getCommandesClient() {
        return commandesClient;
    }

    public void setCommandesClient(ArrayList<beanLigneDeCommande> commandesClient) {
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

        String query = "SELECT adr.adrId as 'adrId', "
                + "cli.cliId as 'cliId', "
                + "fac.facNom as 'Nom', "
                + "fac.facPrenom as 'Prenom', "
                + "fac.facGenre as 'Genre', "
                + "adr.adrVoie as 'NomVoie', "
                + "adr.adrComplement as 'Complement', "
                + "adr.adrCodePostal as 'CodePostal', "
                + "adr.adrVille as 'Ville', "
                + "adr.adrPays as 'Pays', "
                + "adr.adrStatut as 'Statut' "
                + "FROM "
                + "Adresse adr "
                + "JOIN FactureAdresse fac "
                + "ON adr.adrId = fac.adrId "
                + "JOIN Client cli "
                + "ON fac.cliId = cli.cliId "
                + "WHERE cli.cliId = " + cliId;

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Adresse a = new Adresse(
                        rs.getInt("adrId"),
                        rs.getInt("cliId"),
                        rs.getString("Nom"),
                        rs.getString("Prenom"),
                        rs.getString("Genre"),
                        rs.getString("NomVoie"),
                        rs.getString("Complement"),
                        rs.getString("CodePostal"),
                        rs.getString("Ville"),
                        rs.getString("Pays"),
                        rs.getInt("Statut"));
                listeAdresseFacturation.add(a);
                System.out.println("adresse facturation :" + listeAdresseFacturation);
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
                        rs.getString("LivraisonGenre"),
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

    public ArrayList<beanLigneDeCommande> ChargerListeCommande(Connection connexion, int cliId) {

        ArrayList<beanLigneDeCommande> listeLigneDeCommande = new ArrayList<beanLigneDeCommande>();

        String query = "SELECT * FROM DetailCommandeClient WHERE cliId = " + cliId;

        try {
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                beanLigneDeCommande l = new beanLigneDeCommande(rs.getInt("ComId"),
                        rs.getInt("CliId"),
                        rs.getString("Client"),
                        outil.OutilsFormatage.formaterDate(rs.getDate("DateCommande")),
                        rs.getString("Statut"),
                        rs.getString("ISBN"),
                        rs.getString("Titre"),
                        rs.getInt("Quantite"),
                        rs.getFloat("PrixUnitaireHT"),
                        rs.getFloat("PrixUnitaireTTC"),
                        rs.getFloat("Tva"),
                        rs.getInt("Promo"),
                        rs.getFloat("TotalTTC"),
                        rs.getString("UrlImage"));
                listeLigneDeCommande.add(l);

            }
            rs.close();
            stmt.close();
            connexion.close();
        } catch (SQLException e) {
            System.err.print("ERREUR SQL " + e.getMessage());
        }
        return listeLigneDeCommande;
    }

}
