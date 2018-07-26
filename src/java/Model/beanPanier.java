package Model;

import classe.Item;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class beanPanier implements Serializable {

    private HashMap<String, Item> map = null;

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
        Item i = null;
        if (map.containsKey(ref)) {
            i = map.get(ref);
            i.change(qty);
//            i.setQty( i.getQty()+ qty);
        } else {
            i = new Item(ref, qty);
            map.put(ref, i);
        }
        if( i.getQty()<1) 
            del( ref);
    }
    /***********************************************************************/
    public void add(String url, String ref, String qty) {
        try {
            int q = Integer.parseInt(qty);
            add(url, ref, qty);
        } catch (NumberFormatException e) {
            System.out.println("Oops:"+ e.getMessage());
        }
    }

//    public void add(String url, String ref, int qty) {
//        Item i = null;
//        if (map.containsKey(ref)) {
//            i = map.get(ref);
//            i.change(qty);
//        } else {
//            i = new Item(ref, qty);
//            map.put(ref, i);
//        }
//        if( i.getQty()<1) 
//            del( ref);
//    }
    /***********************************************************************/
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

    public Collection<Item> getList() {
        return map.values();
    }
}
