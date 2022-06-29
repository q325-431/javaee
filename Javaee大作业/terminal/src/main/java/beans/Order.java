package beans;

import java.util.Date;

public class Order {
    private String user_id;
    private String orderID;
    private String merName;
    private String merRes;
    private Double merPrice;
    private Integer cnt;
    private String status;
    private Date time_;
    Order(){}

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getMerName() {
        return merName;
    }

    public void setMerName(String merName) {
        this.merName = merName;
    }

    public String getMerRes() {
        return merRes;
    }

    public void setMerRes(String merRes) {
        this.merRes = merRes;
    }

    public Double getMerPrice() {
        return merPrice;
    }

    public void setMerPrice(Double merPrice) {
        this.merPrice = merPrice;
    }

    public Integer getCnt() {
        return cnt;
    }

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getTime_() {
        return time_;
    }

    public void setTime_(Date time_) {
        this.time_ = time_;
    }

    @Override
    public String toString() {
        return "Order{" +
                "user_id='" + user_id + '\'' +
                ", orderID='" + orderID + '\'' +
                ", merName='" + merName + '\'' +
                ", merRes='" + merRes + '\'' +
                ", merPrice=" + merPrice +
                ", cnt=" + cnt +
                ", status='" + status + '\'' +
                ", time_=" + time_ +
                '}';
    }
}
