package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class ItemController {
	
	private Connection conn;
	private ResultSet rs;

	
	public ItemController()
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/PROJECT?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "0310";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
