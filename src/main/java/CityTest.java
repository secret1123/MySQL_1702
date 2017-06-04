import com.mysql.jdbc.Driver;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by AnLu on
 * 2017/5/25 16:25.
 * MySQL_1702
 */
public class CityTest {

    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static final String SQL_COUNT = "SELECT count(*) FROM db_1702.ip WHERE geo REGEXP ?";
    private static final String SQL_CITY = "SELECT id,city from db_1702.city";
    private static final String SQL_UPDATE = "UPDATE db_1702.city SET count = ? WHERE id = ?";
    private static final String SQL_QUERY = "SELECT * FROM db_1702.city ORDER BY count DESC";
    private static Map<Integer,String> cities = new LinkedHashMap<>();

    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL);
        //查看所有城市
        PreparedStatement preparedStatement = connection.prepareStatement(SQL_CITY);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String city = resultSet.getString("city");
            cities.put(id,city);
        }

        resultSet.close();

        connection.setAutoCommit(false);
        PreparedStatement statement = null;
        //查看每个城市的IP数量
        for (Map.Entry<Integer,String> entry : cities.entrySet()) {
            preparedStatement = connection.prepareStatement(SQL_COUNT);
            preparedStatement.setString(1,entry.getValue());
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            int id = entry.getKey();
            // 更新city表的count字段
            statement = connection.prepareStatement(SQL_UPDATE);
            statement.setInt(1,count);
            statement.setInt(2,id);
            preparedStatement.addBatch();
        }
        if (statement != null) {
            statement.executeBatch();
            connection.commit();
            statement.close();
        }

        //查询city表，存储格式化date
        preparedStatement = connection.prepareStatement(SQL_QUERY);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter("ip/data/output.txt",true))){
                String city = resultSet.getString("city");
                String lon = resultSet.getString("lon");
                String lat = resultSet.getString("lat");
                int count = resultSet.getInt("count");
                String data = "{name: " + city + ", value:["+ lon +"," + lat + "," + count + "]},";
                bufferedWriter.write(data + "\n");
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
