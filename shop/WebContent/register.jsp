<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	if (!password.equals(password2)) {
		response.sendRedirect("form.jsp?error=pwd");
		return;
	}
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(id);
	
	if (user != null) {
		response.sendRedirect("form.jsp?error=dupId");
		return;
	}
	
	user = new User();
	user.setId(id);
	user.setName(name);
	user.setTel(tel);
	user.setEmail(email);
	
	String secretPassword = DigestUtils.sha256Hex(password);
	user.setPassword(secretPassword);
	
	userDao.insertUser(user);
	
	response.sendRedirect("completed.jsp");
%>