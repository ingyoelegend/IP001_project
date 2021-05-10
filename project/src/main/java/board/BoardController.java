package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardController {
	
	private Connection conn;
	private ResultSet rs;

	
	public BoardController()
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
	
	
	public String getDate()
	{
		String SQL = "SELECT NOW()";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				return rs.getString(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "";
		
	}
	
	public int getNext()
	{
		String SQL = "SELECT boardID FROM Board ORDER BY boardID DESC";
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
	
	public int write(String boardTitle, String userID, String boardText)
	{
		String SQL = "INSERT INTO BOARD VALUES (?,?,?,?,?)";
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3,boardText);
			pstmt.setString(4,userID);
			pstmt.setString(5,getDate());
			return pstmt.executeUpdate();
									
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public ArrayList<Board> getBoardList(int pageNumber)
	{
		String SQL = "SELECT * FROM Board WHERE boardID < ?";
		ArrayList<Board> list = new ArrayList<Board>();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Board tmp = new Board();
				tmp.setBoardID(rs.getInt(1));
				tmp.setBoardTitle(rs.getString(2));
				tmp.setBoardText(rs.getString(3));
				tmp.setBoardWriter(rs.getString(4));
				tmp.setBoardDate(rs.getString(5));
				list.add(tmp);
			}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	
	public boolean nextPage(int pageNumber)
	{
		String SQL = "SELECT * FROM Board WHERE boardID < ?";
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
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
	
	public Board getBoardDetail(int boardID)
	{
		String SQL = "SELECT boardTitle, boardText FROM Board WHERE boardID = ?";
		Board tmp = new Board();
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				
				
				tmp.setBoardTitle(rs.getString(1));
				tmp.setBoardText(rs.getString(2));
				
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return tmp; //error
	}

}
