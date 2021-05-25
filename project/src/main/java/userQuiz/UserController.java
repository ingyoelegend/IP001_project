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
		String SQL = "INSERT INTO USER (id,name,snum,year,pass,email) VALUES (?,?,?,?,?,?)";
	
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getSnum());
			pstmt.setInt(4, user.getYear());
			pstmt.setString(5, user.getPass());
			pstmt.setString(6, user.getEmail());
			return pstmt.executeUpdate();
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			return -1; //error
	}
	
	
		
	
	
}
