import com.mysql.jdbc.Driver;

import java.sql.*;

/**
 * Created by AnLu on
 * 2017/5/23 17:19.
 * MySQL_1702
 */
public class SelectTest {

    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL = "SELECT count(*) FROM db_1702.ip WHERE geo RLIKE ?";

    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL);
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1,"拉萨市");
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        System.out.println(resultSet.getInt(1));

        resultSet.close();
        preparedStatement.close();
        connection.close();
    }
}
