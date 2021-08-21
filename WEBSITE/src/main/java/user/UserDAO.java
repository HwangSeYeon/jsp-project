package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String dbURL = "jdbc:mysql://localhost:3306/practice";
			String dbID = "root";
			String dbPassword = "1234";

			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // 

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?"; // 
		try {
			pstmt = conn.prepareStatement(SQL); // 
			pstmt.setString(1, userID); // 
			rs = pstmt.executeQuery(); // 

			if (rs.next()) {
				if (rs.getNString(1).contentEquals(userPassword)) {
					return 1; // 
				}
				return 0; // 
			}
			return -1; // 

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 
	}
	
	// 
	public int signUp(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?)"; // 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public String getUserName(String userID) {
		String SQL = "SELECT userName FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
