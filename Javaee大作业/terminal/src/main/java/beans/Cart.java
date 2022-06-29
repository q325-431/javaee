package beans;

import java.util.Date;

public class Cart {
    private String user_id;
    private String merName;
    private String merPrice;
    private Integer cnt;
    private Date time_;
    Cart(){}

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getMerName() {
        return merName;
    }

    public void setMerName(String merName) {
        this.merName = merName;
    }

    public String getMerPrice() {
        return merPrice;
    }

    public void setMerPrice(String merPrice) {
        this.merPrice = merPrice;
    }

    public Integer getCnt() {
        return cnt;
    }

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }

    public Date getTime_() {
        return time_;
    }

    public void setTime_(Date time_) {
        this.time_ = time_;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "user_id='" + user_id + '\'' +
                ", merName='" + merName + '\'' +
                ", merPrice='" + merPrice + '\'' +
                ", cnt=" + cnt +
                ", time_=" + time_ +
                '}';
    }
}
