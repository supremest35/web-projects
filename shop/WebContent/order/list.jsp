<%@page import="kr.co.shop.dto.OrderItemDto"%>
<%@page import="kr.co.shop.vo.OrderItem"%>
<%@page import="kr.co.shop.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.dao.OrderDao"%>
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
		OrderDao orderDao = OrderDao.getInstance();
		List<Order> orders = orderDao.getOrdersByUserNo(loginedUserNo);
	%>
	<!-- 주문 내역 시작 -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold">주문 내역</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문일자</th>
								<th>주문내역</th>
								<th>주문금액/수량</th>
								<th>주문상태</th>
								<th>주문자</th>
								<th>수령자</th>
							</tr>
						</thead>
						<tbody>
						<%
							for (Order order : orders) {
							List<OrderItemDto> orderItemDtos = orderDao.getOrderItemDtosByOrderNo(order.getNo()); 
						%>
							<tr>
								<td><a href="detail.jsp?orderno=<%=order.getNo() %>"><%=order.getNo() %></a></td>
								<td><%=order.getCreatedDate() %></td>
								<td><a href="detail.jsp?orderno=<%=order.getNo() %>"><%=orderItemDtos.get(0).getBook().getTitle() %> 외 <%=order.getAmount() - 1 %>종</a></td>
								<td><%=order.getTotalOrderPrice() %>원/<%=order.getAmount() %></td>
								<td><span class="text-success"><%=order.getStatus() %></span></td>
								<td><%=loginedUserName %></td>
								<td><%=order.getRecName() %></td>
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
	<!-- 주문 상품 정보 끝 -->
	
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>