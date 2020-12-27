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
import kr.co.shop.vo.User;

public class ReviewDao {
	
	private static final String GET_TOTAL_RECORDS_BY_BOOKNO_SQL = "select count(*) cnt from shop_book_reviews where book_no = ?";
	private static final String GET_REVIEWDTOS_BY_BOOKNO_AND_RANGE_SQL = "select *"
																	   + " from (select row_number() over(order by a.review_no desc) rn, a.*, b.category_no, b.book_title, c.user_id, c.user_name"
																	   + " 	     from shop_book_reviews a, shop_books b, shop_users c"
																	   + "       where a.book_no = b.book_no"
																	   + "	     and a.user_no = c.user_no"
																	   + "		 and a.book_no = ?)"
																	   + " where rn >= ? and rn <= ?";
	private static final String INSERT_REVIEW_SQL = "insert into shop_book_reviews(review_no, book_no, user_no, review_title, review_content, review_point)"
												  + " values(shop_book_review_seq.nextval, ?, ?, ?, ?, ?)";
	
	private static final ReviewDao reviewDao = new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return reviewDao;
	}
	
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
}
