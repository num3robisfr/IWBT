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
public class beanTheme implements Serializable {

    private int id;
    private String intitule;

    public beanTheme() {
    }

    public beanTheme(int id, String intitule) {
        this.id = id;
        this.intitule = intitule;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIntitule() {
        return intitule;
    }

    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    public ArrayList<beanTheme> getAllTheme(Connection connexion) {
        ArrayList<beanTheme> ls = new ArrayList();

        try {
            String query = "SELECT * FROM Theme";
            Statement stmt = connexion.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                beanTheme o = new beanTheme(rs.getInt("theId"), rs.getString("theIntitule"));
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
