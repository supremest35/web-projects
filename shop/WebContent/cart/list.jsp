<%@page import="kr.co.shop.dto.CartItemDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.dao.CartDao"%>
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
		CartDao cartDao = CartDao.getInstance();
		List<CartItemDto> cartItemDtos = cartDao.getCartItemDtosByUserNo(loginedUserNo);
	%>
	<form method="post" action="" id="cart-form">
	<div id="hidden-input"></div>
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">장바구니</div>
					<div class="card-body">
						<table class="table">
							<colgroup>
								<col width="2%">
								<col width="*">
								<col width="10%">
								<col width="10%">
								<col width="7%">
								<col width="15%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="chk-all" onchange="checkAll()" checked /></th>
									<th>상품명</th>
									<th>정가</th>
									<th>판매가</th>
									<th>수량</th>
									<th>구매가격</th>
									<th>주문</th>
								</tr>
							</thead>
							<tbody>
							<%
								for (CartItemDto cartItemDto : cartItemDtos) {
							%>
								<tr>
									<td><input type="checkbox" name="cartno" value="<%=cartItemDto.getNo() %>" id="chkbox-<%=cartItemDto.getNo() %>" onchange="updateTotalOrderPrice()" checked/></td>
									<td>
										<img src="../resources/images/<%=cartItemDto.getBook().getFileName() %>.jpg" width="60px" height="88px" />
										<span class="align-top"><a href="../product/detail.jsp?bookno=<%=cartItemDto.getBook().getNo() %>" class="text-body"><%=cartItemDto.getBook().getTitle() %></a></span>
									</td>
									<td><%=cartItemDto.getBook().getPrice() %></td>
									<td>
										<span  id="cartItem-price-<%=cartItemDto.getNo() %>"><%=cartItemDto.getBook().getDiscountPrice() %></span>원<br/>
										<small>(<span id="cartItem-point-<%=cartItemDto.getNo() %>"><%=cartItemDto.getBook().getPoint() %></span>원 적립)</small>
									</td>
									<td>
										<input type="number" name="amount" value="<%=cartItemDto.getAmount() %>" style="width: 43px; height: 20px;" id="cartItem-amount-<%=cartItemDto.getNo() %>" onchange="updateOrderPrice(<%=cartItemDto.getNo() %>)"/><br/>
									</td>
									<td><strong id="cartItem-orderPrice-<%=cartItemDto.getNo() %>"><%=cartItemDto.getBook().getDiscountPrice() * cartItemDto.getAmount() %></strong><strong>원</strong></td>
									<td>
										<a href="../order/form.jsp?bookno=<%=cartItemDto.getBook().getNo() %>" class="btn btn-primary btn-xs">주문하기</a><br />
										<a href="deleteItem.jsp?cartno=<%=cartItemDto.getNo() %>" class="btn btn-secondary btn-xs">삭제하기</a>
									</td>
								</tr>
							<%
								}
							%>
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex justify-content-between">
						<span>선택한 상품 <button class="btn btn-primary btn-xs" onclick="orderItems()">주문하기</button> <button class="btn btn-secondary btn-xs" onclick="deleteItems()">삭제하기</button></span>
						<span>상품 총 금액 : <strong class="mr-5"><span id="cartItem-totalOrderPrice"></span>원</strong> 포인트 적립액 : <strong><span id="cartItem-totalPoint"></span>원</strong></span>
					</div>	
				</div>
			</div>
		</div>
	</form>
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>




<script type="text/javascript">
	(function () {
		updateTotalOrderPrice();
	}) ();
	
	function checkAll() {
		var checkAllBox = document.querySelector("#chk-all").checked;
		var checkBoxes = document.querySelectorAll("[name='cartno']");
		if (checkAllBox) {
			for (var num=0; num<checkBoxes.length; num++) {
				checkBoxes[num].checked = true;
			}
		} else {
			for (var num=0; num<checkBoxes.length; num++) {
				checkBoxes[num].checked = false;
			}
		}
		updateTotalOrderPrice();
	}
	
	function updateOrderPrice(cartItemNo) {
		var price = document.querySelector("#cartItem-price-" + cartItemNo).textContent;
		var amount = document.querySelector("#cartItem-amount-" + cartItemNo).value;
		
		if (amount <= 1) {
			 amount = 1;
			 document.querySelector("#cartItem-amount-" + cartItemNo).value = 1;
		}
		
		var orderPrice = price * amount;
		
		document.querySelector("#cartItem-orderPrice-" + cartItemNo).textContent = orderPrice;
		document.querySelector("#chkbox-" + cartItemNo).checked = true;
		
		updateTotalOrderPrice();
	}
	
	function updateTotalOrderPrice() {
		var el = document.querySelector("#hidden-input");
		var checkBoxes = document.querySelectorAll("[name='cartno']");
		
		el.innerHTML = "";
		var totalOrderPrice = 0;
		var totalPoint = 0;
		var isUnchecked = false;
		
		for (var num=0; num<checkBoxes.length; num++) {
			// if 안에 있으면 아래 엘리먼트 추가하는 부분에서 값이 이상해짐
			var amount = document.querySelector("#cartItem-amount-" + checkBoxes[num].value).value;
			
			if (checkBoxes[num].checked) {
				var orderPrice = parseInt(document.querySelector("#cartItem-orderPrice-" + checkBoxes[num].value).textContent);
				var itemPoint = parseInt(document.querySelector("#cartItem-point-" + checkBoxes[num].value).textContent);
				
				totalOrderPrice += parseInt(orderPrice);
				totalPoint += itemPoint * amount;
			} else {
				isUnchecked = true;
			}
			// 여기가 엘리먼트 추가하는부분
			el.innerHTML += "<input type='hidden' name='amount-"+ checkBoxes[num].value +"' value='" + amount + "' />";
			console.log(num+ "번째 : "+amount);
		}
		
		if (isUnchecked) {
			document.querySelector("#chk-all").checked = false;
		} else {
			document.querySelector("#chk-all").checked = true;
		}
		
		document.querySelector("#cartItem-totalOrderPrice").textContent = totalOrderPrice;
		document.querySelector("#cartItem-totalPoint").textContent = totalPoint;
	}
	
	function orderItems () {
		var element = document.querySelector("#cart-form");
		element.setAttribute("action", "../order/form.jsp");
		
		element.submit();
	}
	
	function deleteItems () {
		var element = document.querySelector("#cart-form");
		element.setAttribute("action", "deleteItem.jsp");
		
		element.submit();
	}
</script>
</body>
</html>