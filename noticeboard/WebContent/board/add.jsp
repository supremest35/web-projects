<%@page import="vo.BoardImage"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String savedDirectory = "C:\\projects\\my projects\\web-projects\\noticeboard\\WebContent\\resources";

	int maxPostSize = 1024 * 1024 * 10;
	
	String encoding = "utf-8";
	
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = new MultipartRequest(request, savedDirectory, maxPostSize, encoding, policy);
	
	String userId = mr.getParameter("userId");
	String title = mr.getParameter("title");
	String document = mr.getParameter("document");
	
	String savedFilename1 = mr.getFilesystemName("photofile1");
	String savedFilename2 = mr.getFilesystemName("photofile2");
	String savedFilename3 = mr.getFilesystemName("photofile3");
	
	BoardDao boardDao = BoardDao.getInstance();
	
	int boardNo = boardDao.getBoardNo();
	
	Board board = new Board();
	board.setNo(boardNo);
	board.setTitle(title);
	board.setDocument(document);
	board.setUserId(userId);
	boardDao.insertBoard(board);
	
	BoardImage boardImage = new BoardImage();
	boardImage.setNo(boardNo);
	
	if (savedFilename1 != null) {
		boardImage.setIndex(1);
		boardImage.setFileName(savedFilename1);
		boardDao.insertBoardImage(boardImage);
	}
	if (savedFilename2 != null) {
		boardImage.setIndex(2);
		boardImage.setFileName(savedFilename2);
		boardDao.insertBoardImage(boardImage);
	}
	if (savedFilename3 != null) {
		boardImage.setIndex(3);
		boardImage.setFileName(savedFilename3);
		boardDao.insertBoardImage(boardImage);
	}

	response.sendRedirect("list.jsp?pno=1");
	
%>