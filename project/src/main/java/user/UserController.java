package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.Board;

public class UserController {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public UserController()
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
	
	public int login(String userID,String userPassword)
	{
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
	
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getString(1).equals(userPassword))
				{
					return 1; //login ok
				}
				else
				{
					return 0;// login false
				}
			}
			return -1;
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -2; //error
	}
	
	public int join(User user)
	{
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,0)";
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			return pstmt.executeUpdate();
			
		
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}
	
	public int getOpCode(String userID)
	{
		String SQL = "SELECT opCode FROM USER WHERE userID = ?";
		int result = -1;
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = rs.getInt(1);
				
				return result;
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
			
	}
	
	public int delete(String userID)
	{
		String SQL = "DELETE FROM USER WHERE userID = ?";
	
	 
		try
		{
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
	
			return pstmt.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}
	
	public int opChange(String userID,int opCode)
	{
		String SQL = "UPDATE USER SET opCode = ? WHERE userID = ?";
	
	 
		try
		{
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, opCode);
			pstmt.setString(2, userID);
	
			return pstmt.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}
	
	
	public User profile(String userID)
	{
		String SQL = "SELECT * FROM USER WHERE userID = ?";
	
		User tmp = new User();
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				
				tmp.setUserID(rs.getString(1));
				tmp.setUserPassword(rs.getString(2));
				tmp.setUserName(rs.getString(3));
				tmp.setUserAddress(rs.getString(4));
				tmp.setOpCode(rs.getInt(5));
				return tmp;
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return tmp;
		
	}
	
	
}
