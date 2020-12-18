<%@page import="kr.co.ebookstore.vo.Board"%>
<%@page import="kr.co.ebookstore.dto.BoardDto"%>
<%@page import="kr.co.ebookstore.dao.BoardDao"%>
<%@page import="kr.co.ebookstore.util.StringUtils"%>
<%@page import="kr.co.ebookstore.vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.ebookstore.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/loginCheck.jsp" %>
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
		int pageNo = StringUtils.stringToInt(request.getParameter("pno"), 1);
		int boardNo = StringUtils.stringToInt(request.getParameter("bno"));
		
		BoardDao boardDao = BoardDao.getInstance();
		Board board = boardDao.getBoardByNo(boardNo);
		
		CategoryDao categoryDao = CategoryDao.getInstance();
		List<Category> categories = categoryDao.getAllCategories();

	%>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<form method="post" action="modify.jsp">
				<input type="hidden" name="pno" value="<%=pageNo %>" />
				<input type="hidden" name="bno" value="<%=boardNo %>" />
					<div class="card-header"><h4>게시글 입력폼</h4></div>
					<div class="card-body">
						<div class="form-group row">
							<label class="col-2 col-form-label">카테고리</label>
							<div class="col-10">
								<select class="form-control" name="category">
									<%
										for (Category category : categories) {
									%>
										<option value="<%=category.getNo() %>" <%=category.getNo() == board.getCategoryNo() ? "selected" : "" %>> <%=category.getName() %></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-2 col-form-label">제목</label>
							<div class="col-10">
								<input type="text" class="form-control" name="title" value="<%=board.getTitle() %>" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-2 col-form-label">내용</label>
							<div class="col-10">
								<textarea rows="10" class="form-control" name="content"><%=board.getContent() %></textarea>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="text-right">
							<a href="detail.jsp?pno=<%=pageNo %>&bno=<%=boardNo %>" class="btn btn-secondary">취소</a>
							<input type="submit" class="btn btn-primary" value="수정">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>