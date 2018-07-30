/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import classe.Theme;
import classe.SousTheme;
import db.DButils;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author cdi311
 */
public class DataAccessTheme {
    
    public static List<Theme> getAllTheme(){
        ArrayList<Theme> ls = new ArrayList();
    
                try {
            ResultSet rs = DButils.getPreparedStatement("SELECT * FROM Theme").executeQuery();
            
            while (rs.next()) {                
                Theme o = new Theme(rs.getInt("theId"), rs.getString("theIntitule"));
                ls.add(o);
            }
            rs.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccessTheme.class.getName()).log(Level.SEVERE, null, ex);
        }
    return ls;
}
    
    public static List<SousTheme> getAllSousTheme() {
        ArrayList<SousTheme> ls = new ArrayList();
        try {
            ResultSet rs = DButils.getPreparedStatement("SELECT theId, souIntitule FROM SousTheme").executeQuery();

            while (rs.next()) {
                SousTheme o = new SousTheme(rs.getInt("theId"), rs.getString("souIntitule"));
                ls.add(o);
            }
            rs.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DataAccessTheme.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

}
