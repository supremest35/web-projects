<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.ksy.web.vo.User"%>
<%@page import="kr.co.ksy.web.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	// 요청파라미터 값 조회
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	// password와 password2가 다르면 error=pwd인 재요청 URL
	if (!password.equals(password2)) {
		response.sendRedirect("form.jsp?error=pwd");
		return;
	}
	
	// 데이터베이스에 입력한 아이디의 회원이 존재하면 error=dupId인 재요청 URL
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(id);
	if (user != null) {
		response.sendRedirect("form.jsp?error=dupId");
		return;
	}
	
	// User객체에 회원정보 저장
	user = new User();
	user.setId(id);
	user.setName(name);
	user.setTel(tel);
	user.setEmail(email);
	
	// 비밀번호 암호화
	String secretPassword = DigestUtils.sha256Hex(password);
	user.setPassword(secretPassword);
	
	// UserDao객체의 insertUser메소드를 호출해서 신규 사용자 정보를 데이터베이스에 저장
	userDao.insertUser(user);
	
	// 재요청 URL
	response.sendRedirect("completed.jsp");
%>