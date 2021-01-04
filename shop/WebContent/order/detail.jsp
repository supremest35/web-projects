<%@page import="kr.co.shop.vo.UserPointHistory"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@page import="kr.co.shop.dto.OrderItemDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.vo.Order"%>
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
		int orderNo = StringUtils.stringToInt(request.getParameter("orderno"));
		
		OrderDao orderDao = OrderDao.getInstance();
		Order order = orderDao.getOrderByNo(orderNo);
		List<OrderItemDto> orderItemDtos = orderDao.getOrderItemDtosByOrderNo(orderNo);
		
		UserDao userDao = UserDao.getInstance();
		UserPointHistory userPointHistory = userDao.getPointHistoryByOrderNo(orderNo);
	%>
	<!-- 주문 상품 정보 시작 -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold">주문 상세 정보</div>
				<div class="card-body">
					<table class="table table-bordered">
						<colgroup>
							<col width="18%">
							<col width="32%">
							<col width="18%">
							<col width="32%">
						</colgroup>
						<tbody>
							<tr>	
								<th>주문번호</th><td><strong><%=order.getNo() %></strong></td>
								<th>주문상태</th><td><%=order.getStatus() %> 
								<%
									if ("결재완료".equals(order.getStatus())) {
								%>
										<a href="cancel.jsp?orderno=<%=orderNo %>" class="btn btn-danger btn-xs float-right">주문취소</a>
								<%
									}
								%>
								</td><!-- 주문취소 버튼은 결재완료 상태일 때만 표시됨 -->
							</tr>
							<tr>
								<th>주문일자</th><td><%=order.getCreatedDate() %></td>
								<th>주문하신 분</th><td><%=loginedUserName %></td>
							</tr>
							<tr>
								<th>받으시는 분</th><td><%=order.getRecName() %></td>
								<th>받으시는 분 연락처</th><td><%=order.getRecTel() %></td>
							</tr>
							<tr>
								<th>주소</th><td colspan="3"> (<%=order.getRecZipCode() %>) <%=order.getRecAddress() %></td>
							</tr>
							<tr>
								<th>총 주문 금액</th><td colspan="3"><strong><%=df.format(order.getTotalOrderPrice()) %></strong>원</td>
							</tr>
							<tr>
								<th>결재금액</th><td><strong class="text-danger"><%=df.format(order.getTotalPaymentPrice()) %></strong>원 (포인트: <span class="text-primary"><%=df.format(order.getUsedPoint()) %></span>원 사용)</td>
								<th>포인트 적립액</th><td><strong class="text-danger"><%=df.format(userPointHistory.getAmount()) %></strong>원</td>
							</tr>
							<tr>
								<th>결재내용</th><td>카드결재 </td>
								<th>은행 및 카드사</th><td>신한카드</td>
							</tr>
						</tbody>
					</table>
				</div>
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
									<span class="align-top"><a href="../product/detail.jsp?bookno=<%=orderItemDto.getBook().getNo() %>" class="text-body"><%=orderItemDto.getBook().getTitle() %></a></span>
								</td>
								<td><%=df.format(orderItemDto.getBook().getPrice()) %>원</td>
								<td>
									<%=df.format(orderItemDto.getBook().getDiscountPrice()) %>원<br/>
									<small>(<%=df.format(orderItemDto.getBook().getPoint()) %>원 적립)</small>
								</td>
								<td><%=orderItemDto.getAmount() %></td>
								<td><strong><%=df.format(orderItemDto.getPrice()) %>원</strong></td>
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