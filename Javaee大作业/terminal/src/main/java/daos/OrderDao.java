package daos;

import beans.Cart;
import beans.Order;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.MySQLUtils;

import java.util.List;

public class OrderDao {
    private JdbcTemplate template = new JdbcTemplate(MySQLUtils.getDataSource());

    public boolean buyItem(String user_id, String merID, String status, int cnt) {
        int update = template.update("insert into orderstatus(orderID,uID,merID,status,cnt) values(?,?,?,?,?)",
                new Object[]{generateOrderID(), user_id, merID, status, cnt});
        return update > 0;
    }


    private boolean checkOrderID(String orderID) {
        List<Order> userList = template.query("select * from orderstatus where orderID = ?",
                new BeanPropertyRowMapper<Order>(Order.class),
                new Object[]{orderID});
        return userList.size() != 0;
    }

    public List<Order> findAbout(String user_id,String status,int start) {
        List<Order> orderList = template.query("select * from orders where user_id=? and status=? limit ?,5",
                new BeanPropertyRowMapper<Order>(Order.class),
                new Object[]{user_id,status,start});
        return orderList;
    }
    public int getSize(String user_id,String status){
        List<Cart> cartList = template.query("select * from orders where user_id = ? and status =? order by time_ desc"
                , new BeanPropertyRowMapper<Cart>(Cart.class)
                ,new Object[]{user_id,status});
        return cartList.size();
    }

    private String generateOrderID() {
        String p = "1234567890qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM";
        StringBuilder stringBuilder = null;
        do {
            stringBuilder = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                int index = (int) Math.round(Math.random() * p.length());
                stringBuilder.append(p.charAt(index % p.length()));
            }
        } while (checkOrderID(stringBuilder.toString()));
        return stringBuilder.toString();
    }

    @Test
    public void test() {
        int size = getSize("DXtFzTM6wQ", "未付款");
        System.out.println(size);
    }

}
