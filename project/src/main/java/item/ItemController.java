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
	
	public boolean nextCategoryPage(int pageNumber,String text)
	{
       
		
		String SQL = "SELECT * FROM(SELECT itemID,itemTitle,itemText,itemImage,itemCount,itemPrice,itemImageReal,itemCategory,ROW_NUMBER() OVER(ORDER BY itemID DESC) AS RNUM FROM Item WHERE itemCategory LIKE ? ORDER BY itemID DESC)tmp WHERE RNUM > ? AND RNUM < ?";
		String input = "%"+text+"%";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,input);
			pstmt.setInt(2, pageNumber*10-10);
			pstmt.setInt(3, pageNumber*10+1);
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return true;
				
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean nextSearchPage(int pageNumber,String text)
	{
       
		
		String SQL = "SELECT * FROM(SELECT itemID,itemTitle,itemText,itemImage,itemCount,itemPrice,itemImageReal,itemCategory,ROW_NUMBER() OVER(ORDER BY itemID DESC) AS RNUM FROM Item WHERE itemCategory LIKE ? ORDER BY itemID DESC)tmp WHERE RNUM > ? AND RNUM < ?";
		String input = "%"+text+"%";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,input);
			pstmt.setInt(2, pageNumber*10-10);
			pstmt.setInt(3, pageNumber*10+1);
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return true;
				
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
		
	}
	
	
	
	
	public ArrayList<Item> getSearchItemList(int pageNumber,String search)
	{
		String SQL = "SELECT * FROM(SELECT itemID,itemTitle,itemText,itemImage,itemCount,itemPrice,itemImageReal,itemCategory,ROW_NUMBER() OVER(ORDER BY itemID DESC) AS RNUM FROM Item WHERE itemTitle LIKE ? ORDER BY itemID DESC)tmp WHERE RNUM > ? AND RNUM < ?";
		String input = "%"+search+"%";
		
		ArrayList<Item> list = new ArrayList<Item>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,input);
			pstmt.setInt(2, pageNumber*10-10);
			pstmt.setInt(3, pageNumber*10+1);
			
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
	
	public ArrayList<Item> getItemList(int pageNumber,String search)
	{
		String SQL = "SELECT * FROM(SELECT itemID,itemTitle,itemText,itemImage,itemCount,itemPrice,itemImageReal,itemCategory,ROW_NUMBER() OVER(ORDER BY itemID DESC) AS RNUM FROM Item WHERE itemCategory LIKE ? ORDER BY itemID DESC)tmp WHERE RNUM > ? AND RNUM < ?";
		String input = "%"+search+"%";
		ArrayList<Item> list = new ArrayList<Item>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,input);
			pstmt.setInt(2, pageNumber*10-10);
			pstmt.setInt(3, pageNumber*10+1);
			
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
	

	public Item itemDetail(String item)
	{
		String SQL = "SELECT * FROM Item WHERE itemID = ?";
		Item tmp = new Item();
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
		
			pstmt.setString(1,item);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				 tmp = new Item();
				tmp.setItemID(rs.getInt(1));
				tmp.setItemTitle(rs.getString(2));
				tmp.setItemText(rs.getString(3));
				tmp.setItemImage(rs.getString(4));
				tmp.setItemCount(rs.getInt(5));
				tmp.setItemPrice(rs.getInt(6));
				tmp.setItemImageReal(rs.getString(7));
				tmp.setItemCategory(rs.getString(8));
			
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tmp;
		
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
