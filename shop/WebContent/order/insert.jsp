<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//////////// 여기 할차례
	// 주문정보 저장
	String[] cartItemNo = request.getParameterValues("cartno");
	
	for (String str : cartItemNo) {
		System.out.println(str);
	}

	Integer loginedUserNo = (Integer) session.getAttribute("LOGINED_USER_NO");
	
	response.sendRedirect("complete.jsp?orderNo=주문번호");
%>