<%@page import="kr.co.shop.dto.OrderItemDto"%>
<%@page import="kr.co.shop.vo.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.vo.Order"%>
<%@page import="kr.co.shop.dao.OrderDao"%>
<%@page import="kr.co.shop.vo.UserPointHistory"%>
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
		int orderNo = StringUtils.stringToInt(request.getParameter("orderNo"));
		
		UserDao userDao = UserDao.getInstance();
		UserPointHistory userPointHistory = userDao.getPointHistoryByOrderNo(orderNo);
		
		OrderDao orderDao = OrderDao.getInstance();
		Order order = orderDao.getOrderByNo(orderNo);
		List<OrderItemDto> orderItemDtos = orderDao.getOrderItemDtosByOrderNo(orderNo);
	
	%>
	<!-- 주문 상품 정보 시작 -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="alert alert-success text-center" style="font-size: 27px;">
				<span><strong><%=loginedUserName %></strong>님 주문이 완료되었습니다.</span><br />
				<span class="mt-2 small">주문번호 : <%=orderNo %> 포인트 적립액 : <%=userPointHistory.getAmount() %>원</span>
			</div>
		</div>
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold">주문상품</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="*">
							<col width="10%">
							<col width="10%">
							<col width="7%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>상품명</th>
								<th>정가</th>
								<th>판매가</th>
								<th>수량</th>
								<th>구매가격</th>
							</tr>
						</thead>
						<tbody>
						<%
							for (OrderItemDto orderItemDto : orderItemDtos) {
						%>
							<tr>
								<td>
									<img src="../resources/images/<%=orderItemDto.getBook().getFileName() %>.jpg" width="60px" height="88px" />
									<span class="align-top"><a href="detail.jsp?orderNo=<%=orderNo %>" class="text-body"><%=orderItemDto.getBook().getTitle() %></a></span>
								</td>
								<td><%=orderItemDto.getBook().getPrice() %>원</td>
								<td>
									<%=orderItemDto.getBook().getDiscountPrice() %>원<br/>
									<small>(<%=orderItemDto.getBook().getPoint() %>원 적립)</small>
								</td>
								<td><%=orderItemDto.getAmount() %></td>
								<td><strong><%=orderItemDto.getAmount() * orderItemDto.getPrice() %>원</strong></td>
							</tr>
							<tr>
						<%
							}
						%>
						</tbody>
					</table>
				</div>
				<div class="card-footer text-right">
					<span>
					상품 총 금액 : <strong class="mr-5"><%=order.getTotalOrderPrice() %>원</strong> 
					포인트 사용액 : <strong class="mr-5"><%=order.getUsedPoint() %>원</strong>
					총 결재 금액 : <strong class="mr-5 text-danger"><%=order.getTotalPaymentPrice() %>원</strong> 
					</span>
				</div>	
			</div>
		</div>
	</div>
	<!-- 주문 상품 정보 끝 -->
	
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>