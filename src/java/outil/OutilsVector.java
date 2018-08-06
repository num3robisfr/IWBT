// MARCHE PAS !!!!!!!!!!!!!!!!!!!
// MARCHE PAS !!!!!!!!!!!!!!!!!!!
// MARCHE PAS !!!!!!!!!!!!!!!!!!!
// MARCHE PAS !!!!!!!!!!!!!!!!!!!
// MARCHE PAS !!!!!!!!!!!!!!!!!!!
// MARCHE PAS !!!!!!!!!!!!!!!!!!!

package outil;

import classe.beanClient;
import classe.Commande;
import exception.Exceptions;
import java.util.Vector;

public class OutilsVector {
    
    beanClient cli = new beanClient ();
    Commande com = new Commande ();
    
    public Object getOutilVector() throws Exceptions {
        
        Vector v = new Vector();
        v.add(com.getComId());
        v.add(cli.getCliId());
        v.add(cli.getCliNom());
        v.add(cli.getCliPrenom());
        v.add(com.getComDate());
        v.add(com.getComStatut());
        v.add(com.getComIp());
        
        return v;
    }
    
}
