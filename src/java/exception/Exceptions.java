
package exception;

public class Exceptions extends Exception{
    
    private int noError;

    public Exceptions() {
    }

    public Exceptions(String message) {
        super(message);
    }

    public Exceptions(int noError, String message) {
        super(message);
        this.noError = noError;
    }
}