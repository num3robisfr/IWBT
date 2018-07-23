
package outil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {
    
    public static Connection connexion;
    
    public Connection getConnexionBASE(){
        Connection connexion = this.connexion;
        if (this.equals(null)) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            } catch (ClassNotFoundException ex) {
                System.err.println("Oops:Driver:" + ex.getMessage());
            }

            try {
                connexion = DriverManager.getConnection(
                        "jdbc:sqlserver://localhost:1433;"
                        + "databaseName=IBWT;user=sa;password=sa");
            } catch (SQLException ex) {
                System.err.println("Oops:Connection:" + ex.getErrorCode() + ":" + ex.getMessage());
                
            }
        }
        
        return connexion;
    }
    
    public Connection getConnexionCLOSE(){
        Connection connexion = this.connexion;
        if (!this.equals(null)) {
            try {
                connexion.close();
            } catch (SQLException ex) {
                System.err.println("Oops:close:"+ ex.getMessage());
            }
        }
        return connexion;
    }
    
    
    
}

/* CL - cdi1804 - 18.07.09 */
