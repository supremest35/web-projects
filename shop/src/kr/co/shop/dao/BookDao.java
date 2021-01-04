package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.shop.dto.BookDto;
import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.Book;
import kr.co.shop.vo.Category;

public class BookDao {

	private static final String GET_TOTAL_RECORDS_BY_CATEGORYTYPE_SQL = "select count(*) cnt from shop_books a, shop_book_categories b where a.category_no = b.category_no and b.category_type = ?";
	private static final String GET_BOOK_BY_NO_SQL = "select * from shop_books where book_no = ?";
	private static final String GET_FOUR_NEW_BOOKS_SQL = "select *"
													   + " from (select row_number() over (order by a.book_created_date desc, a.book_no desc) rn, a.*"
													   + "		 from shop_books a)"
													   + " where rn <= 4";
	private static final String GET_FOUR_BEST_BOOKS_SQL = "select *"
													    + " from (select row_number() over (order by a.book_created_date asc, a.book_no asc) rn, a.*"
													    + "		 from shop_books a"
													    + "		 where a.book_best = 'Y')"
													    + " where rn <= 4";
	
	private static final String GET_BOOKDTO_BY_NO_SQL = "select a.* , b.category_name, b.category_type"
													  + " from shop_books a, shop_book_categories b"
													  + " where a.book_no = ?";
	private static final String GET_BOOKS_BY_RANGE_AND_CATEGORY_TYPE_SQL = "select *"
													   					 + " from (select row_number() over (order by a.book_no desc) rn, a.*, b.category_name, b.category_type "
													   					 + "		 from shop_books a, shop_book_categories b"
													   					 + "		 where a.category_no = b.category_no"
													   					 + "		 and b.category_type = ?)"
													   					 + " where rn >= ? and rn <= ?";
	private static final String UPDATE_BOOK_SQL = "update shop_books set book_price = ?, book_discount_price = ?, book_discount_rate = ?, book_point_rate = ?, book_status = ?, book_review_count = ?, book_review_point = ?, book_free_delivery = ?, book_best = ?, book_stock= ?, book_point = ?"
												+ " where book_no = ?";
	
	private static final BookDao bookDao = new BookDao();
	private BookDao() {}
	public static BookDao getInstance() {
		return bookDao;
	}
	
