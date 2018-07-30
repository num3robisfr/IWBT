package Model;

import classe.Item;
import classe.ItemV2;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class beanPanierV2 implements Serializable {

    private HashMap<String, ItemV2> map = null;

    public beanPanierV2() {
        this.map = new HashMap();
    }
    public void add(String ref) {
        add(null, ref, 1);    
    }
    
    public void add(String urlImage, String ref) {
        add(urlImage, ref, 1);
    }

    public void add(String urlImage, String ref, String qty) {
        try {
            int q = Integer.parseInt(qty);
            add(urlImage, ref, q);
        } catch (NumberFormatException e) {
            System.out.println("Oops:"+ e.getMessage());
        }
    }

    public void add(String urlImage, String ref, int qty) {
        ItemV2 i = null;
        if (map.containsKey(ref)) {
            i = map.get(urlImage);
            i = map.get(ref);
            i.change(qty);
        } else {
            i = new ItemV2(urlImage, ref, qty);
            map.put(ref, i);
        }
        if( i.getQty()<1) 
            del( ref);
        System.out.println(i);
    }

    public void dec(String ref) {
        add("",ref, -1);
    }

    public void dec(String ref, int qty) {
        add("",ref, -qty);
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

    public Collection<ItemV2> getList() {
        return map.values();
    }
}