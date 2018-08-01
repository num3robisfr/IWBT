package classe;

import java.io.Serializable;

public class Item implements Serializable {

    private String urlImage;
    private String ref;
    private String titre;
    private int qty;

    public Item(String urlImage, String ref, String titre, int qty) {
        this.urlImage = urlImage;
        this.ref = ref;
        this.titre = titre;
        this.qty = qty;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }
    
    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    public void change( int qty) {
        this.qty+= qty;
    }
    
//    public void minus ( int qty) {
//        this.qty-= qty;
//    }

    @Override
    public String toString() {
        return "Item{" + "urlImage=" + urlImage + ", ref=" + ref + ", titre=" + titre + ", qty=" + qty + '}';
    }

    
    
    
    
}

