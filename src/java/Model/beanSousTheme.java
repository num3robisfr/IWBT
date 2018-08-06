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
import java.util.ArrayList;

/**
 *
 * @author cdi311
 */
public class beanSousTheme implements Serializable {

    private int id;
    private String soustheme;

    public beanSousTheme() {
    }

    public beanSousTheme(int id, String soustheme) {
        this.id = id;
        this.soustheme = soustheme;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSoustheme() {
        return soustheme;
    }

    public void setSoustheme(String soustheme) {
        this.soustheme = soustheme;
    }

    public ArrayList<beanSousTheme> GetSousTheme(Connection connexion) {
        ArrayList<beanSousTheme> ls = new ArrayList();

        try {
            String query = "SELECT theId, souIntitule FROM SousTheme";
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                beanSousTheme o = new beanSousTheme(rs.getInt("theId"), rs.getString("souIntitule"));
                ls.add(o);
            }
            stmt.close();
            rs.close();
            connexion.close();

        } catch (SQLException e) {
            System.out.println("Oops:SQL:" + e.getMessage());
        }

        return ls;
    }

}
