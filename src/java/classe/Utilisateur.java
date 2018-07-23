package classe;

import exception.Exceptions;
import java.sql.Date;
import java.util.Vector;

public class Utilisateur implements Comparable<Utilisateur> {

    /*
     * ****************************** MEMBRES *******************************
     */
    private int utiId;
    private String utiNom;
    private String utiPrenom;
    private String utiEmail;
    private String utiLogin;
    private String utiMotDePasse;
    private int utiDroit;
    /* STRING VOULU // PENSER A FAIRE Integer.valueOf(String) */
    private Date utiDateEntree;
    private Date utiDateSortie;

    /*
     * ****************************** METHODES *******************************
     */
    // CONSTRUCTOR
    public Utilisateur() {

    }

    public Utilisateur(int utiId, String utiNom, String utiPrenom, String utiEmail) {
        this.utiId = utiId;
        this.utiNom = utiNom;
        this.utiPrenom = utiPrenom;
        this.utiEmail = utiEmail;
    }
    
    public Utilisateur(int utiId, String utiNom, String utiPrenom, String utiEmail, int utiDroit) {
        this.utiId = utiId;
        this.utiNom = utiNom;
        this.utiPrenom = utiPrenom;
        this.utiEmail = utiEmail;
        this.utiDroit = utiDroit;
    }

    public Utilisateur(int utiId, String utiNom, String utiPrenom, String utiLogin, String utiMotDePasse, int utiDroit) {
        this.utiId = utiId;
        this.utiNom = utiNom;
        this.utiPrenom = utiPrenom;
        this.utiLogin = utiLogin;
        this.utiMotDePasse = utiMotDePasse;
        this.utiDroit = utiDroit;
    }
    public Utilisateur(int utiId, String utiNom, String utiPrenom, String utiEmail, String utiLogin, String utiMotDePasse, int utiDroit) {
        this.utiId = utiId;
        this.utiNom = utiNom;
        this.utiPrenom = utiPrenom;
        this.utiEmail = utiEmail;
        this.utiLogin = utiLogin;
        this.utiMotDePasse = utiMotDePasse;
        this.utiDroit = utiDroit;
    }

    public Utilisateur(int utiId, String utiNom, String utiPrenom, String utiEmail, String utiLogin, String utiMotDePasse, int utiDroit, Date utiDateEntree) {
        this.utiId = utiId;
        this.utiNom = utiNom;
        this.utiPrenom = utiPrenom;
        this.utiEmail = utiEmail;
        this.utiLogin = utiLogin;
        this.utiMotDePasse = utiMotDePasse;
        this.utiDroit = utiDroit;
        this.utiDateEntree = utiDateEntree;
    }
    public Utilisateur(String utiNom, String utiPrenom, String utiEmail, String utiLogin, String utiMotDePasse, Date utiDateEntree) {
        this.utiNom = utiNom;
        this.utiPrenom = utiPrenom;
        this.utiEmail = utiEmail;
        this.utiLogin = utiLogin;
        this.utiMotDePasse = utiMotDePasse;
        this.utiDateEntree = utiDateEntree;
    }
    
    

    // GETTER && SETTER
    public int getUtiId() {
        return utiId;
    }

    public void setUtiId(int utiId) {
        this.utiId = utiId;
    }

    public String getUtiNom() {
        return utiNom;
    }

    public void setUtiNom(String utiNom) throws Exceptions {
        if (utiNom == null) {
            throw new Exceptions("Un nom ne peut etre null");
        }
        if (utiNom.trim().isEmpty()) {
            throw new Exceptions("Un nom ne peut etre vide");
        }
        if (utiNom.trim().length() < 2) {
            throw new Exceptions("Un nom doit faire au moins 2 caractères");
        }
        if (utiNom.matches("[-' a-zA-Z]*")) {
            throw new Exceptions("Un nom ne doit contenir que des caractères de a à z ou un - ou un ' ");
        }
        this.utiNom = utiNom;
    }

    public String getUtiPrenom() {
        return utiPrenom;
    }

    public void setUtiPrenom(String utiPrenom) throws Exceptions {
        if (utiPrenom == null) {
            throw new Exceptions("Un prenom ne peut etre null");
        }
        if (utiPrenom.trim().isEmpty()) {
            throw new Exceptions("Un prenom ne peut etre vide");
        }
        if (utiPrenom.trim().length() < 2) {
            throw new Exceptions("Un prenom doit faire au moins 2 caractères");
        }
        if (utiPrenom.matches("[-' a-zA-Z]*")) {
            throw new Exceptions("Un nom ne doit contenir que des caractères de a à z ou un - ou un ' ");
        }
        this.utiPrenom = utiPrenom;
    }

    public String getUtiEmail() {
        return utiEmail;
    }

    public void setUtiEmail(String utiEmail) throws Exceptions {
         if (utiEmail == null) {
            throw new Exceptions("Une adresse mail ne peut etre null");
        }
        if (utiEmail.trim().isEmpty()) {
            throw new Exceptions("Une adresse mail ne peut etre vide");
        }
        if (utiEmail.matches("\\A(?:[a-z0-9!#$%&'*+\\/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+\\/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])\\z")) {
            throw new Exceptions("Un format adresse mail est requis. ");
        }
        this.utiEmail = utiEmail;
    }
    

    public String getUtiLogin() {
        return utiLogin;
    }

