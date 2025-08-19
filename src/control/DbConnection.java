package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	static Connection con = null;
	public static Connection getConnection() throws ClassNotFoundException 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication", "root","");
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
			System.out.println("Exception in Connection " + e);
		}
		return con;
	}
}
