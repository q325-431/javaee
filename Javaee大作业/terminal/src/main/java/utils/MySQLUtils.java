package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

/**
 * 数据库连接工具
 * 包含获取连接，获取池，释放连接功能
 */
public class MySQLUtils {
    private static DataSource dataSource=null;
    /**
     * 静态代码块，初始化静态成员
     * */
    static {
        try {
            //加载配置文件
            Properties properties = new Properties();
            properties.load(MySQLUtils.class.getClassLoader().getResourceAsStream("druid.properties"));
            //获取数据源
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取连接池的方法
     * @return 返回连接池
     */
    public static DataSource getDataSource(){
        return dataSource;
    }
}