    public void setUtiLogin(String utiLogin) throws Exceptions {
        if (utiLogin == null) {
            throw new Exceptions("Un login ne peut etre null");
        }
        if (utiLogin.trim().isEmpty()) {
            throw new Exceptions("Un login ne peut etre vide");
        }
        if (utiLogin.trim().length() < 2) {
            throw new Exceptions("Un login doit faire au moins 2 caractères");
        }
        if (utiLogin.matches("[-_@*?!$0-9a-zA-Z]*")) {
            throw new Exceptions("En plus, des lettres et des chiffres, un login ne peut contenir que les caractères spéciaux suivants : -_@*?!$/ (Les epaces ne sont pas non plus autorisés) ");
        }
        this.utiLogin = utiLogin;
    }

    public String getUtiMotDePasse() {
        return utiMotDePasse;
    }

    public void setUtiMotDePasse(String utiMotDePasse) throws Exceptions {
        if (utiMotDePasse == null) {
            throw new Exceptions("Un mot de passe ne peut etre null");
        }
        if (utiMotDePasse.trim().isEmpty()) {
            throw new Exceptions("Un mot de passe ne peut etre vide");
        }
        if (utiMotDePasse.trim().length() < 8) {
            throw new Exceptions("Un mot de passe doit faire au moins 8 caractères");
        }
        if (utiMotDePasse.matches("(?=..*[0-9]{2,})(?=.*[a-z])(?=.*[A-Z]{2,})(?=.*[-_@*?!$])")) {
            throw new Exceptions("Un mot de passe doit contenir au moins l'un des caractères spéciaux suivants : -_@*?!$ (Les epaces ne sont pas non plus autorisés) De plus, il doit contenir au moins 2 chiffres et 2 majuscules.");
        }
        this.utiMotDePasse = utiMotDePasse;
    }

    public int getUtiDroit() {
        return utiDroit;
    }

    public void setUtiDroit(int utiDroit) throws Exceptions {
        if (String.valueOf(utiDroit) == null) {
            throw new Exceptions("Un droit utilisateur ne peut etre null");
        }
        if (String.valueOf(utiDroit).trim().isEmpty()) {
            throw new Exceptions("Un droit utilisateur ne peut etre vide");
        }
        if (String.valueOf(utiDroit).matches("[0-4]{1}")) {
            throw new Exceptions("Le droit utilisateur est compris entre 0 et 4. // 0. ADMINISTRATEUR // 1. MODERATEUR // 2. COMMERCIAL // 3. INTERIMAIRE // 4. VISITEUR  ");
        }
        this.utiDroit = utiDroit;
    }

    public Date getUtiDateEntree() {
        return utiDateEntree;
    }

    public void setUtiDateEntree(Date utiDateEntree) throws Exceptions {
        if (String.valueOf(utiDateEntree) == null) {
            throw new Exceptions("Une date ne peut etre null");
        }
        if (String.valueOf(utiDateEntree).trim().isEmpty()) {
            throw new Exceptions("Une date ne peut etre vide");
        }
        if (String.valueOf(utiDateEntree).matches("(3[01]|[12][0-9]|0[1-9])\\/(1[0-2]|0[1-9])\\/[0-9]{4}")) {
            throw new Exceptions("Un format date jj/mm/aaaa est requis.");
        }
        this.utiDateEntree = utiDateEntree;
    }

    public Date getUtiDateSortie() {
        return utiDateSortie;
    }

    public void setUtiDateSortie(Date utiDateSortie) throws Exceptions {
        if (String.valueOf(utiDateSortie) == null) {
            throw new Exceptions("Une date ne peut etre null");
        }
        if (String.valueOf(utiDateSortie).trim().isEmpty()) {
            throw new Exceptions("Une date ne peut etre vide");
        }
        if (String.valueOf(utiDateSortie).matches("(3[01]|[12][0-9]|0[1-9])\\/(1[0-2]|0[1-9])\\/[0-9]{4}")) {
            throw new Exceptions("Un format date jj/mm/aaaa est requis.");
        }
        this.utiDateSortie = utiDateSortie;
    }

    // toString
    @Override
    public String toString() {
        return "Utlisateur{" + "utiNom=" + utiNom + ", utiPrenom=" + utiPrenom + ", utiLogin=" + utiLogin + ", utiMotDePasse=" + utiMotDePasse + ", utiDroit=" + utiDroit + ", utiDateEntree=" + utiDateEntree + ", utiDateSortie=" + utiDateSortie + '}';
    }

    // getVector
    public Object getVector() {
        Vector v = new Vector();
        v.add(utiId);
        v.add(utiNom);
        v.add(utiPrenom);
        v.add(utiEmail);

        return v;
    }

    /*
     * ***********************************************************************
     */
    // IMPLEMENTATION DE LA METHODE DE L'INTERFACE COMPARABLE
    // Trier par Rôles (== Droits / Statuts)
    @Override
    public int compareTo(Utilisateur o) {
        String utiDroit1 = String.valueOf(this.utiDroit);
        String utiDroit2 = String.valueOf(o.utiDroit);

        if ((utiDroit1 == null) && (utiDroit2 == null)) {
            return 0;
        } else if (utiDroit1 == null) {
            return -1;
        } else if (utiDroit2 == null) {
            return 1;
        } else {
            int comparRole = utiDroit1.compareTo(utiDroit2);

            //tests ternaires pour tri sur autres champs
            int resultat = (comparRole != 0) ? comparRole : this.utiNom.compareTo(o.utiNom);
            resultat = (resultat != 0) ? resultat : this.utiPrenom.compareTo(o.utiPrenom);

            return resultat;
        }

    }

    /*
     * ***********************************************************************
     */
}

/* CL - cdi1804 - 18.06.26 */
