<%@page import="kr.co.shop.dao.CategoryDao"%>
<%@page import="kr.co.shop.vo.Category"%>
<%@page import="kr.co.shop.dto.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.shop.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.dao.BookDao"%>
<%@page import="kr.co.shop.util.StringUtils"%>
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
		int rows = 8;
		int categoryType = StringUtils.stringToInt(request.getParameter("catType"), 100);
		int pageNo = StringUtils.stringToInt(request.getParameter("pno"), 1);

		int begin = (pageNo - 1) * rows + 1;
		int end = pageNo * rows;
		
		CategoryDao categoryDao = CategoryDao.getInstance();
		Category category = categoryDao.getCategoryByNo(categoryType);
		
		BookDao bookDao = BookDao.getInstance();
		List<BookDto> bookDtos = bookDao.getBooksByRangeAndCategoryType(begin, end, categoryType);
	%>
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold"> <%=category.getName() %> 리스트</div>
				<div class="card-body">
					<!-- 상품리스트 시작 -->
					<div class="row">
						<!-- 상품 정보 하나 시작 -->
						<%
							for (BookDto bookDto : bookDtos) {
						%>
						<div class="col-3 mb-3">
							<div class="card">
	 							<div class="card-body">
		  							<a href="detail.jsp?pno=<%=pageNo %>&bookno=<%=bookDto.getNo() %>"><img class="img-thumbnail" src="/shop/resources/images/<%=bookDto.getFileName() %>.jpg" alt="Card image"></a>
	   								<strong><%=bookDto.getTitle() %></strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary"><%=bookDto.getWriter() %></small>
	   									<small class="text-secondary"><%=bookDto.getPublisher() %></small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger"><%=bookDto.getDiscountPrice() %></strong> 원 (<%=(int)(bookDto.getDiscountRate() * 100) %>% 할인)</small> 
	   									<small><%=bookDto.getPoint() %>원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<span class="badge badge-primary">무료배송</span>
	   									<span class="badge badge-success">새 상품</span>
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<%
							}
						%>
						<!-- 상품정보 하나 끝 -->
					</div>
					<!-- 상품리스트 끝  -->
					<%
						int totalRecords = bookDao.getTotalRecordsByCategoryType(categoryType);
						int totalPages = (int) Math.ceil((double) totalRecords/rows);
					%>
					<!-- 페이징처리 시작 -->
					<div class="row">
						<div class="col-12">
							<ul class="pagination justify-content-center">
						  		<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>"><a class="page-link" href="list.jsp?pno=<%=pageNo - 1 %>">이전</a></li>
						  	    <%
						  	    	for (int num=1; num<=totalPages; num++) {
						  	    %>
						  	    <li class="page-item <%=pageNo == num ? "active" : "" %>"><a class="page-link" href="list.jsp?pno=<%=num %>"><%=num %></a></li>
						  	    <%
						  	    	}
						  	    %>
						  		<li class="page-item <%=pageNo >= totalPages ? "disabled" : "" %>"><a class="page-link" href="list.jsp?pno=<%=pageNo + 1 %>">다음</a></li>
							</ul>
						</div>
					</div>
					<!-- 페이징처리 끝 -->
				</div>	
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>