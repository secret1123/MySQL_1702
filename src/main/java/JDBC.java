import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by AnLu on
 * 2017/5/16 17:29.
 * MySQL_1702
 */
public class JDBC {

    //JDBC Java Database Connectivity   Java语言数据库连接
    public static void main(String[] args) throws SQLException {
        //1. 准备数据库驱动
        new Driver();
        //2. 取得一次数据库连接
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_1702","root","system");
        //3. 预编译语句
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO db_1702.course VALUES (NULL ,'front-end','2017-5-1 9:1:1',2)");
        //4. 执行语句
        preparedStatement.executeUpdate();
    }
}
