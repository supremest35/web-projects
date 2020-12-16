<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션객체 무효화
	session.invalidate();
	// 시작페이지를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("index.jsp");
%>