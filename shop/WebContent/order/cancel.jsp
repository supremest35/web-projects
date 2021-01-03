<%@page import="kr.co.shop.dao.BookDao"%>
<%@page import="kr.co.shop.dto.OrderItemDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.vo.UserPointHistory"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@page import="kr.co.shop.vo.Order"%>
<%@page import="kr.co.shop.dao.OrderDao"%>
<%@page import="kr.co.shop.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 주문 취소
	int orderNo = StringUtils.stringToInt(request.getParameter("orderno"));
	Integer loginedUserNo = (Integer) session.getAttribute("LOGINED_USER_NO");	

	OrderDao orderDao = OrderDao.getInstance();
	Order order = orderDao.getOrderByNo(orderNo);
	order.setStatus("주문취소");
	orderDao.updateOrder(order);
	
	UserDao userDao = UserDao.getInstance();
	UserPointHistory userPointHistory = userDao.getPointHistoryByOrderNo(orderNo);
	User user = userDao.getUserByNo(loginedUserNo);
	
	// 사용자 보유 포인트에서 적립된 포인트, 사용된 포인트 취소
	user.setPoint(user.getPoint() - userPointHistory.getAmount() + order.getUsedPoint());
	userDao.updateUser(user);
	
	// 포인트 적립취소 이력 저장
	userPointHistory.setContent("포인트 적립취소(주문취소)");
	userPointHistory.setOrderNo(0);
	userPointHistory.setAmount(userPointHistory.getAmount() * -1);
	userDao.insertPointHistory(userPointHistory);
	
	// 포인트 사용취소 이력 저장
	userPointHistory.setContent("포인트 사용취소(주문취소)");
	userPointHistory.setAmount(order.getUsedPoint());
	userDao.insertPointHistory(userPointHistory);
	
	// 책 수량 변경
	List<OrderItemDto> orderItemDtos = orderDao.getOrderItemDtosByOrderNo(orderNo);
	BookDao bookDao = BookDao.getInstance();
	
	for (OrderItemDto orderItemDto : orderItemDtos) {
		orderItemDto.getBook().setStock(orderItemDto.getBook().getStock() + orderItemDto.getAmount());
		bookDao.updateBook(orderItemDto.getBook());
	}
	
	response.sendRedirect("list.jsp");
%>