<%@page import="kr.co.shop.vo.BankCardCompany"%>
<%@page import="kr.co.shop.dao.BankCardDao"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.vo.Book"%>
<%@page import="kr.co.shop.dao.BookDao"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@page import="kr.co.shop.dto.CartItemDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.shop.dao.CartDao"%>
<%@page import="kr.co.shop.vo.CartItem"%>
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
	 	int bookNo = StringUtils.stringToInt(request.getParameter("bookno"), 0);
		int amount = StringUtils.stringToInt(request.getParameter("amount"), 0);
		String[] cartNumbers = request.getParameterValues("cartno");
		
		CartDao cartDao = CartDao.getInstance();
		
		// 주문할 책의 정보를 담는 List 객체(dto인 이유는 아래에서 책에 대한 정보를 보여줘야되기 때문)
		List<CartItemDto> cartItemDtos = new ArrayList<>();
		// bookNo == 0 이라면 장바구니에서 구매한 것.
		// 장바구니에서 체크한 책들의 정보를 장바구니 테이블에 저장하고, cartItemDtos 리스트에 저장한다.
		if (bookNo == 0) {
			// 변경된 수량을 장바구니 테이블에 저장하는 실행문
			// bookNo가 0이고 amount도 0이면 장바구니에서 선택한 상품주문
			// (수량변경 후 장바구니 테이블에 저장해주지 않았기 때문에 여기서 저장해준다.)
			if(amount == 0) {
				List<CartItem> cartItems = cartDao.getCartItemsByUserNo(loginedUserNo);
				
				for (CartItem cartItem : cartItems) {
					String name = "amount-" + cartItem.getNo();
					cartItem.setAmount(StringUtils.stringToInt(request.getParameter(name)));
					cartDao.updateCartItem(cartItem);
				} 				
			} else {
				// bookNo는 0인데 amount가 0이 아니면 장바구니에서 개별주문
				// (수량변경 후 장바구니 테이블에 저장해주지 않았기 때문에 여기서 저장해준다.)
				int cartNo = StringUtils.stringToInt(cartNumbers[0]);
				CartItem cartItem = cartDao.getCartItemByNo(cartNo);
				cartItem.setAmount(amount);
				cartDao.updateCartItem(cartItem);
			}
			
			// 장바구니에서 체크한 책 번호들을 이용해서 장바구니 안에 있는 정보를 조회
			// cartItemDtos 리스트에 저장
			for (String cartNumber : cartNumbers) {
				int cartNo = Integer.parseInt(cartNumber);
				CartItemDto cartItemDto = cartDao.getCartItemDtoByNo(cartNo);
				cartItemDtos.add(cartItemDto);
			}
		} else {
			// product/detail.jsp에서 바로 구매 했을 경우
			// cartItemDtos 리스트에 저장
		 	CartItemDto cartItemDto = new CartItemDto();
		 	cartItemDto.setAmount(amount);
		 	
		 	BookDao bookDao = BookDao.getInstance();
		 	Book book = bookDao.getBookByNo(bookNo);
		 	cartItemDto.setBook(book);
		 	
			cartItemDtos.add(cartItemDto);
		} 
		
		int totalOrderPrice = 0;
		int totalOrderPoint = 0;
		
	%>
	
	<form method="post" action="insert.jsp">
		<!-- 주문 상품 정보 시작 -->
		<!-- 바로구매 눌렀을 때 책 번호, 가격, 구매수량 넘겨주기  -->
		<input type="hidden" name="bookno" value="<%=bookNo %>" />
		<input type="hidden" name="amount" value="<%=amount %>" />
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">주문상품 확인</div>
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
								for (CartItemDto cartItemDto : cartItemDtos) {
							%>
								<tr>
									<td>
										<img src="../resources/images/<%=cartItemDto.getBook().getFileName() %>.jpg" width="60px" height="88px" />
										<span class="align-top"><a href="../product/detail.jsp?bookno=<%=cartItemDto.getBook().getNo() %>" class="text-body"><%=cartItemDto.getBook().getTitle() %></a></span>
									</td>
									<td><%=cartItemDto.getBook().getPrice() %>원</td>
									<td>
										<%=cartItemDto.getBook().getDiscountPrice() %>원<br/>
										<small>(<%=cartItemDto.getBook().getPoint() %>원 적립)</small>
										<!-- insert.jsp에 넘겨줄 장바구니 번호 (장바구니에서 구매했을 때)-->
										<input type="hidden" name="cartno" value="<%=cartItemDto.getNo() %>" />
									</td>
									<td><%=cartItemDto.getAmount() %></td>
									<td><strong><%=cartItemDto.getAmount() * cartItemDto.getBook().getDiscountPrice() %>원</strong></td>
								</tr>
							<%
								totalOrderPrice += cartItemDto.getAmount() * cartItemDto.getBook().getDiscountPrice();
								totalOrderPoint += cartItemDto.getAmount() * cartItemDto.getBook().getPoint();
								}
							%>
							</tbody>
						</table>
					</div>
					<div class="card-footer text-right">
					<input type="hidden" name="totalPoint" value="<%=totalOrderPoint %>" />
						<span>상품 총 금액 : <strong class="mr-5"><%=totalOrderPrice %>원</strong> 포인트 적립액 : <strong><%=totalOrderPoint %>원</strong></span>
					</div>	
				</div>
			</div>
		</div>
		<!-- 주문 상품 정보 끝 -->
		
		<!-- 배송 정보 시작 -->
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">배송정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>받는사람 이름</label>
      							<input type="text" class="form-control" name="name">
							</div>
							<div class="form-group col-3">
								<label>받는사람 연락처</label>
      							<input type="text" class="form-control" name="tel">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-3">
								<label>우편번호</label>
      							<input type="text" class="form-control" name="zipcode">
							</div>
							<div class="form-group col-9">
								<label>주소</label>
      							<input type="text" class="form-control" name="address">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label>택배사 직원에게 남길 메세지 <small class="text-secondary">(예: 부재시 경비실에 맡겨주세요)</small></label>
      							<textarea rows="3" class="form-control" name="memo"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 배송정보 끝 -->
		<%
			UserDao userDao = UserDao.getInstance();
			User user = userDao.getUserByNo(loginedUserNo);
		%>
		<!-- 결재정보 시작 -->
		<div class="row mt-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">결재정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>사용가능 포인트 <button type="button" class="btn btn-primary btn-xs" onclick="usePoint(<%=user.getPoint() %>)">사용하기</button></label>
      							<input type="text" class="form-control" name="usablePoint" value="<%=user.getPoint() %>" disabled>
							</div>
							<div class="form-group col-3">
								<label>총 구매금액</label>
      							<input type="text" class="form-control" name="totalPrice" value="<%=totalOrderPrice %>" readonly>
							</div>
							<div class="form-group col-3">
								<label>포인트 사용액</label>
      							<input type="text" class="form-control" name="usedPoint" value="0" readonly>
							</div>
							<div class="form-group col-3">
								<label>총 결재금액</label>
      							<input type="text" class="form-control" name="orderPrice" value="<%=totalOrderPrice %>" readonly>
							</div>
						</div>
						<%
							BankCardDao bankCardDao = BankCardDao.getInstance();
							List<BankCardCompany> bankCardCompanies = bankCardDao.getAllBankCardCompanies();
						%>
						<div class="form-row">
							<div class="form-group col-6">
								<label>은행 및 카드사</label>
      							<select name="bank" class="form-control">
                                	<option value="" selected disabled>카드사 및 은행 선택</option>
                                	<%
                                		for (BankCardCompany bankCardCompany : bankCardCompanies) {
                                	%>
                                    	<option value="<%=bankCardCompany.getNo() %>" > <%=bankCardCompany.getName() %></option>
									<%
                                		}
									%>
                            	</select>
							</div>
							<div class="form-group col-6">
								<label>카드번호 및 계좌번호</label>
      							<input type="text" class="form-control" name="account">
							</div>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-primary btn-lg">결재하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 결재정보 끝  -->
	</form>
	
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>

<script type="text/javascript">
	function usePoint(savedPoint) {
		var usedPoint = document.querySelector("[name='usedPoint']");
		
		// 사용하기 버튼을 눌렀을때, 포인트 사용액이 "0"이면 사용가능 포인트로 바꾸고 총 결재금액에서 사용가능 포인트를 빼준다.
		// 							 				 "0"이 아니면 "0"으로 바꾸고 총 결재금액에서 사용가능 포인트를 더해준다.
		if (usedPoint.value === "0") {
			usedPoint.value = savedPoint;
			document.querySelector("[name='orderPrice']").value = parseInt(document.querySelector("[name='orderPrice']").value) - savedPoint;
		} else {
			usedPoint.value = "0";
			document.querySelector("[name='orderPrice']").value = parseInt(document.querySelector("[name='orderPrice']").value) + savedPoint;
		}
	}

</script>
</body>
</html>