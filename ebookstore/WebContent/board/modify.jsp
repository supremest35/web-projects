<%@page import="kr.co.ebookstore.vo.Board"%>
<%@page import="kr.co.ebookstore.dao.BoardDao"%>
<%@page import="kr.co.ebookstore.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/loginCheck.jsp" %>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	int pageNo = StringUtils.stringToInt(request.getParameter("pno"), 1);
	int boardNo = StringUtils.stringToInt(request.getParameter("bno"));
	int categoryNo = StringUtils.stringToInt(request.getParameter("category"), 110);
	String loginedUserId = (String) session.getAttribute("LOGINED_USER_ID");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardByNo(boardNo);
	
	if (!loginedUserId.equals(board.getWriterId())) {
		response.sendRedirect("detail.jsp?pno=" + pageNo + "&bno=" + boardNo + "&error=modify");
		return;
	}
	
	board.setCategoryNo(categoryNo);
	board.setTitle(title);
	board.setContent(content);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?pno=" + pageNo + "&bno=" + boardNo);
%>