/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outil;

import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author cdi311
 */
public class ModifComposant {
    
    public static void effacerjTable(JTable jT) {
        DefaultTableModel model = (DefaultTableModel) jT.getModel();
        model.setRowCount(0);
        jT.setModel(model);
    }
    
}
