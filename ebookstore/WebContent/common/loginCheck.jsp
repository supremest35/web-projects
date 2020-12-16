<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("LOGINED_USER_ID") == null) {
		response.sendRedirect("/ebookstore/loginform.jsp?error=required");
		return;
	}
%>