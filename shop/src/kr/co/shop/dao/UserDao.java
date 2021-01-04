package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.User;
import kr.co.shop.vo.UserPointHistory;

public class UserDao {
	
	private static final String GET_USER_BY_USERNO_SQL = "select * from shop_users where user_no = ?";
	private static final String GET_USER_BY_USERID_SQL = "select * from shop_users where user_id = ?";
	private static final String GET_POINT_HISTORY_BY_ORDERNO_SQL = "select * from shop_user_point_history where order_no = ?";
	private static final String GET_POINT_HISTORIES_BY_USER_NO_SQL = "select * from shop_user_point_history where user_no = ? order by history_no desc";
	private static final String INSERT_USER_SQL = "insert into shop_users(user_no, user_id, user_password, user_name, user_tel, user_email)"
												+ " values(shop_user_no_seq.nextval, ?, ?, ?, ?, ?)";
	private static final String INSERT_POINT_HISTORY_SQL = "insert into shop_user_point_history(history_no, user_no, history_content, order_no, history_point_amount)"
														 + " values(shop_user_point_history_no_seq.nextval, ?, ?, ?, ?)";
	private static final String UPDATE_USER_SQL = "update shop_users"
												+ "		set user_password = ?, user_tel = ?, user_email = ?, user_grade = ?, user_point = ?, user_status = ?"
												+ " where user_no = ?";
	
	private static final UserDao userDao = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
		return userDao;
	}
	
	/**
	 * 전달 받은 사용자 번호로 사용자 정보를 조회한다.
	 * @param userNo 사용자번호
	 * @return 사용자정보
	 * @throws SQLException
	 */
	public User getUserByNo(int userNo) throws SQLException {
		User user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_USER_BY_USERNO_SQL);
		pstmt.setInt(1, userNo);
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

	/**
	 * 전달받은 사용자 아이디로 사용자정보를 조회한다.
	 * @param userId 사용자아이디
	 * @return 사용자정보
	 * @throws SQLException
	 */
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
	
	/**
	 * 전달받은 주문번호로 주문할 때 적립된 포인트 내역 정보를 조회한다.
	 * @param orderNo 주문번호
	 * @return 포인트 내역 정보
	 * @throws SQLException
	 */
	public UserPointHistory getPointHistoryByOrderNo(int orderNo) throws SQLException {
		UserPointHistory userPointHistory = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_POINT_HISTORY_BY_ORDERNO_SQL);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			userPointHistory = new UserPointHistory();
			userPointHistory.setNo(rs.getInt("history_no"));
			userPointHistory.setUserNo(rs.getInt("user_no"));
			userPointHistory.setContent(rs.getString("history_content"));
			userPointHistory.setOrderNo(rs.getInt("order_no"));
			userPointHistory.setAmount(rs.getInt("history_point_amount"));
			userPointHistory.setCreatedDate(rs.getDate("history_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return userPointHistory;
	}
	
	/**
	 * 전달받은 사용자번호로 포인트 내역을 조회한다.
	 * @param userNo 사용자번호
	 * @return 포인트 내역
	 * @throws SQLException
	 */
	public List<UserPointHistory> getPointHistoriesByUserNo(int userNo) throws SQLException {
		List<UserPointHistory> userPointHistories = new ArrayList<UserPointHistory>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_POINT_HISTORIES_BY_USER_NO_SQL);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			UserPointHistory userPointHistory = new UserPointHistory();
			userPointHistory.setNo(rs.getInt("history_no"));
			userPointHistory.setUserNo(rs.getInt("user_no"));
			userPointHistory.setContent(rs.getString("history_content"));
			userPointHistory.setOrderNo(rs.getInt("order_no"));
			userPointHistory.setAmount(rs.getInt("history_point_amount"));
			userPointHistory.setCreatedDate(rs.getDate("history_created_date"));
			userPointHistories.add(userPointHistory);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return userPointHistories;
	}
	
	/**
	 * 전달받은 사용자 정보를 저장한다.
	 * @param user 사용자 정보
	 * @throws SQLException
	 */
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
	
	/**
	 * 전달받은 사용자 정보를 수정한다.
	 * @param user 사용자정보
	 * @throws SQLException
	 */
	public void updateUser(User user) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UPDATE_USER_SQL);
		pstmt.setString(1, user.getPassword());
		pstmt.setString(2, user.getTel());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getGrade());
		pstmt.setInt(5, user.getPoint());
		pstmt.setString(6, user.getStatus());
		pstmt.setInt(7, user.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 *  전달받은 포인트 내역을 저장한다.
	 * @param userPointHistory 포인트 내역
	 * @throws SQLException
	 */
	public void insertPointHistory(UserPointHistory userPointHistory) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_POINT_HISTORY_SQL);
		pstmt.setInt(1, userPointHistory.getUserNo());
		pstmt.setString(2, userPointHistory.getContent());
		if (userPointHistory.getOrderNo() == 0) {
			pstmt.setNull(3, Types.INTEGER);
		} else {
			pstmt.setInt(3, userPointHistory.getOrderNo());
		}
		pstmt.setInt(4, userPointHistory.getAmount());
		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	}
}
