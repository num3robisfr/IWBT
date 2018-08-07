package Model;

import classe.Item;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class beanPanier implements Serializable {
    
    private HashMap<String, Item> map = null;
    Item i = null;

    public beanPanier() {
        this.map = new HashMap();
    }

    public void add(String urlImage, String ref, String titre, Double prix) {
        add(urlImage, ref, titre, prix, 1);
    }

    public void add(String urlImage, String ref, String titre, String prix) {
        try {
            Double p = Double.parseDouble(prix);
            add(urlImage, ref, titre, p, 1);
        } catch (NumberFormatException e) {
            System.out.println("Oops:" + e.getMessage());
        }
    }

    public void add(String urlImage, String ref, String titre, String prix, String qty) {
        try {
            Double p = Double.parseDouble(prix);
            int q = Integer.parseInt(qty);
            add(urlImage, ref, titre, p, q);
        } catch (NumberFormatException e) {
            System.out.println("Oops:" + e.getMessage());
        }
    }

    public void add(String urlImage, String ref, String titre, Double prix, int qty) {

        if (map.containsKey(ref)) {
            i = map.get(ref);
            i.change(qty);
        } else {
            i = new Item(urlImage, ref, titre, prix, qty);
            map.put(ref, i);
        }
        if (i.getQty() < 1) {
            del(ref);
        }
        System.out.println(i);
    }

    public void dec(String urlImage, String ref, String titre, String prix) {
        Double p = Double.parseDouble(prix);
        add(urlImage, ref, titre, p, -1);
    }

    public void dec(String urlImage, String ref, String titre, Double prix, int qty) {
        add(urlImage, ref, titre, prix, -qty);
    }

//    public void dec(String urlImage, String ref, String titre, int qty) {
//        Item i = null;
//        if (map.containsKey(ref)) {
//        i = map.get(ref);
//            i.minus(qty);
//        }if (i.getQty() < 1) {
//            del(ref);
//        }
//    }
    public void del(String ref) {
        map.remove(ref);
        // total = total - i.getSomme();
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

    public Collection<Item> getList() {
        return map.values();
    }

    public Double getTotal(String ref) {
        Double total = 0.0;

        if (!this.isEmpty()) {
            for (Item i : getList()) {
                total += i.getSomme();
            }
        }
        return total;
    }

    

}
