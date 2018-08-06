
package classe;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.JOptionPane;

/**
 *
 * @author cdi311
 */
public class beanClient implements Serializable{
    private int cliId;
    private String cliNom;
    private String cliPrenom;
    private String cliEmail;
    private String cliMotDepasse;
    private String cliTelephone;
    private String cliObservation;
    private String cliDateEntree;
    private String cliDateSortie;
    
    public beanClient(){
        
    }

    public beanClient(int cliId, String cliNom, String cliPrenom) {
        this.cliId = cliId;
        this.cliNom = cliNom;
        this.cliPrenom = cliPrenom;
    }
    
    public beanClient(int cliId, String cliNom, String cliPrenom, String cliEmail, String cliTelephone, String cliDateEntree) {
        this.cliId = cliId;
        this.cliNom = cliNom;
        this.cliPrenom = cliPrenom;
        this.cliEmail = cliEmail;
        this.cliTelephone = cliTelephone;
        this.cliDateEntree = cliDateEntree;
    }
    

    public int getCliId() {
        return cliId;
    }

    public void setCliId(int cliId) {
        this.cliId = cliId;
    }

    public String getCliNom() {
        return cliNom;
    }

    public void setCliNom(String cliNom) {
        this.cliNom = cliNom;
    }

    public String getCliPrenom() {
        return cliPrenom;
    }

    public void setCliPrenom(String cliPrenom) {
        this.cliPrenom = cliPrenom;
    }

    public String getCliEmail() {
        return cliEmail;
    }

    public void setCliEmail(String cliEmail) {
        this.cliEmail = cliEmail;
    }

    public String getCliMotDepasse() {
        return cliMotDepasse;
    }

    public void setCliMotDepasse(String cliMotDepasse) {
        this.cliMotDepasse = cliMotDepasse;
    }

    public String getCliTelephone() {
        return cliTelephone;
    }

    public void setCliTelephone(String cliTelephone) {
        this.cliTelephone = cliTelephone;
    }

    public String getCliObservation() {
        return cliObservation;
    }

    public void setCliObservation(String cliObservation) {
        this.cliObservation = cliObservation;
    }

    public String getCliDateEntree() {
        return cliDateEntree;
    }

    public void setCliDateEntree(String cliDateEntree) {
        this.cliDateEntree = cliDateEntree;
    }

    public String getCliDateSortie() {
        return cliDateSortie;
    }

    public void setCliDateSortie(String cliDateSortie) {
        this.cliDateSortie = cliDateSortie;
    }
    
    public Object getVector() {
        Vector v = new Vector();
        v.add(cliId);
        v.add(cliNom);
        v.add(cliPrenom);
        
        return v;
    }


    
//    public Vector GetVector(){
//        Vector v = new Vector(); 
//        v.add(this);
//        v.add(cliId);
//        v.add(cliNom);
//        v.add(cliPrenom);
//        v.add(cliEmail);
//        v.add(cliTelephone);
//        v.add(cliDateEntree);
//        return v;
//    }

    @Override
    public String toString() {
        return "Client{" + "cliId=" + cliId + ", cliNom=" + cliNom + ", cliPrenom=" + cliPrenom + ", cliEmail=" + cliEmail + ", cliMotDepasse=" + cliMotDepasse + ", cliTelephone=" + cliTelephone + ", cliObservation=" + cliObservation + ", cliDateEntree=" + cliDateEntree + ", cliDateSortie=" + cliDateSortie + '}';
    }
}
