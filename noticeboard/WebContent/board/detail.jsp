<%@page import="vo.BoardImage"%>
<%@page import="java.util.List"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap 4 Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));

	BoardDao boardDao = BoardDao.getInstance();
	
	Board board = boardDao.getBoardByNo(boardNo);
	List<BoardImage> boardImages = boardDao.getBoardImagesByNo(boardNo);
%>

<div class="container">
	<div class="row">
		<div class="col-2"><a href="index.jsp">김선영</a></div>
		<div class="col-2"></div>
		<div class="col-8">
			<table class="table">
				<thead>
					<tr>
						<th><a href="">ABOUT</a></th>
						<th><a href="">PROJECT</a></th>
						<th><a href="">PUBLICATION</a></th>
						<th><a href="list.jsp?pno=1">BOARD</a></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-12">
					<h3><%=board.getTitle() %></h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<p><%=board.getDocumentWithBr() %></p>
				</div>
			</div>
			<div class="row">
				<%
					for (BoardImage boardImage : boardImages) {
				%>
					<div class="col-12">
						<img src="../resources/<%=boardImage.getFileName() %>" />
					</div>
				<%
					}
				%>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">푸터영역</div>
	</div>
</div>
</body>
</html>