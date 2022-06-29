package daos;

import beans.Cart;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.MySQLUtils;

import java.util.List;

public class CartDao {
    private JdbcTemplate template = new JdbcTemplate(MySQLUtils.getDataSource());
    public List<Cart> findAll(String user_id){
        List<Cart> cartList = template.query("select * from purchaseCart where user_id = ? order by time_ desc"
                , new BeanPropertyRowMapper<Cart>(Cart.class)
                ,new Object[]{user_id});
        return cartList;
    }
    public int getSize(String user_id){
        List<Cart> cartList = template.query("select * from purchaseCart where user_id = ? order by time_ desc"
                , new BeanPropertyRowMapper<Cart>(Cart.class)
                ,new Object[]{user_id});
        return cartList.size();
    }
    @Test
    public void test(){
        System.out.println(getSize("DXtFzTM6wQ"));
    }
}
