package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.shop.dto.ReviewDto;
import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.Book;
import kr.co.shop.vo.Review;
import kr.co.shop.vo.ReviewLikeUser;
import kr.co.shop.vo.User;

public class ReviewDao {
	
	private static final String GET_TOTAL_RECORDS_BY_BOOKNO_SQL = "select count(*) cnt from shop_book_reviews where book_no = ?";
	private static final String GET_REVIEW_BY_NO_SQL = "select * from shop_book_reviews where review_no = ?";
	private static final String GET_REVIEWDTOS_BY_BOOKNO_AND_RANGE_SQL = "select *"
																	   + " from (select row_number() over(order by a.review_no desc) rn, a.*, b.category_no, b.book_title, c.user_id, c.user_name"
																	   + " 	     from shop_book_reviews a, shop_books b, shop_users c"
																	   + "       where a.book_no = b.book_no"
																	   + "	     and a.user_no = c.user_no"
																	   + "		 and a.book_no = ?)"
																	   + " where rn >= ? and rn <= ?";
	private static final String GET_REVIEW_LIKE_USER_BY_NO_SQL = "select * from shop_review_like_users where user_no = ? and review_no = ?";
	private static final String INSERT_REVIEW_SQL = "insert into shop_book_reviews(review_no, book_no, user_no, review_title, review_content, review_point)"
												  + " values(shop_book_review_seq.nextval, ?, ?, ?, ?, ?)";
	private static final String INSERT_REVIEW_LIKE_USER_SQL = "insert into shop_review_like_users(user_no, review_no) values(?, ?)";
	private static final String UPDATE_REVIEW_SQL = "update shop_book_reviews set review_title = ?, review_content = ?, review_point = ?, review_like_count = ? where review_no = ?";
	private static final String DELETE_REVIEW_LIKE_USER_SQL = "delete from shop_review_like_users where user_no = ? and review_no = ?";
	
	private static final ReviewDao reviewDao = new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return reviewDao;
	}
	
	/**
	 * 전달받은 책번호로 저장된 리뷰의 갯수를 조회한다.
	 * @param bookNo 책번호
	 * @return 리뷰갯수
	 * @throws SQLException
	 */
	public int getTotalRecordsByBookNo(int bookNo) throws SQLException {
		int totalRecords = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_TOTAL_RECORDS_BY_BOOKNO_SQL);
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		totalRecords = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		con.close();
		return totalRecords;
	}

	/**
	 * 전달받은 리뷰번호로 리뷰정보를 조회한다.
	 * @param reviewNo 리뷰번호
	 * @return 리뷰정보
	 * @throws SQLException
	 */
	public Review getReviewByNo(int reviewNo) throws SQLException {
		Review review = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_REVIEW_BY_NO_SQL);
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			review = new Review();
			review.setNo(rs.getInt("review_no"));
			review.setBookNo(rs.getInt("book_no"));
			review.setUserNo(rs.getInt("user_no"));
			review.setTitle(rs.getString("review_title"));
			review.setContent(rs.getString("review_content"));
			review.setPoint(rs.getInt("review_point"));
			review.setLikeCount(rs.getInt("review_like_count"));
			review.setCreatedDate(rs.getDate("review_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return review;
	}
	
	/**
	 * 전달받은 사용자번호, 리뷰번호로 리뷰에 좋아요 누른 사용자를 조회한다.
	 * @param userNo 사용자번호
	 * @param reviewNo 리뷰번호
	 * @return 리뷰에 좋아요 누른 사용자
	 * @throws SQLException
	 */
	public ReviewLikeUser getReviewLikeUserByNo(int userNo, int reviewNo) throws SQLException {
		ReviewLikeUser reviewLikeUser = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_REVIEW_LIKE_USER_BY_NO_SQL);
		pstmt.setInt(1, userNo);
		pstmt.setInt(2, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			reviewLikeUser = new ReviewLikeUser();
			reviewLikeUser.setUserNo(userNo);
			reviewLikeUser.setReviewNo(reviewNo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return reviewLikeUser;
	}
	
	/**
	 * 전달받은 책번호로 리뷰를 조회하고, 전달 받은 범위 내의 리뷰정보를 조회한다.
	 * @param begin 조회할 시작지점
	 * @param end 조회할 끝지점
	 * @param bookNo 책번호
	 * @return 범위내 리뷰정보
	 * @throws SQLException
	 */
	public List<ReviewDto> getReviewDtosByBookNoAndRange(int begin, int end, int bookNo) throws SQLException {
		List<ReviewDto> reviewDtos = new ArrayList<ReviewDto>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_REVIEWDTOS_BY_BOOKNO_AND_RANGE_SQL);
		pstmt.setInt(1, bookNo);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setNo(rs.getInt("review_no"));
			reviewDto.setTitle(rs.getString("review_title"));
			reviewDto.setContent(rs.getString("review_content"));
			reviewDto.setPoint(rs.getInt("review_point"));
			reviewDto.setLikeCount(rs.getInt("review_like_count"));
			reviewDto.setCreatedDate(rs.getDate("review_created_date"));
			
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			reviewDto.setUser(user);
			
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setCategoryNo(rs.getInt("category_no"));
			book.setTitle(rs.getString("book_title"));
			reviewDto.setBook(book);
			
			reviewDtos.add(reviewDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return reviewDtos;
	}
	
	/**
	 * 전달받은 리뷰정보를 데이터베이스에 저장한다.
	 * @param review 리뷰정보
	 * @throws SQLException
	 */
	public void insertReview(Review review) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_REVIEW_SQL);
		pstmt.setInt(1, review.getBookNo());
		pstmt.setInt(2, review.getUserNo());
		pstmt.setString(3, review.getTitle());
		pstmt.setString(4, review.getContent());
		pstmt.setInt(5, review.getPoint());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 * 전달받은 사용자번호, 리뷰번호를 리뷰에 좋아요누른 사용자 정보 테이블에 저장한다.
	 * @param userNo 사용자번호
	 * @param reviewNo 리뷰번호
	 * @throws SQLException
	 */
	public void insertReviewLikeUser(int userNo, int reviewNo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_REVIEW_LIKE_USER_SQL);
		pstmt.setInt(1, userNo);
		pstmt.setInt(2, reviewNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 * 전달받은 리뷰정보로 수정한다.
	 * @param review 리뷰정보
	 * @throws SQLException
	 */
	public void updateReview(Review review) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UPDATE_REVIEW_SQL);
		pstmt.setString(1, review.getTitle());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getPoint());
		pstmt.setInt(4, review.getLikeCount());
		pstmt.setInt(5, review.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 * 전달받은 사용자번호와 리뷰번호로 좋아요 누른 사용자를 데이터베이스에서 찾아 좋아요정보를 삭제한다.
	 * @param userNo 사용자번호
	 * @param reviewNo 리뷰번호
	 * @throws SQLException
	 */
	public void deleteReviewLikeUser(int userNo, int reviewNo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(DELETE_REVIEW_LIKE_USER_SQL);
		pstmt.setInt(1, userNo);
		pstmt.setInt(2, reviewNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
