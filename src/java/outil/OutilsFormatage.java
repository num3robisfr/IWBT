/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outil;

import static outil.OutilsFormatage.formaterDate;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author nicolas
 */
public class OutilsFormatage {

    public static String formaterDate(Date laDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String Date = sdf.format(laDate);
        return Date;
    }

    public static String retournerType(String genre) {
        String s = "";

        if (genre.equals("M")) {
            s = "H";
        } else {
            s = "F";
        }

        return s;
    }

    public static String retournerCivilite(String genre) {
        String s = "";

        if (genre.equals("H")) {
            s = "M.";
        } else {
            s = "Mme";
        }

        return s;
    }
}
