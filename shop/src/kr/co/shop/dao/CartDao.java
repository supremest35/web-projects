package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.shop.dto.CartItemDto;
import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.Book;
import kr.co.shop.vo.CartItem;
import kr.co.shop.vo.User;

public class CartDao {

	private static final String GET_CARTITEM_BY_NO_SQL = "select * from shop_book_cart_items where cart_item_no = ?";
	private static final String GET_CARTITEM_DTO_BY_NO_SQL = "select a.cart_item_no, a.cart_item_amount, a.cart_item_created_date, b.*, c.*"
														   + " from shop_book_cart_items a, shop_books b, shop_users c"
														   + " where a.book_no = b.book_no"
														   + " and a.user_no = c.user_no"
														   + " and a.cart_item_no = ?";
	private static final String GET_CARTITEM_BY_BOOKNO_AND_USERNO_SQL = "select * from shop_book_cart_items where book_no = ? and user_no = ?";
	private static final String GET_CARTITEM_DTO_BY_BOOKNO_AND_USERNO_SQL = "select a.cart_item_no, a.cart_item_amount, a.cart_item_created_date, b.*, c.*"
																		  + " from shop_book_cart_items a, shop_books b, shop_users c"
																		  + " where a.book_no = b.book_no"
																		  + " and a.user_no = c.user_no"
																		  + " and a.book_no = ?"
																		  + " and a.user_no = ?";
	private static final String GET_CARTITEMS_BY_USERNO_SQL = "select * from shop_book_cart_items where user_no = ?";
	private static final String GET_CARTITEM_DTOS_BY_USERNO_SQL = "select a.cart_item_no, a.cart_item_amount, a.cart_item_created_date, b.*, c.*"
																+ " from shop_book_cart_items a, shop_books b, shop_users c"
																+ " where a.book_no = b.book_no"
																+ " and a.user_no = c.user_no"
																+ " and a.user_no = ?"
																+ "	order by a.cart_item_no desc";
	private static final String INSERT_CARTITEM_SQL = "insert into shop_book_cart_items(cart_item_no, book_no, user_no, cart_item_amount)"
													+ " values (shop_cart_item_no_seq.nextval, ?, ?, ?)";
	
	private static final String UPDATE_CARTITEM_SQL = "update shop_book_cart_items set cart_item_amount = ? where cart_item_no = ?";
	private static final String DELETE_CARTITEM_SQL = "delete from shop_book_cart_items where cart_item_no = ?";
	
	private static CartDao cartDao = new CartDao();
	private CartDao() {}
	public static CartDao getInstance() {
		return cartDao;
	}
	
