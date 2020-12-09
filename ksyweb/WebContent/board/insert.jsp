<%@page import="kr.co.ksy.web.dao.BoardDao"%>
<%@page import="kr.co.ksy.web.util.StringUtils"%>
<%@page import="kr.co.ksy.web.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	board/insert.jsp는 로그인된 사용자만 요청할 수 있는 jsp페이지다.
 --%>
<%@ include file="../common/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int categoryNo = StringUtils.stringToInt(request.getParameter("category"), 110);
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String loginedUserId = (String) session.getAttribute("LOGINED_USER_ID");
	
	Board board = new Board();
	board.setCategoryNo(categoryNo);
	board.setTitle(title);
	board.setContent(content);
	board.setWriterId(loginedUserId);
	
	BoardDao boardDao = BoardDao.getInstance();
	boardDao.insertBoard(board);
	
	response.sendRedirect("/ksyweb/board/list.jsp?pno=1");
%>