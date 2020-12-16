<%@page import="kr.co.ebookstore.dao.BoardDao"%>
<%@page import="kr.co.ebookstore.vo.Board"%>
<%@page import="kr.co.ebookstore.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/loginCheck.jsp" %>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	// 요청파라미터값 조회
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
	
	response.sendRedirect("list.jsp");
%>