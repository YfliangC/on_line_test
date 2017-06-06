package onlinetest;
/**
 * Created by Maibenben on 2017/6/3.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {

    private static Connection conn = null;
    private static String userName = "root";
    private static String userPasswd = "747060";
    private static String dbName = "on_line_test";
    private static String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd + "&useUnicode=true&characterEncoding=gbk&useSSL=true";


    /*连接数据库*/
    public static Connection getConnection(){
        try{
            String driverName = "com.mysql.jdbc.Driver";
            Class.forName(driverName);
            conn = DriverManager.getConnection(url);
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return conn;
    }

    /*关闭数据库连接*/
    public static void closeConnection(){
        if(conn != null){
            try{
                conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
}

