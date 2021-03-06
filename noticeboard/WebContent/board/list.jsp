<%@page import="dao.BoardDao"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="util.StringUtils"%>
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
	final int rows = 5;
	int pageNo = StringUtils.stringToInt(request.getParameter("pno"), 1);
	int begin = (pageNo - 1) * rows;
	int end = pageNo * rows;
	
	BoardDao boardDao = BoardDao.getInstance();
	
	List<Board> boards = boardDao.getBoardsByRange(begin, end);
	
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
						<th><a href="list.jsp?pno=<%=pageNo %>">BOARD</a></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h3>게시판</h3>
			<a href="form.jsp" class="btn bg-primary">새 글쓰기</a>
		</div>
		<div class="col-12">
			<div class="table">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th style="width: 50px; text-align: center;">순번</th>
							<th style="width: 600px; text-align: center;">제목</th>
							<th style="width: 100px; text-align: center;">날짜</th>
							<th style="width: 100px; text-align: center;">작성자</th>
						</tr>
					</thead>
					<tbody>
						<%
							int  totalRecords = boardDao.getTotalRecords();
							int totalPages = (int)(Math.ceil((double)totalRecords/rows));
							for (Board board : boards) {
						%>
							<tr>
								<td style="width: 50px; text-align: center;"><%=board.getNo() %></td>
								<td style="width: 600px;"><a href="detail.jsp?no=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
								<td style="width: 100px; text-align: center;"><%=board.getCreateDate() %></td>
								<td style="width: 100px; text-align: center;"><%=board.getUserId() %></td>
							
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-12">
			<ul class="pagination">
				<li class="page-item <%=pageNo == 1 ? "disabled" : "" %>" > 
					<a class="page-link" href="list.jsp?pno=<%=pageNo - 1 %>" >이전</a>
				</li> 
				
				<%
					for (int i=1; i<=totalPages; i++) {
				%>
				
					<li>
						<a class="page-link" href="list.jsp?pno=<%= i %>"><%= i %></a>
					</li>
				<%
					}
				%>
				
				<li class="page-item <%=pageNo == totalPages ? "disabled" : "" %>">
					<a class="page-link" href="list.jsp?pno=<%=pageNo + 1 %>">다음</a>
				</li>
			</ul>
		</div>
		<div class="col-12">
			<form action="search.jsp">
				<select name="searchType">
					<option value="제목">제목</option>
					<option value="작성자">작성자</option>
				</select>
				<input type="text" name="keyword" />
				<input type="submit" value="검색" />
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-12">푸터영역</div>
	</div>
</div>
</body>
</html>