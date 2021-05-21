package userQuiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

public class UserController {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public UserController()
	{
		try
		{
			String dbURL = "jdbc:mysql://localhost:3306/QUIZ?serverTimezone=UTC";
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
	
	
	
	public int join(User user)
	{
		String SQL = "INSERT INTO USER (userName,userGender,userHobby,userPhone) VALUES (?,?,?,?)";
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserGender());
			pstmt.setString(3, user.getUserHobby());
			pstmt.setString(4, user.getUserPhone());
			return pstmt.executeUpdate();
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}
	
	
	
	
	
	
	public ArrayList<User> profile()
	{
		String SQL = "SELECT * FROM USER";
		ArrayList<User> list = new ArrayList<User>();
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				User tmp = new User();
				tmp.setUserID(rs.getInt(1));
				tmp.setUserName(rs.getString(2));
				tmp.setUserGender(rs.getString(3));
				tmp.setUserHobby(rs.getString(4));
				tmp.setUserPhone(rs.getString(5));
				list.add(tmp);;
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
}
