package Model;

import classe.Adresse;
import classe.Commande;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import outil.OutilsFormatage;
import static outil.OutilsFormatage.retournerCivilite;

public class beanCompteClient implements Serializable {

    private beanClient client;
    private ArrayList<beanAdresse> listeAdresse;
    private ArrayList<beanLigneDeCommande> commandesClient;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    Constructeurs
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    public beanCompteClient() {
    }
    

    public beanCompteClient(beanClient client, ArrayList<beanLigneDeCommande> commandesClient) {
        this.client = client;
        this.commandesClient = commandesClient;
    }

    public beanCompteClient(ArrayList<beanAdresse> listeAdresse) {
        this.listeAdresse = listeAdresse;
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

    public ArrayList<beanAdresse> getListeAdresse() {
        return listeAdresse;
    }

    public void setListeAdresse(ArrayList<beanAdresse> listeAdresse) {
        this.listeAdresse = listeAdresse;
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


//////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    remplir le bean, récupérer les infos de la base
//////////////////////////////////////////////////////////////////////////////////////////////////////////
    public ArrayList<beanAdresse> ChargerListeAdresseFacturation(Connection connexion, int cliId) {

        ArrayList<beanAdresse> listeAdresseFacturation = new ArrayList<beanAdresse>();

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
                beanAdresse a = new beanAdresse(
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

    public ArrayList<beanAdresse> ChargerListeAdresseLivraison(Connection connexion, int cliId) {

        ArrayList<beanAdresse> listeAdresseLivraison = new ArrayList<beanAdresse>();

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
                beanAdresse a = new beanAdresse(
                        rs.getInt("adrId"),
                        retournerCivilite(rs.getString("Genre")),
                        rs.getString("Nom"),
                        rs.getString("Prenom"),
                        rs.getString("NomVoie"),
                        rs.getString("Complement"),
                        rs.getString("CodePostal"),
                        rs.getString("Ville"),
                        rs.getInt("Statut"),
                        "livraison");
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

    public ArrayList<beanLigneDeCommande> ChargerListeCommande(Connection connexion, int cliId, String filtre) {

        ArrayList<beanLigneDeCommande> listeLigneDeCommande = new ArrayList<beanLigneDeCommande>();

        String query = "SELECT * FROM DetailCommandeClient WHERE cliId = " + cliId + " " + filtre;
//                + " ORDER BY  DateCommande ASC ";

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
