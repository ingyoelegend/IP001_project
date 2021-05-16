package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;
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
		String SQL = "INSERT INTO Item VALUES (?,?,?,?,?,?,?,?)";
	
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
			pstmt.setString(8, it.getItemCategory());
			return pstmt.executeUpdate();	
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}
	
	public ArrayList<Item> getItemList(int pageNumber)
	{
       
		
		String SQL = "SELECT * FROM Item WHERE itemID < ? AND itemID > ?";
		ArrayList<Item> list = new ArrayList<Item>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber*10)+1);
			pstmt.setInt(2, (pageNumber*10)-10);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Item tmp = new Item();
				tmp.setItemID(rs.getInt(1));
				tmp.setItemTitle(rs.getString(2));
				tmp.setItemText(rs.getString(3));
				tmp.setItemImage(rs.getString(4));
				tmp.setItemCount(rs.getInt(5));
				tmp.setItemPrice(rs.getInt(6));
				tmp.setItemImageReal(rs.getString(7));
				tmp.setItemCategory(rs.getString(8));
				list.add(tmp);
				
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public ArrayList<Item> getSearchItemList(int pageNumber,String search)
	{
		String SQL = "SELECT * FROM Item WHERE itemID < ? AND itemID > ? AND itemTitle LIKE ?";
		String input = "%"+search+"%";
		
		ArrayList<Item> list = new ArrayList<Item>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber*10+1);
			pstmt.setInt(2, pageNumber*10-10);
			pstmt.setString(3,input);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Item tmp = new Item();
				tmp.setItemID(rs.getInt(1));
				tmp.setItemTitle(rs.getString(2));
				tmp.setItemText(rs.getString(3));
				tmp.setItemImage(rs.getString(4));
				tmp.setItemCount(rs.getInt(5));
				tmp.setItemPrice(rs.getInt(6));
				tmp.setItemImageReal(rs.getString(7));
				tmp.setItemCategory(rs.getString(8));
				list.add(tmp);
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList<Item> getCategoryItemList(int pageNumber,String search)
	{
		String SQL = "SELECT * FROM Item WHERE itemID < ? AND itemID > ? AND itemCategory LIKE ?";
		String input = "%"+search+"%";
		ArrayList<Item> list = new ArrayList<Item>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber*10+1);
			pstmt.setInt(2, pageNumber*10-10);
			pstmt.setString(3,input);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Item tmp = new Item();
				tmp.setItemID(rs.getInt(1));
				tmp.setItemTitle(rs.getString(2));
				tmp.setItemText(rs.getString(3));
				tmp.setItemImage(rs.getString(4));
				tmp.setItemCount(rs.getInt(5));
				tmp.setItemPrice(rs.getInt(6));
				tmp.setItemImageReal(rs.getString(7));
				tmp.setItemCategory(rs.getString(8));
				list.add(tmp);
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public int delete(String itemID)
	{
		String SQL = "DELETE FROM Item WHERE itemID = ?";
	
	 
		try
		{
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, itemID);
	
			return pstmt.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}

}
