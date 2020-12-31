<%@page import="kr.co.shop.vo.CartItem"%>
<%@page import="kr.co.shop.dao.CartDao"%>
<%@page import="kr.co.shop.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 장바구니에 새로운 아이템을 추가한다.

	int bookNo = StringUtils.stringToInt(request.getParameter("bookno"));
	int amount = StringUtils.stringToInt(request.getParameter("amount"), 1);
	Integer userNo = (Integer) session.getAttribute("LOGINED_USER_NO");
	
	CartDao cartDao = CartDao.getInstance();
	CartItem cartItem = cartDao.getCartItemByBookNoAndUserNo(bookNo, userNo);
	
	if (cartItem == null) {
		cartItem = new CartItem();
		cartItem.setBookNo(bookNo);
		cartItem.setUserNo(userNo);
		cartItem.setAmount(amount);
		cartDao.insertCartItem(cartItem);
	} else {		
		cartItem.setAmount(cartItem.getAmount() + amount);
		cartDao.updateCartItem(cartItem);
	}
	
	response.sendRedirect("list.jsp");
%>