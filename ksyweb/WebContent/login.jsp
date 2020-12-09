<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.ksy.web.vo.User"%>
<%@page import="kr.co.ksy.web.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	// 요청파라미터값 조회하기
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 아이디 혹은 비밀번호가 입력되지 않으면 loginform.jsp?error=blank 재요청 URL
	if (id.isBlank() || password.isBlank()) {
		response.sendRedirect("loginform.jsp?error=blank");
		return;
	}
	
	// 입력한 아이디로 사용자 정보를 조회해서 존재하지 않으면 loginform.jsp?error=invalid 재요청 URL
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(id);
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=invalid");
		return;
	}
	
	// 입력한 비밀번호와 저장된 비밀번호가 같지 않다면 loginform.jsp?error=invalid 재요청 URL
	String savedPassword = user.getPassword();
	String secretPassword = DigestUtils.sha256Hex(password);
	if (!savedPassword.equals(secretPassword)) {
		response.sendRedirect("loginform.jsp?error=invalid");
		return;
	}
	
	// 세션 객체에 사용자 아이디, 이름 저장
	session.setAttribute("LOGINED_USER_ID", user.getId());
	session.setAttribute("LOGINED_USER_NAME", user.getName());
	
	// 로그인 완료되면 index.jsp 재요청 URL
	response.sendRedirect("index.jsp");
%>