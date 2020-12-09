<%@page import="kr.co.ksy.web.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ksy.web.dao.BoardDao"%>
<%@page import="kr.co.ksy.web.util.StringUtils"%>
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
<div class="container">
	<div class="row">
		<div class="col-12">
			<%@ include file="../common/navbar.jsp" %>
		</div>
	</div>
	<%
		// 한 화면당 보여줄 게시글 갯수
		int rows = 5;
		
		// 사용자가 요청한 페이지 번호 조회
		int pageNo = (int) StringUtils.stringToInt(request.getParameter("pno"), 1);
		
		// 조회범위 계산하기
		int begin = (pageNo - 1) * rows + 1;
		int end = pageNo * rows;
		
		// 조회범위에 해당하는 게시글 조회하기
		BoardDao boardDao = BoardDao.getInstance();
		List<BoardDto> boardDtos = boardDao.getBoardDtosByRange(begin, end);
	%>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h4>게시글 리스트 
					<%
						if (loginedUserId != null) {
					%>
						<a href="form.jsp" class="btn btn-primary float-right">새 글</a>
					<%
						}
					%>
					</h4>
				</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="*">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>종류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>추천수</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
						<%
							for (BoardDto boardDto : boardDtos) {
						%>
							<tr>
								<td><%=boardDto.getNo() %></td>
								<td><%=boardDto.getCategory().getName() %></td>
								<td><a href="/ksyweb/detail.jsp?bno=<%=boardDto.getNo() %>"><%=StringUtils.getStringForLength(boardDto.getTitle(), 28) %></a></td>
								<td><%=boardDto.getUser().getName() %></td>
								<td><%=boardDto.getLikes() %></td>
								<td><%=boardDto.getCreatedDate() %></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
				</div>
				<%
					
				%>
				<div class="card-footer">
					<ul class="pagination justify-content-center">
						<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>"><a href="list.jsp?pno=<%=pageNo - 1 %>" class="page-link">&laquo;</a></li>
						<%
							int totalRecords = boardDao.getTotalRecords();
							int totalPages = (int) (Math.ceil((double) totalRecords/rows));
						%>
						<%
							for (int num = 1; num <= totalPages; num++) {
						%>
							<li class="page-item <%=pageNo == num ? "actived" : "" %>">
								<a href="list.jsp?pno=<%=num %>" class="page-link"><%=num %></a>
							</li>
						<%
							}
						%>
						<li class="page-item <%=pageNo >= totalPages ? "disabled" : "" %>"><a href="list.jsp?pno=<%=pageNo + 1 %>" class="page-link">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>