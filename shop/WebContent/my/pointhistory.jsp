<%@page import="kr.co.shop.vo.UserPointHistory"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.dao.UserDao"%>
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
<style type="text/css">
	.btn-group-xs > .btn, .btn-xs {
	  padding: .45rem .4rem;
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
		UserDao userDao = UserDao.getInstance();
		User user = userDao.getUserByNo(loginedUserNo);
	%>
  	<div class="row mb-3">
  		<div class="col-12">
			<div class="alert alert-info text-center" style="font-size: 27px;">
				<span><strong><%=loginedUserName %></strong>님의 포인트 내역입니다..</span><br />
				<span class="mt-2 small">현재 포인트 적립액 : <%=user.getPoint() %>원</span>
			</div>
		</div>
  	</div>
 
 	<div class="row mb-3">
 		<div class="col-12">
 			<div class="card">
 				<div class="card-body">
 					<h4 class="card-title">포인트 내역</h4>
 					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>일자</th>
								<th>내용</th>
								<th>주문번호</th>
								<th>포인트</th>
							</tr>
						</thead>
						<tbody>
						<%
							List<UserPointHistory> userPointHistories = userDao.getPointHistoriesByUserNo(loginedUserNo);
							for (UserPointHistory userPointHistory : userPointHistories) {
						%>
							<tr>
								<td><%=userPointHistory.getCreatedDate() %></td>
								<td><%=userPointHistory.getContent() %></td>
								<td><%=userPointHistory.getOrderNo() == 0 ? "" : userPointHistory.getOrderNo() %></td>
								<td class="text-right pr-5"><strong class="text-warning"><%=userPointHistory.getAmount() %></strong> 원</td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
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