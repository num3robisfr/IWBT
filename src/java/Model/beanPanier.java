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
    
//    public void add(String ref) {
//        add(null, ref, null, 1);        
//    }
    
    public void add(String urlImage, String ref, String titre) {
        add(urlImage, ref, titre, 1);
    }
    
    public void add(String urlImage, String ref, String titre, String qty) {
        try {
            int q = Integer.parseInt(qty);
            add(urlImage, ref, titre, q);
        } catch (NumberFormatException e) {
            System.out.println("Oops:" + e.getMessage());
        }
    }
    
    public void add(String urlImage, String ref, String titre, int qty) {
        Item i = null;
        if (map.containsKey(ref)) {
            i = map.get(ref);
//            i = map.get(urlImage);
//            i = map.get(ref);
//            i = map.get(titre);
            i.change(qty);
        } else {
            i = new Item(urlImage, ref, titre, qty);
            map.put(ref, i);
        }
        if (i.getQty() < 1) {
            del(ref);
        }
        System.out.println(i);
    }
    
    public void dec(String urlImage, String ref, String titre) {
        add(urlImage, ref, titre, -1);
    }
    
    public void dec(String urlImage, String ref, String titre, int qty) {
        add(urlImage, ref, titre, -qty);
    }
    
    
//    public void dec(String urlImage, String ref, String titre, int qty) {
//        if (map.containsKey(ref)) {
//        Item i = map.get(ref);
//            i.minus(qty);
//        }
//    }
    
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
