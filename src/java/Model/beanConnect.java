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
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author thierry
 */
public class beanConnect implements Serializable{
    public void getConnexion (String query){
        DataSource ds = null;
            try {
                InitialContext context = new InitialContext();
                ds = (DataSource) context.lookup("jdbc/SQLSresource");
            } catch (NamingException ex) {
                System.out.println("Oops:Naming:" + ex.getMessage());
                }
            Connection connexion = null;
                try {
                    connexion = ds.getConnection();
                Statement stmt= connexion.createStatement();
                ResultSet rs= stmt.executeQuery(query);
                
                while (rs.next()) { 
                    System.out.println(rs.getString("proNom"));
                }
                rs.close();
                stmt.close();
                } catch (SQLException ex) {
                    System.out.println("Oops:SQL:" + ex.getMessage());
                } finally {
                    try {
                        connexion.close();
                    } catch (SQLException ex) {
                        System.out.println("Oops:close:" + ex.getMessage());
                    }
                }
            
    }

    
    
    
    
    
    
    
    
    
    
    
}