	public CartItem getCartItemByNo(int cartNo) throws SQLException {
		CartItem cartItem = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CARTITEM_BY_NO_SQL);
		pstmt.setInt(1, cartNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			cartItem = new CartItem();
			cartItem.setNo(rs.getInt("cart_item_no"));
			cartItem.setBookNo(rs.getInt("book_no"));
			cartItem.setUserNo(rs.getInt("user_no"));
			cartItem.setAmount(rs.getInt("cart_item_amount"));
			cartItem.setCreatedDate(rs.getDate("cart_item_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return cartItem;
	}
	
	public CartItemDto getCartItemDtoByNo(int cartNo) throws SQLException {
		CartItemDto cartItemDto = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CARTITEM_DTO_BY_NO_SQL);
		pstmt.setInt(1, cartNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			cartItemDto = new CartItemDto();
			cartItemDto.setNo(rs.getInt("cart_item_no"));
			cartItemDto.setAmount(rs.getInt("cart_item_amount"));
			cartItemDto.setCreatedDate(rs.getDate("cart_item_created_date"));
			
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
			book.setStatus(rs.getString("book_status"));
			book.setReviewCount(rs.getInt("book_review_count"));
			book.setReviewPoint(rs.getDouble("book_review_point"));
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setStock(rs.getInt("book_stock"));
			book.setCreatedDate(rs.getDate("book_created_date"));
			cartItemDto.setBook(book);
			
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			cartItemDto.setUser(user);
			
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return cartItemDto;
	}


	public CartItem getCartItemByBookNoAndUserNo(int bookNo, int userNo) throws SQLException {
		CartItem cartItem = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CARTITEM_BY_BOOKNO_AND_USERNO_SQL);
		pstmt.setInt(1, bookNo);
		pstmt.setInt(2, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			cartItem = new CartItem();
			cartItem.setNo(rs.getInt("cart_item_no"));
			cartItem.setBookNo(rs.getInt("book_no"));
			cartItem.setUserNo(rs.getInt("user_no"));
			cartItem.setAmount(rs.getInt("cart_item_amount"));
			cartItem.setCreatedDate(rs.getDate("cart_item_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return cartItem;
	}
	
	public CartItemDto getCartItemDtoByBookNoAndUserNo(int bookNo, int userNo) throws SQLException {
		CartItemDto cartItemDto = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CARTITEM_DTO_BY_BOOKNO_AND_USERNO_SQL);
		pstmt.setInt(1, bookNo);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			cartItemDto = new CartItemDto();
			cartItemDto.setNo(rs.getInt("cart_item_no"));
			cartItemDto.setAmount(rs.getInt("cart_item_amount"));
			cartItemDto.setCreatedDate(rs.getDate("cart_item_created_date"));
			
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
			book.setStatus(rs.getString("book_status"));
			book.setReviewCount(rs.getInt("book_review_count"));
			book.setReviewPoint(rs.getDouble("book_review_point"));
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setStock(rs.getInt("book_stock"));
			book.setCreatedDate(rs.getDate("book_created_date"));
			cartItemDto.setBook(book);
			
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			cartItemDto.setUser(user);
			
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return cartItemDto;
	}
	
	public List<CartItem> getCartItemsByUserNo(int userNo)	throws SQLException {
		List<CartItem> cartItems = new ArrayList<CartItem>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CARTITEMS_BY_USERNO_SQL);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			CartItem cartItem = new CartItem();
			cartItem.setNo(rs.getInt("cart_item_no"));
			cartItem.setBookNo(rs.getInt("book_no"));
			cartItem.setUserNo(rs.getInt("user_no"));
			cartItem.setAmount(rs.getInt("cart_item_amount"));
			cartItem.setCreatedDate(rs.getDate("cart_item_created_date"));
			
			cartItems.add(cartItem);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return cartItems;
	}
	
	public List<CartItemDto> getCartItemDtosByUserNo(int userNo) throws SQLException {
		List<CartItemDto> cartItemDtos = new ArrayList<CartItemDto>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CARTITEM_DTOS_BY_USERNO_SQL);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			CartItemDto cartItemDto = new CartItemDto();
			cartItemDto.setNo(rs.getInt("cart_item_no"));
			cartItemDto.setAmount(rs.getInt("cart_item_amount"));
			cartItemDto.setCreatedDate(rs.getDate("cart_item_created_date"));
			
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
			book.setStatus(rs.getString("book_status"));
			book.setReviewCount(rs.getInt("book_review_count"));
			book.setReviewPoint(rs.getDouble("book_review_point"));
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setStock(rs.getInt("book_stock"));
			book.setCreatedDate(rs.getDate("book_created_date"));
			cartItemDto.setBook(book);
			
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			cartItemDto.setUser(user);
			
			cartItemDtos.add(cartItemDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return cartItemDtos;
	}
	
	public void insertCartItem(CartItem cartItem) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_CARTITEM_SQL);
		pstmt.setInt(1, cartItem.getBookNo());
		pstmt.setInt(2, cartItem.getUserNo());
		pstmt.setInt(3, cartItem.getAmount());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void updateCartItem(CartItem cartItem) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UPDATE_CARTITEM_SQL);
		pstmt.setInt(1, cartItem.getAmount());
		pstmt.setInt(2, cartItem.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void deleteCartItem(int cartItemNo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(DELETE_CARTITEM_SQL);
		pstmt.setInt(1, cartItemNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
