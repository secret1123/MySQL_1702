import com.mysql.jdbc.Driver;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by AnLu on
 * 2017/5/23 16:43.
 * MySQL_1702
 */
public class DumpIpData {

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "system";
    private static final String SQL = "INSERT INTO db_1702.ip VALUES(NULL,?,?,?)";
    private static int counter;
    private static PreparedStatement preparedStatement;

    public static void main(String[] args) throws SQLException {
        long start = System.currentTimeMillis();
        new Driver();
        Connection connection = DriverManager.getConnection(URL,USER,PASSWORD);
        connection.setAutoCommit(false);
        preparedStatement = connection.prepareStatement(SQL);
        try (BufferedReader reader = new BufferedReader(new FileReader("/Users/anlu/Desktop/ip.txt"))){
            String line;
            while ((line = reader.readLine())!= null){
                String min = line.split("\\s+")[0];
                String max = line.split("\\s+")[1];
                String geo = line.replace(min,"").replace(max,"").trim();
                dump(min,max,geo);
                if (++counter%10000==0){
                    System.out.println(counter);
                    preparedStatement.executeBatch();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        preparedStatement.executeBatch();
        connection.commit();
        preparedStatement.close();
        connection.close();
        System.out.println("total time:" +(System.currentTimeMillis()-start)/1000+"seconds.");
    }

    private static void dump(String min,String max,String geo) throws SQLException {
        preparedStatement.setString(1,min);
        preparedStatement.setString(2,max);
        preparedStatement.setString(3,geo);

        preparedStatement.addBatch();
    }
}
