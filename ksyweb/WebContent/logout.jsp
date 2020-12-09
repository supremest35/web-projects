<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃은 세션객체를 무효화하는 것이다.
	// 무효화 처리된 세션객체는 더이상 사용할 수 없고, 세션객체에 저장해둔 사용자정보도 사용할 수 없다.
	session.invalidate();
	// 시작페이지를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("index.jsp");
%>