	/**
	 * 전달받은 카테고리타입에 해당되는 모든 레코드갯수 조회
	 * @param categoryType 카테고리타입
	 * @return 레코드갯수
	 * @throws SQLException
	 */
	public int getTotalRecordsByCategoryType(int categoryType) throws SQLException {
		int totalRecords = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_TOTAL_RECORDS_BY_CATEGORYTYPE_SQL);
		pstmt.setInt(1, categoryType);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		totalRecords = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		con.close();
		return totalRecords;
	}
	
	/**
	 * 전달받은 책 번호로 책정보 조회
	 * @param bookNo 책번호
	 * @return 책정보
	 * @throws SQLException
	 */
	public Book getBookByNo(int bookNo) throws SQLException {
		Book book = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOOK_BY_NO_SQL);
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setCategoryNo(rs.getInt("category_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setTranslator(rs.getString("book_translator"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPublishedDate(rs.getDate("book_pub_date"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setDiscountRate(rs.getDouble("book_discount_rate"));
			book.setPoint(rs.getInt("book_point"));
			book.setPointRate(rs.getDouble("book_point_rate"));
			book.setStock(rs.getInt("book_stock"));
			book.setStatus(rs.getString("book_status"));
			book.setReviewCount(rs.getInt("book_review_count"));
			book.setReviewPoint(rs.getDouble("book_review_point"));
			book.setFreeDelivery(rs.getString("book_free_delivery"));
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setCreatedDate(rs.getDate("book_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return book;
	}
	
	/**
	 * 전달받은 책번호로 책 세부정보 조회
	 * @param bookNo 책번호
	 * @return 책 세부정보
	 * @throws SQLException
	 */
	public BookDto getBookDtoByNo(int bookNo) throws SQLException {
		BookDto bookDto = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOOKDTO_BY_NO_SQL);
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			bookDto = new BookDto();
			bookDto.setNo(rs.getInt("book_no"));
			bookDto.setTitle(rs.getString("book_title"));
			bookDto.setWriter(rs.getString("book_writer"));
			bookDto.setTranslator(rs.getString("book_translator"));
			bookDto.setPublisher(rs.getString("book_publisher"));
			bookDto.setPublishedDate(rs.getDate("book_pub_date"));
			bookDto.setPrice(rs.getInt("book_price"));
			bookDto.setDiscountPrice(rs.getInt("book_discount_price"));
			bookDto.setDiscountRate(rs.getDouble("book_discount_rate"));
			bookDto.setPoint(rs.getInt("book_point"));
			bookDto.setPointRate(rs.getDouble("book_point_rate"));
			bookDto.setStock(rs.getInt("book_stock"));
			bookDto.setStatus(rs.getString("book_status"));
			bookDto.setReviewCount(rs.getInt("book_review_count"));
			bookDto.setReviewPoint(rs.getDouble("book_review_point"));
			bookDto.setFreeDelivery(rs.getString("book_free_delivery"));
			bookDto.setBest(rs.getString("book_best"));
			bookDto.setFileName(rs.getString("book_filename"));
			bookDto.setCreatedDate(rs.getDate("book_created_date"));
			
			Category category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			category.setType(rs.getInt("category_type"));
			bookDto.setCategory(category);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return bookDto;
	}
	
	/**
	 * 가장 최근에 등록된 책정보 4개 조회
	 * @return 책정보 리스트
	 * @throws SQLException
	 */
	public List<Book> getFourNewBooks() throws SQLException {
		List<Book> books = new ArrayList<Book>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_FOUR_BEST_BOOKS_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setCategoryNo(rs.getInt("category_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setTranslator(rs.getString("book_translator"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPublishedDate(rs.getDate("book_pub_date"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setDiscountRate(rs.getDouble("book_discount_rate"));
			book.setPoint(rs.getInt("book_point"));
			book.setPointRate(rs.getDouble("book_point_rate"));
			book.setStock(rs.getInt("book_stock"));
			book.setStatus(rs.getString("book_status"));
			book.setReviewCount(rs.getInt("book_review_count"));
			book.setReviewPoint(rs.getDouble("book_review_point"));
			book.setFreeDelivery(rs.getString("book_free_delivery"));
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setCreatedDate(rs.getDate("book_created_date"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return books;
	}
	
	/**
	 * 베스트 셀러중 4개의 책정보 조회
	 * @return 책정보 리스트 조회
	 * @throws SQLException
	 */
	public List<Book> getFourBestBooks() throws SQLException {
		List<Book> books = new ArrayList<Book>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_FOUR_NEW_BOOKS_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setCategoryNo(rs.getInt("category_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setTranslator(rs.getString("book_translator"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPublishedDate(rs.getDate("book_pub_date"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setDiscountRate(rs.getDouble("book_discount_rate"));
			book.setPoint(rs.getInt("book_point"));
			book.setPointRate(rs.getDouble("book_point_rate"));
			book.setStock(rs.getInt("book_stock"));
			book.setStatus(rs.getString("book_status"));
			book.setReviewCount(rs.getInt("book_review_count"));
			book.setReviewPoint(rs.getDouble("book_review_point"));
			book.setFreeDelivery(rs.getString("book_free_delivery"));
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setCreatedDate(rs.getDate("book_created_date"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return books;
	}
	
	/**
	 * 전달받은 카테고리 타입에 해당하고 범위에 해당하는 책 세부정보 리스트 조회
	 * @param begin 시작점
	 * @param end 끝점
	 * @param categoryType 카테고리 타입
	 * @return 책 세부정보 리스트
	 * @throws SQLException
	 */
	public List<BookDto> getBooksByRangeAndCategoryType(int begin, int end, int categoryType) throws SQLException {
		List<BookDto> bookDtos = new ArrayList<BookDto>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOOKS_BY_RANGE_AND_CATEGORY_TYPE_SQL);
		pstmt.setInt(1, categoryType);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BookDto bookDto = new BookDto();
			bookDto.setNo(rs.getInt("book_no"));
			bookDto.setTitle(rs.getString("book_title"));
			bookDto.setWriter(rs.getString("book_writer"));
			bookDto.setTranslator(rs.getString("book_translator"));
			bookDto.setPublisher(rs.getString("book_publisher"));
			bookDto.setPublishedDate(rs.getDate("book_pub_date"));
			bookDto.setPrice(rs.getInt("book_price"));
			bookDto.setDiscountPrice(rs.getInt("book_discount_price"));
			bookDto.setDiscountRate(rs.getDouble("book_discount_rate"));
			bookDto.setPoint(rs.getInt("book_point"));
			bookDto.setPointRate(rs.getDouble("book_point_rate"));
			bookDto.setStock(rs.getInt("book_stock"));
			bookDto.setStatus(rs.getString("book_status"));
			bookDto.setReviewCount(rs.getInt("book_review_count"));
			bookDto.setReviewPoint(rs.getDouble("book_review_point"));
			bookDto.setFreeDelivery(rs.getString("book_free_delivery"));
			bookDto.setBest(rs.getString("book_best"));
			bookDto.setFileName(rs.getString("book_filename"));
			bookDto.setCreatedDate(rs.getDate("book_created_date"));
			
			Category category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			category.setType(rs.getInt("category_type"));
			bookDto.setCategory(category);
			
			bookDtos.add(bookDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return bookDtos;
	}
	
	/**
	 * 전달받은 책정보로 데이터베이스의 책 정보 수정
	 * @param book 책정보
	 * @throws SQLException
	 */
	public void updateBook(Book book) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UPDATE_BOOK_SQL);
		pstmt.setInt(1, book.getPrice());
		pstmt.setInt(2, book.getDiscountPrice());
		pstmt.setDouble(3, book.getDiscountRate());
		pstmt.setDouble(4, book.getPointRate());
		pstmt.setString(5, book.getStatus());
		pstmt.setInt(6, book.getReviewCount());
		pstmt.setDouble(7, book.getReviewPoint());
		pstmt.setString(8, book.getFreeDelivery());
		pstmt.setString(9, book.getBest());
		pstmt.setInt(10, book.getStock());
		pstmt.setInt(11, book.getPoint());
		pstmt.setInt(12,  book.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}

