package kr.co.ksy.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.ksy.web.util.ConnectionUtil;
import kr.co.ksy.web.vo.User;

public class UserDao {
	
	private static final String GET_USER_BY_ID_SQL = "select * from ksy_web_users where user_id = ? and user_disabled = 'N'";
	private static final String INSERT_USER_SQL = "insert into ksy_web_users (user_id, user_password, user_name, user_tel, user_email)"
			+ " values(?, ?, ? ,? ,?)";
	// 싱글턴 객체
	private static final UserDao userDao = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return userDao;
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_USER_BY_ID_SQL);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = new User();
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setTel(rs.getString("user_tel"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setDisabled(rs.getString("user_disabled"));
			user.setCreatedDate(rs.getDate("user_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return user;
	}
	
	public void insertUser(User user) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_USER_SQL);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getTel());
		pstmt.setString(5, user.getEmail());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
