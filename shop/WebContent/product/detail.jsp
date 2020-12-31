<%@page import="kr.co.shop.dao.UserDao"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.vo.ReviewLikeUser"%>
<%@page import="kr.co.shop.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.dao.ReviewDao"%>
<%@page import="kr.co.shop.util.StringUtils"%>
<%@page import="kr.co.shop.dto.BookDto"%>
<%@page import="kr.co.shop.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap 4 Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style type="text/css">
		.btn-group-xs > .btn, .btn-xs {
		  padding: .25rem .4rem;
		  font-size: .875rem;
		  line-height: .5;
		  border-radius: .2rem;
		}
	</style>
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
		int bookNo = StringUtils.stringToInt(request.getParameter("bookno"));

		BookDao bookDao = BookDao.getInstance();
		BookDto bookDto = bookDao.getBookDtoByNo(bookNo);
		
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserById(loginedUserId);
	%>
	<div class="row mb-3">
		<div class="col-12 mb-3">
			<div class="card">
		  		<div class="row no-gutters">
		    		<div class="col-md-3">
		      			<img src="/shop/resources/images/<%=bookDto.getFileName() %>.jpg" class="card-img" alt="...">
		    		</div>
		    		<div class="col-md-9">
		      			<div class="card-body">
		        			<h5 class="card-title"><%=bookDto.getTitle() %></h5>
		        			<form id="detail-menu" method="get">
			        			<table class="table">
			        				<colgroup>
			        					<col width="18%">
			        					<col width="32%">
			        					<col width="18%">
			        					<col width="32%">
			        				</colgroup>
			        				<tbody>
			        					<tr>
			        						<th>저자</th>
			        						<td><%=bookDto.getWriter() %></td>
			        						<%
			        							if (bookDto.getTranslator() != null) {
			        						%>
				        						<th>역자</th>
				        						<td><%=bookDto.getTranslator() %></td>
			        						<%
			        							}
			        						%>
			        					</tr>
			        					<tr>
			        						<th>출판사</th>
			        						<td><%=bookDto.getPublisher() %></td>
			        						<th>출판일</th>
			        						<td><%=bookDto.getPublishedDate() %></td>
			        					</tr>
			        					<tr>
			        						<th>카테고리</th>
			        						<td><%=bookDto.getCategory().getName() %></td>
			        						<th>재고현황</th>
			        						<td><%=bookDto.getStock() %> 권</td>
			        					</tr>
			        					<tr>
			        						<th>정가</th>
			        						<td><small><%=bookDto.getPrice() %> 원</small></td>
			        						<th>상태</th>
			        						<td><%=bookDto.getStatus() %></td>
			        					</tr>
			        					<tr>
			        						<th>판매가</th>
			        						<td><strong  class="text-danger"><%=bookDto.getDiscountPrice() %> 원</strong> <small>(<%=(int)(bookDto.getDiscountRate()*100) %>%할인)</small></td>
			        						<th>포인트</th>
			        						<td><span class="text-danger"><%=bookDto.getPoint() %>원</span> 적립</td>
			        					</tr>
			        					<tr>
			        						<th>평점</th>
			        						<td><strong class="text-danger"><%=bookDto.getReviewPoint() %></strong> 점</td>
			        						<th>사용자 리뷰</th>
			        						<td><%=bookDto.getReviewCount() %> 개</td>
			        					</tr>
			        					<tr>
			        						<th>구매수량</th>
			        						<td>
			        						<input type="number" class="form-control" name="amount" value="1" style="width: 100px;">
			        						<input type="hidden" name="bookno" value=<%=bookDto.getNo() %> />
			        						</td>
			        						<td colspan="2" class="text-right">
			        							<button type="button" class="btn btn-primary" onclick="directBuy()">바로구매</button>
			        							<button type="button" class="btn btn-info" onclick="insertCart()">장바구니</button>
			        							<a href="list.jsp?pno=<%=pageNo %>" class="btn btn-outline-primary">쇼핑계속</a>
			        						</td>
			        					</tr>
			        				</tbody>
			        			</table>
		        			</form>
		      			</div>
			  		</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 사용자 리뷰 -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5>
						사용자 리뷰
						<%
							if (loginedUserId != null) {
						%>
						<button class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#modal-review-form" id="review-write" >리뷰쓰기</button>
						<%
							}
						%>
					</h5>
				</div>
				<!-- 사용자 리뷰 리스트 시작 -->
				<%
					int rows = 4;
					int reviewPageNo = StringUtils.stringToInt(request.getParameter("rpno"), 1);
					
					int begin = (reviewPageNo - 1) * rows + 1;
					int end = reviewPageNo * rows;
					
					ReviewDao reviewDao = ReviewDao.getInstance();
					List<ReviewDto> reviewDtos = reviewDao.getReviewDtosByBookNoAndRange(begin, end, bookNo);
				%>
				<!-- 사용자 리뷰 반복 시작 -->
				<%
					for (ReviewDto reviewDto : reviewDtos) {
				%>
					<div class="card-body border border-left-0 border-top-0 border-right-0">
						<h5 class="card-title  d-flex justify-content-between">
							<span><%=reviewDto.getTitle() %></span>
							<small class="text-secondary">
								<span class="mr-3">평점:<span class="text-danger"><%=reviewDto.getPoint() %></span> </span> 
								<span class="mr-3"><%=reviewDto.getUser().getName() %></span> <span class="mr-3"><%=reviewDto.getCreatedDate() %></span>
							</small>
						</h5>
						<div class="card-text"><%=reviewDto.getContent() %></div>
						<%
							ReviewLikeUser reviewLikeUser = null;
							if (user != null) {
								reviewLikeUser = reviewDao.getReviewLikeUserByNo(user.getNo(), reviewDto.getNo());
							}
						%>
						<div class="mt-2 text-secondary text-right"><small>이 리뷰가 도움이 되셨나요? <a href="likes.jsp?pno=<%=pageNo %>&rpno=<%=reviewPageNo %>&reviewno=<%=reviewDto.getNo() %>" class="ml-3 btn btn-outline-secondary btn-xs <%=user == null ? "disabled" : "" %>" ><i class="fa fa-heart<%=reviewLikeUser == null ? "-o" : " text-danger" %>" ></i> <%=reviewDto.getLikeCount() %></a></small></div>
					</div>
				<%
					}
				%>
				<!-- 사용자 리뷰 반복 종료 -->
				<!-- 사용자 리뷰 리스트 종료  -->
				<%
					int totalRecords = reviewDao.getTotalRecordsByBookNo(bookNo);
					int totalPages = (int) Math.ceil((double) totalRecords/rows);
				%>
				<!-- 페이지 처리 시작 -->
				<div class="p-3">
					<ul class="pagination justify-content-center">
				  		<li class="page-item <%=reviewPageNo <= 1 ? "disabled" : "" %>"><a class="page-link" href="detail.jsp?pno=<%=pageNo %>&bookno=<%=bookNo %>&rpno=<%=reviewPageNo - 1 %>">이전</a></li>
				  	    <%
				  	    	for (int num=1; num<=totalPages; num++) {
				  	    %>
				  	    	<li class="page-item <%=reviewPageNo == num ? "active" : "" %>"><a class="page-link" href="detail.jsp?pno=<%=pageNo %>&bookno=<%=bookNo %>&rpno=<%=num %>"><%=num %></a></li>
				  		<%
				  	    	}
				  		%>
				  		<li class="page-item <%=reviewPageNo >= totalPages ? "disabled" : "" %>"><a class="page-link" href="detail.jsp?pno=<%=pageNo %>&bookno=<%=bookNo %>&rpno=<%=reviewPageNo + 1 %>">다음</a></li>
					</ul>
				</div>
				<!-- 페이지 처리 종료  -->
			</div>
		</div>
	</div>
	
	<!-- 리뷰 쓰기 폼 모달 시작 -->
	<!-- Modal -->
	   <div class="modal fade" id="modal-review-form" tabindex="-1" aria-hidden="true">
	        <div class="modal-dialog">
	          <form method="post" action="insertReview.jsp">
	          <input type="hidden" name="pno" value="<%=pageNo %>" />
	          <input type="hidden" name="bookno" value="<%=bookNo %>" />
	          <div class="modal-content">
	               <div class="modal-header">
	                 <h5 class="modal-title">리뷰 작성하기</h5>
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                      <span aria-hidden="true">&times;</span>
	                 </button>
	               </div>
	               <div class="modal-body">
	                  <div class="card">
	                     <div class="card-body">
	                       <div class="form-group">
	                          <label class="font-weight-bold">제목</label>
	                          <input type="text" class="form-control" name="title" />
	                       </div>
	                       <div class="form-group">
	                          <label class="font-weight-bold">평점</label>
	                          <div class="form-check">
	                             <div class="form-check-inline">
	                              <label class="form-check-label">
	                                  <input type="radio" class="form-check-input" name="point" value="1">1점
	                                </label>
	                           </div>
	                             <div class="form-check-inline">
	                              <label class="form-check-label">
	                                  <input type="radio" class="form-check-input" name="point" value="2">2점
	                                </label>
	                           </div>
	                             <div class="form-check-inline">
	                              <label class="form-check-label">
	                                  <input type="radio" class="form-check-input" name="point" value="3">3점
	                                </label>
	                           </div>
	                             <div class="form-check-inline">
	                              <label class="form-check-label">
	                                  <input type="radio" class="form-check-input" name="point" value="4">4점
	                                </label>
	                           </div>
	                             <div class="form-check-inline">
	                              <label class="form-check-label">
	                                  <input type="radio" class="form-check-input" name="point" value="5" checked>5점
	                                </label>
	                           </div>
	                          </div>
	                       </div>
	                       <div class="form-group">
	                          <label class="font-weight-bold">내용</label>
	                          <textarea rows="5" class="form-control" name="content"></textarea>
	                       </div>
	                     </div>
	                  </div>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                 <button type="submit" class="btn btn-primary">등록</button>
	               </div>
	          </div>
	          </form>
	        </div>
	   </div>

	<!-- 리뷰 쓰기 폼 모달 끝 -->
	
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>

<script type="text/javascript">
	function directBuy() {
		var formElement = document.querySelector("#detail-menu");
		formElement.setAttribute("action", "../order/form.jsp");
		
		formElement.submit();
	}
	function insertCart() {
		var formElement = document.querySelector("#detail-menu");
		formElement.setAttribute("action", "../cart/insertItem.jsp");
		
		formElement.submit();
	}
	
</script>
</body>
</html>