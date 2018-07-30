package classe;

public class ItemV2 {
    
    private String urlImage;
    private String ref;
    private int qty;

    public ItemV2(String urlImage, String ref, int qty) {
        this.urlImage = urlImage;
        this.ref = ref;
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

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    public void change( int qty) {
        this.qty+= qty;
    }

    @Override
    public String toString() {
        return "ItemV2{" + "urlImage=" + urlImage + ", ref=" + ref + ", qty=" + qty + '}';
    }
    
    
    
}
