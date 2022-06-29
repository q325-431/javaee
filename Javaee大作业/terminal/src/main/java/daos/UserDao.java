package daos;

import beans.User;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.MySQLUtils;

import java.util.List;

public class UserDao {
    private JdbcTemplate template = new JdbcTemplate(MySQLUtils.getDataSource());

    public boolean checkUser(String email_phone) {
        //判定邮箱还是手机
        String column = email_phone.indexOf('@') == -1 ? "mobile_phone" : "email";
        List<User> userList = template.query("select * from user where " + column + " = ?",
                new BeanPropertyRowMapper<User>(User.class),
                new Object[]{email_phone});
        return userList.size() != 0;
    }

    public boolean checkUser2(String UID) {
        List<User> userList = template.query("select * from user where user_id = ?",
                new BeanPropertyRowMapper<User>(User.class),
                new Object[]{UID});
        return userList.size() != 0;
    }

    public boolean checkUser3(String username) {
        List<User> userList = template.query("select * from user where username = ?",
                new BeanPropertyRowMapper<User>(User.class),
                new Object[]{username});
        return userList.size() != 0;
    }

    public boolean signUser(String email_phone, String password) {
        //判定邮箱还是手机
        String column = email_phone.indexOf('@') == -1 ? "mobile_phone" : "email";

        int update = template.update("insert into user(user_id," + column + ",password) values(?,?,?)"
                , new Object[]{generateUserID(), email_phone, password});

        return update > 0;
    }

    public boolean modifyPassword(String email, String new_password) {
        int update = template.update("update user set password=? where email=?", new Object[]{new_password, email});
        return update > 0;
    }

    public boolean modifyEmailPhone(String UID, String email_phone) {
        String column = email_phone.indexOf('@')==-1?"mobile_phone":"email";
        int update = template.update("update user set "+column+"=? where user_id=?", new Object[]{email_phone, UID});
        return update > 0;
    }

    public User findUserByUID(String UID) {
        List<User> userList = template.query("select * from user where user_id=?",
                new BeanPropertyRowMapper<User>(User.class),
                new Object[]{UID});
        if (userList.size() == 0) return null;
        return userList.get(0);
    }

    public User login(String user, String password) {
        String column = null;
        if (user.indexOf('@') != -1) {
            //邮箱
            column = "email";
        } else if (isNumberPure(user)) {
            //手机号
            column = "mobile_phone";
        } else {
            //用户名
            column = "username";
        }
        System.out.println("select * from user where " + column + "=? and password=?");
        List<User> userList = template.query("select * from user where " + column + "=? and password=?",
                new BeanPropertyRowMapper<User>(User.class),
                new Object[]{user, password});
        if (userList.size() == 0) return null;
        return userList.get(0);
    }

    @Test
    public void test() {
        System.out.println(isNumberPure("15310108138"));
        System.out.println(login("15310108138", "admin123"));
    }

    private boolean isNumberPure(String user) {
        for (int i = 0; i < user.length(); i++) {
            if (user.charAt(i) < '0' || user.charAt(i) > '9') {
                System.out.println(user.indexOf(i));
                System.out.println(i);
                return false;
            }
        }
        return true;
    }

    private String generateUserID() {
        String p = "1234567890qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM";
        StringBuilder stringBuilder = null;
        do {
            stringBuilder = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                int index = (int) Math.round(Math.random() * p.length());
                stringBuilder.append(p.charAt(index % p.length()));
            }
        } while (checkUser2(stringBuilder.toString()));
        return stringBuilder.toString();
    }
}
