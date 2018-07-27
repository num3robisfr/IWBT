/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classe;

/**
 *
 * @author cdi311
 */
public class SousTheme {
    private int id;
    private String soustheme;

    public SousTheme(int id, String soustheme) {
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
    
    
}
