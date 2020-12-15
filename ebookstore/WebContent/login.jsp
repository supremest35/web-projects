<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.ebookstore.vo.User"%>
<%@page import="kr.co.ebookstore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청파라미터값 조회
	String userId = request.getParameter("id");
	String userPassword = request.getParameter("password");
	
	// 입력값이 존재하지 않거나 공백이면 재요청 URL을 응답으로 보낸다.
	if (userId.isBlank() || userPassword.isBlank()) {
		response.sendRedirect("loginform.jsp?error=blank");
		return;
	}
	
	// 조회된 사용자 정보가 null이라면 재요청 URL을 응답으로 보낸다.
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(userId);
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=invalid");
		return;
	}
	
	// 조회된 사용자 비밀번호와 요청파라미터값으로 조회한 비밀번호(암호화 된)가 일치하지 않으면
	// 재요청 URL을 응답으로 보낸다.
	String savedPassword = user.getPassword();
	String secretPassword = DigestUtils.sha256Hex(userPassword);
	if (!secretPassword.equals(savedPassword)) {
		response.sendRedirect("loginform.jsp?error=invalid");
		return;
	}
	
	// 세션객체에 사용자 정보를 저장한다.
	session.setAttribute("LOGINED_USER_ID", user.getId());
	session.setAttribute("LOGINED_USER_NAME", user.getName());
	
	// 시작페이즈를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("index.jsp");
%>