package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.shop.dto.OrderItemDto;
import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.Book;
import kr.co.shop.vo.Order;
import kr.co.shop.vo.OrderItem;

public class OrderDao {

	private static final String GET_ORDER_NO_SQL = "select shop_book_orders_no_seq.nextval as orderno from dual";
	private static final String GET_ORDER_BY_NO_SQL = "select * from shop_book_orders where order_no = ?";
	private static final String GET_ORDERS_BY_USER_NO_SQL = "select * from shop_book_orders where user_no = ?";
	private static final String GET_ORDER_ITEMS_BY_ORDERNO_SQL = "select * from shop_book_order_items where order_no = ?";
	private static final String GET_ORDER_ITEM_DTOS_BY_ORDERNO_SQL = "select a.*, b.*"
																   + " from shop_book_order_items a, shop_books b"
																   + " where a.book_no = b.book_no"
																   + " and a.order_no = ?";
	private static final String INSERT_ORDER_SQL = "insert into shop_book_orders(order_no, user_no, order_amount, order_recipient_name, order_recipient_tel, order_recipient_zipcode, order_recipient_address, order_message, total_order_price, used_point_amount, total_payment_price, bank_no, bank_card_account)"
												 + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String INSERT_ORDER_ITEM_SQL = "insert into shop_book_order_items(order_item_no, order_no, book_no, item_price, order_item_amount)"
													  + " values(shop_book_order_items_no_seq.nextval, ?, ?, ?, ?)";
	private static final String UPDATE_ORDER_SQL = "update shop_book_orders set order_recipient_name = ?, order_recipient_tel = ?, order_recipient_zipcode = ?, order_recipient_address = ?, order_message = ?, order_status = ? "
												 + " where order_no = ?";
	
	private static final OrderDao orderDao = new OrderDao();
	private OrderDao() {}
	public static OrderDao getInstance() {
		return orderDao;
	}
	
	public int getOrderNo() throws SQLException {
		int orderNo = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ORDER_NO_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		orderNo = rs.getInt("orderno");
		
		rs.close();
		pstmt.close();
		con.close();
		return orderNo;
	}
	
	public Order getOrderByNo(int orderNo) throws SQLException {
		Order order = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ORDER_BY_NO_SQL);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			order = new Order();
			order.setNo(rs.getInt("order_no"));
			order.setUserNo(rs.getInt("user_no"));
			order.setAmount(rs.getInt("order_amount"));
			order.setStatus(rs.getString("order_status"));
			order.setRecName(rs.getString("order_recipient_name"));
			order.setRecTel(rs.getString("order_recipient_tel"));
			order.setRecZipCode(rs.getString("order_recipient_zipcode"));
			order.setRecAddress(rs.getString("order_recipient_address"));
			order.setMessage(rs.getString("order_message"));
			order.setTotalOrderPrice(rs.getInt("total_order_price"));
			order.setUsedPoint(rs.getInt("used_point_amount"));
			order.setTotalPaymentPrice(rs.getInt("total_payment_price"));
			order.setBankNo(rs.getInt("bank_no"));
			order.setBankCardAccount(rs.getString("bank_card_account"));
			order.setCreatedDate(rs.getDate("order_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return order;
	}
	
	public List<Order> getOrdersByUserNo(int userNo) throws SQLException {
		List<Order> orders = new ArrayList<Order>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ORDERS_BY_USER_NO_SQL);
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Order order = new Order();
			order.setNo(rs.getInt("order_no"));
			order.setUserNo(rs.getInt("user_no"));
			order.setAmount(rs.getInt("order_amount"));
			order.setStatus(rs.getString("order_status"));
			order.setRecName(rs.getString("order_recipient_name"));
			order.setRecTel(rs.getString("order_recipient_tel"));
			order.setRecZipCode(rs.getString("order_recipient_zipcode"));
			order.setRecAddress(rs.getString("order_recipient_address"));
			order.setMessage(rs.getString("order_message"));
			order.setTotalOrderPrice(rs.getInt("total_order_price"));
			order.setUsedPoint(rs.getInt("used_point_amount"));
			order.setTotalPaymentPrice(rs.getInt("total_payment_price"));
			order.setBankNo(rs.getInt("bank_no"));
			order.setBankCardAccount(rs.getString("bank_card_account"));
			order.setCreatedDate(rs.getDate("order_created_date"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return orders;
	}
	
	public List<OrderItem> getOrderItemsByOrderNo(int orderNo) throws SQLException {
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ORDER_ITEMS_BY_ORDERNO_SQL);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setNo(rs.getInt("order_item_no"));
			orderItem.setOrderNo(rs.getInt("order_no"));
			orderItem.setBookNo(rs.getInt("book_no"));
			orderItem.setPrice(rs.getInt("item_price"));
			orderItem.setAmount(rs.getInt("order_item_amount"));
			orderItems.add(orderItem);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return orderItems;
	}
	
	public List<OrderItemDto> getOrderItemDtosByOrderNo(int orderNo) throws SQLException {
		List<OrderItemDto> orderItemDtos = new ArrayList<OrderItemDto>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ORDER_ITEM_DTOS_BY_ORDERNO_SQL);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			OrderItemDto orderItemDto = new OrderItemDto();
			orderItemDto.setNo(rs.getInt("order_item_no"));
			orderItemDto.setOrderNo(rs.getInt("order_no"));
			orderItemDto.setPrice(rs.getInt("item_price"));
			orderItemDto.setAmount(rs.getInt("order_item_amount"));
			
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
			book.setBest(rs.getString("book_best"));
			book.setFileName(rs.getString("book_filename"));
			book.setCreatedDate(rs.getDate("book_created_date"));
			orderItemDto.setBook(book);
			
			orderItemDtos.add(orderItemDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return orderItemDtos;
	}
	
	public void insertOrder(Order order) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_ORDER_SQL);
		System.out.println("인서트 오더 : " + order.getNo());
		pstmt.setInt(1, order.getNo());
		pstmt.setInt(2, order.getUserNo());
		pstmt.setInt(3, order.getAmount());
		pstmt.setString(4, order.getRecName());
		pstmt.setString(5, order.getRecTel());
		pstmt.setString(6, order.getRecZipCode());
		pstmt.setString(7, order.getRecAddress());
		pstmt.setString(8, order.getMessage());
		pstmt.setInt(9, order.getTotalOrderPrice());
		pstmt.setInt(10, order.getUsedPoint());
		pstmt.setInt(11, order.getTotalPaymentPrice());
		pstmt.setInt(12, order.getBankNo());
		pstmt.setString(13, order.getBankCardAccount());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void insertOrderItem(OrderItem orderItem) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_ORDER_ITEM_SQL);
		System.out.println("인서트아이템 : " + orderItem.getOrderNo());
		pstmt.setInt(1, orderItem.getOrderNo());
		pstmt.setInt(2, orderItem.getBookNo());
		pstmt.setInt(3, orderItem.getPrice());
		pstmt.setInt(4, orderItem.getAmount());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void updateOrder(Order order) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UPDATE_ORDER_SQL);
		pstmt.setString(1, order.getRecName());
		pstmt.setString(2, order.getRecTel());
		pstmt.setString(3, order.getRecZipCode());
		pstmt.setString(4, order.getRecAddress());
		pstmt.setString(5, order.getMessage());
		pstmt.setString(6, order.getStatus());
		pstmt.setInt(7, order.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
