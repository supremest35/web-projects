<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if (id.isBlank() || password.isBlank()) {
		response.sendRedirect("loginform.jsp?error=blank");
		return;
	}
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(id);
	
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=invalid");
		return;
	}
	
	String savedPassword = user.getPassword();
	String secretPassword = DigestUtils.sha256Hex(password);
	if (!secretPassword.equals(savedPassword)) {
		response.sendRedirect("loginform.jsp?error=invalid");
		return;
	}
	
	session.setAttribute("LOGINED_USER_NO", user.getNo());
	session.setAttribute("LOGINED_USER_ID", user.getId());
	session.setAttribute("LOGINED_USER_NAME", user.getName());
	
	response.sendRedirect("index.jsp");
%>