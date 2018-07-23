
package classe;

public class Statut {
    
    private int staNb;
    private String staNom;
    private String staMsg;


    
    
    /********************************************contructeur*************************************************/
        public Statut() {
    }

    public Statut(int staNb, String staMsg) {
        this.staNb = staNb;
        this.staMsg = staMsg;
    }

    public Statut(int staNb, String staNom, String staMsg) {
        this.staNb = staNb;
        this.staNom = staNom;
        this.staMsg = staMsg;
    }

        
  /********************************************getters setters*************************************************/
    
    public int getStaNb() {
        return staNb;
    }

    public void setStaNb(int staNb) {
        this.staNb = staNb;
    }

    public String getStaNom() {
        return staNom;
    }

    public void setStaNom(String staNom) {
        this.staNom = staNom;
    }

    public String getStaMsg() {
        return staMsg;
    }

    public void setStaMsg(String staMsg) {
        this.staMsg = staMsg;
    }


    
      /********************************************autres methode*************************************************/
   
        @Override
    public String toString() {
        return "Statut{" + "staNb=" + staNb + ", staNom=" + staNom + ", staMsg=" + staMsg + '}';
    }


    
}
