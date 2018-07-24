package Model;

import classe.LigneDeCommande;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class beanPanier implements Serializable {

    private HashMap<String, LigneDeCommande> map = null;

    public beanPanier() {
        this.map = new HashMap();
    }

    public void add(String ref) {
        add(ref, 1);
    }

    public void add(String ref, String qty) {
        try {
            int q = Integer.parseInt(qty);
            add(ref, q);
        } catch (NumberFormatException e) {
            System.out.println("Oops:"+ e.getMessage());
//            add(ref, 0);
        }
    }

    public void add(String ref, int qty) {
        LigneDeCommande i = null;
        if (map.containsKey(ref)) {
            i = map.get(ref);
            i.ajouterQte(qty);
//            i.setQty( i.getQty()+ qty);
        } else {
            i = new LigneDeCommande(ref, qty);
            map.put(ref, i);
        }
        if( i.getLigQteCommandee()<1) 
            del( ref);
    }

    public void dec(String ref) {
        add(ref, -1);
    }

    public void dec(String ref, int qty) {
        add(ref, -qty);
    }

    public void del(String ref) {
        map.remove(ref);
    }

    public void clean() {
        map.clear();
    }

    public boolean isEmpty() {
        return map.isEmpty();
    }

    public int size() {
        return map.size();
    }

    public void save() {
    }

    public Collection<LigneDeCommande> getList() {
        return map.values();
    }
}
