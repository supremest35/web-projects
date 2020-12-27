package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.User;

public class UserDao {
	
	private static final String GET_USER_BY_USERID_SQL = "select * from shop_users where user_id = ?";
	private static final String INSERT_USER_SQL = "insert into shop_users(user_no, user_id, user_password, user_name, user_tel, user_email)"
												+ " values(shop_user_no_seq.nextval, ?, ?, ?, ?, ?)";
	
	private static final UserDao userDao = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return userDao;
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_USER_BY_USERID_SQL);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setTel(rs.getString("user_tel"));
			user.setEmail(rs.getString("user_email"));
			user.setGrade(rs.getString("user_grade"));
			user.setPoint(rs.getInt("user_point"));
			user.setStatus(rs.getString("user_status"));
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
