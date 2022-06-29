package daos;

import beans.Merchandise;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.MySQLUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class MerchandiseDao {
    private JdbcTemplate template = new JdbcTemplate(MySQLUtils.getDataSource());

    public List<Merchandise> findAbout(String name) {
        List<Merchandise> merchandiseList = template.query("select * from merchandise where merClass=?"
                , new BeanPropertyRowMapper<Merchandise>(Merchandise.class), new Object[]{name});
        return merchandiseList;
    }

    public boolean deleteItem(String user_id, String merName, String time_) {
        int update = template.update("delete from purchaseCart where user_id=? and merName=? and time_=?",
                new Object[]{user_id, merName, time_});
        return update > 0;
    }

    public boolean addToCart(String user_id, String merName, Double merPrice, Integer cnt) {
        int update = template.update("insert into purchaseCart(user_id,merName,merPrice,cnt) values(?,?,?,?)",
                new Object[]{user_id, merName, merPrice, cnt});
        return update > 0;
    }

    @Test
    public void test() {

    }
}
