<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 비밀번호 변경처리 처리
	String prevPassword = request.getParameter("prevPassword");
	String newPassword = request.getParameter("password");
	String confirmPassword = request.getParameter("confirmPassword");
	Integer loginedUserNo = (Integer) session.getAttribute("LOGINED_USER_NO");
	
	// 입력칸이 비어있거나 공백이면 에러
	if (prevPassword.isBlank() || newPassword.isBlank() || confirmPassword.isBlank()) {
		response.sendRedirect("info.jsp?error=blank");
		return;
	}
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserByNo(loginedUserNo);
	String savedPassword = user.getPassword();
	
	String secretPrevPassword = DigestUtils.sha256Hex(prevPassword);
	
	// 입력한 이전 비밀번호가 저장된 비밀번호와 일치하지 않으면 에러
	if (!secretPrevPassword.equals(savedPassword)) {
		response.sendRedirect("info.jsp?error=invalid");
		return;
	}
	
	// 새 비밀번호와 새 비밀번호 확인이 일치하지 않으면 에러
	if (!newPassword.equals(confirmPassword)) {
		response.sendRedirect("info.jsp?error=pwd");
		return;
	}
	
	// 새 비밀번호와 저장된 비밀번호가 일치하면 에러
	String secretNewPassword = DigestUtils.sha256Hex(newPassword);
	if (secretNewPassword.equals(savedPassword)) {
		response.sendRedirect("info.jsp?error=dupPwd");
		return;
	}
	
	user.setPassword(secretNewPassword);
	userDao.updateUser(user);
	
	// 비빔번경 완료 처리 후 complete.jsp를 재요청하는 응답을 보낸다.
	response.sendRedirect("complete.jsp");
%>