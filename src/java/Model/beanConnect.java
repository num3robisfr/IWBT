/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class beanConnect implements Serializable {

    DataSource ds;
    Connection connexion;

    public Connection getConnexion() {
        if (ds == null) {
            try {
                InitialContext context = new InitialContext();
                ds = (DataSource) context.lookup("jdbc/IBWTresource");
                
            } catch (NamingException ex) {
                System.out.println("Oops:Naming:" + ex.getMessage());
            }
            try {
                if (connexion == null) {
                        connexion = ds.getConnection();
                }
            } catch (SQLException ex) {
                System.out.println("Oops:SQL:" + ex.getMessage());
            }
        }
        return connexion;
    }

}
