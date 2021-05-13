package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

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
	
	public int getNext()
	{
		String SQL = "SELECT itemID FROM Item ORDER BY itemID DESC";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1)+1;
			}
			return 1;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public int upload(Item it)
	{
		String SQL = "INSERT INTO Item VALUES (?,?,?,?,?,?,?)";
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, it.getItemTitle());
			pstmt.setString(3, it.getItemText());
			pstmt.setString(4, it.getItemImage());
			pstmt.setInt(5, it.getItemCount());
			pstmt.setInt(6, it.getItemPrice());
			pstmt.setString(7, it.getItemImageReal());
			return pstmt.executeUpdate();	
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}

}
