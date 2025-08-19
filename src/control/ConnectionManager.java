package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class ConnectionManager {
    
    public Connection getConnection()
    {
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/cloud_deduplication";
            con = DriverManager.getConnection(connectionURL, "root", "");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
    public Statement statement()
    {
        Statement statement=null;
        try
        {
            statement= getConnection().createStatement();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return statement;
    }
}
