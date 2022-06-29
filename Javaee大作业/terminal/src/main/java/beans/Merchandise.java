package beans;

public class Merchandise {
    private String merID;
    private String merName;
    private String merClass;
    private String merRes;
    private double merPrice;
    private int merCount;
    private String merDes;
    Merchandise(){}

    public String getMerID() {
        return merID;
    }

    public void setMerID(String merID) {
        this.merID = merID;
    }

    public String getMerName() {
        return merName;
    }

    public void setMerName(String merName) {
        this.merName = merName;
    }

    public String getMerClass() {
        return merClass;
    }

    public void setMerClass(String merClass) {
        this.merClass = merClass;
    }

    public String getMerRes() {
        return merRes;
    }

    public void setMerRes(String merRes) {
        this.merRes = merRes;
    }

    public double getMerPrice() {
        return merPrice;
    }

    public void setMerPrice(double merPrice) {
        this.merPrice = merPrice;
    }

    public int getMerCount() {
        return merCount;
    }

    public void setMerCount(int merCount) {
        this.merCount = merCount;
    }

    public String getMerDes() {
        return merDes;
    }

    public void setMerDes(String merDes) {
        this.merDes = merDes;
    }

    @Override
    public String toString() {
        return "Merchandise{" +
                "merID='" + merID + '\'' +
                ", merName='" + merName + '\'' +
                ", merClass='" + merClass + '\'' +
                ", merRes='" + merRes + '\'' +
                ", merPrice=" + merPrice +
                ", merCount=" + merCount +
                ", merDes='" + merDes + '\'' +
                '}';
    }
}
