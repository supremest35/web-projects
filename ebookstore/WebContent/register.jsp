<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.ebookstore.vo.User"%>
<%@page import="kr.co.ebookstore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글인코딩
	request.setCharacterEncoding("utf-8");

	// 요청파라미터값 조회
	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String userPassword = request.getParameter("password");
	String userPassword2 = request.getParameter("password2");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(userId);
	if (user != null) {
		response.sendRedirect("form.jsp?error=dupId");
		return;
	}
	
	if (!userPassword.equals(userPassword2)) {
		response.sendRedirect("form.jsp?error=pwd");
		return;
	}
	
	// 신규 사용자 정보를 User객체에 저장
	user = new User();
	user.setId(userId);
	user.setName(userName);
	user.setTel(tel);
	user.setEmail(email);
	
	// 비밀번호 암호화
	String secretPassword = DigestUtils.sha256Hex(userPassword);
	user.setPassword(secretPassword);
	
	userDao.insertUser(user);
	
	response.sendRedirect("completed.jsp");
%>