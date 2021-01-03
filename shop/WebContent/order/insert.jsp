<%@page import="kr.co.shop.dao.BookDao"%>
<%@page import="kr.co.shop.vo.Book"%>
<%@page import="kr.co.shop.vo.UserPointHistory"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.dto.CartItemDto"%>
<%@page import="kr.co.shop.vo.Order"%>
<%@page import="kr.co.shop.vo.OrderItem"%>
<%@page import="kr.co.shop.dao.OrderDao"%>
<%@page import="kr.co.shop.dao.CartDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.shop.vo.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//////////// 여기 할차례
	// 주문정보 저장
	String[] cartItemNo = request.getParameterValues("cartno");
	
 	// 바로구매했을 경우 책 번호와 가격, 구매수량에 사용할 것임(물론 장바구니에서 구매했을때는 form.jsp에서
	// 넘겨준  cartItemDtos 리스트의 첫번째 객체의 bookno와 책가격, amount 가 들어있음)
	int bookNo = StringUtils.stringToInt(request.getParameter("bookno"), 0);
	int amount = StringUtils.stringToInt(request.getParameter("amount"));
	
	String recName = request.getParameter("name");
	String recTel = request.getParameter("tel");
	String recZipCode = request.getParameter("zipcode");
	String recAddress = request.getParameter("address");
	String message = request.getParameter("memo");
	int totalOrderPrice = StringUtils.stringToInt(request.getParameter("totalPrice"));
	int totalOrderPoint = StringUtils.stringToInt(request.getParameter("totalPoint"));
	int usedPoint = StringUtils.stringToInt(request.getParameter("usedPoint"));
	int totalPaymentPrice = StringUtils.stringToInt(request.getParameter("orderPrice"));
	int bankNo = StringUtils.stringToInt(request.getParameter("bank"));
	String bankCardAccount = request.getParameter("account");
	Integer loginedUserNo = (Integer) session.getAttribute("LOGINED_USER_NO");
	
	// 주문테이블에 주문정보 저장
	OrderDao orderDao = OrderDao.getInstance();
	int orderNo = orderDao.getOrderNo();
	Order order = new Order();
	order.setNo(orderNo);
	order.setUserNo(loginedUserNo);
	order.setAmount(cartItemNo.length);
	order.setRecName(recName);
	order.setRecTel(recTel);
	order.setRecZipCode(recZipCode);
	order.setRecAddress(recAddress);
	order.setMessage(message);
	order.setTotalOrderPrice(totalOrderPrice);
	order.setUsedPoint(usedPoint);
	order.setTotalPaymentPrice(totalPaymentPrice);
	order.setBankNo(bankNo);
	order.setBankCardAccount(bankCardAccount);
	orderDao.insertOrder(order);
	
	// 바로구매했을 경우 bookNo에 0이 아닌 값이 들어감
	if (bookNo != 0) {
		// 주문아이템 테이블에 저장
		BookDao bookDao = BookDao.getInstance();
		Book book = bookDao.getBookByNo(bookNo);
		
		OrderItem orderItem = new OrderItem();
		orderItem.setOrderNo(orderNo);
		orderItem.setBookNo(bookNo);
		orderItem.setPrice(book.getDiscountPrice());
		orderItem.setAmount(amount);
		orderDao.insertOrderItem(orderItem);
		// 구매한 수량만큼 책 재고 변경
		book.setStock(book.getStock() - amount);
		bookDao.updateBook(book);
	} else {
		for (String num : cartItemNo) {
			int cartNo = Integer.parseInt(num);
			CartDao cartDao = CartDao.getInstance();
			CartItemDto cartItemDto = cartDao.getCartItemDtoByNo(cartNo);
			// 주문아이템 테이블에 저장
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderNo(orderNo);
			orderItem.setBookNo(cartItemDto.getBook().getNo());
			orderItem.setPrice(cartItemDto.getBook().getDiscountPrice());
			orderItem.setAmount(cartItemDto.getAmount());
			orderDao.insertOrderItem(orderItem);

			// 구매한 수량만큼 책 재고 변경
			BookDao bookDao = BookDao.getInstance();
			Book book = bookDao.getBookByNo(cartItemDto.getBook().getNo());
			book.setStock(book.getStock() - cartItemDto.getAmount());
			bookDao.updateBook(book);
			// 장바구니에서 삭제
			cartDao.deleteCartItem(cartItemDto.getNo());
		}
	}
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserByNo(loginedUserNo);
	// 사용한 포인트가 0이 아니라면 사용한 포인트 차감, 포인트 사용이력 저장
	UserPointHistory userPointHistory = new UserPointHistory();
	userPointHistory.setUserNo(loginedUserNo);
	if (usedPoint != 0) {
		user.setPoint(user.getPoint() - usedPoint);
		userDao.updateUser(user);

		userPointHistory.setContent("책 구매(포인트 사용)");
		userPointHistory.setAmount(usedPoint * -1);
		userDao.insertPointHistory(userPointHistory);
	}
	
	// 책 구매로 인한 포인트 증가, 포인트 사용이력 저장
	user.setPoint(user.getPoint() + totalOrderPoint);
	userDao.updateUser(user);
	
	userPointHistory.setContent("책 구매(포인트 적립)");
	userPointHistory.setOrderNo(orderNo);
	userPointHistory.setAmount(totalOrderPoint);
	userDao.insertPointHistory(userPointHistory);
	
	response.sendRedirect("complete.jsp?orderNo=" + orderNo);
%>