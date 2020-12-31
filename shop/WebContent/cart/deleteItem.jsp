<%@page import="kr.co.shop.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 장바구니에서 아이템을 삭제한다.
	
	String[] cartItems = request.getParameterValues("cartno");
	
	CartDao cartDao = CartDao.getInstance();
	
	for (String cartItem : cartItems) {
		cartDao.deleteCartItem(Integer.parseInt(cartItem));
	}
	
	response.sendRedirect("list.jsp");
%>