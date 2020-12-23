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
								<th><input type="checkbox" id="chk-all" checked /></th>
								<th>상품명</th>
								<th>정가</th>
								<th>판매가</th>
								<th>수량</th>
								<th>구매가격</th>
								<th>주문</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="cartno" value="100" checked /></td>
								<td>
									<img src="../resources/images/book.jpg" width="60px" height="88px" />
									<span class="align-top"><a href="detail.jsp" class="text-body">불안한 마음을 잠재우는 방법</a></span>
								</td>
								<td>18,000원</td>
								<td>
									16,200원<br/>
									<small>(900원 적립)</small>
								</td>
								<td>
									<input type="number" name="amount" value="1" style="width: 43px; height: 20px;"/><br/>
									<a href="" class="btn btn-outline-secondary btn-xs">변경</a>
								</td>
								<td><strong>16,200원</strong></td>
								<td>
									<a href="" class="btn btn-primary btn-xs">주문하기</a><br />
									<a href="deleteItem.jsp" class="btn btn-secondary btn-xs">삭제하기</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="cartno" value="100" checked /></td>
								<td>
									<img src="../resources/images/book.jpg" width="60px" height="88px" />
									<span class="align-top"><a href="detail.jsp" class="text-body">불안한 마음을 잠재우는 방법</a></span>
								</td>
								<td>18,000원</td>
								<td>
									16,200원<br/>
									<small>(900원 적립)</small>
								</td>
								<td>
									<input type="number" name="amount" value="1" style="width: 43px; height: 20px;"/><br/>
									<a href="" class="btn btn-outline-secondary btn-xs">변경</a>
								</td>
								<td>
									<strong>16,200원</strong>
								</td>
								<td>
									<a href="" class="btn btn-primary btn-xs">주문하기</a><br />
									<a href="deleteItem.jsp" class="btn btn-secondary btn-xs">삭제하기</a>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="cartno" value="100" checked /></td>
								<td>
									<img src="../resources/images/book.jpg" width="60px" height="88px" />
									<span class="align-top"><a href="detail.jsp" class="text-body">불안한 마음을 잠재우는 방법</a></span>
								</td>
								<td>18,000원</td>
								<td>
									16,200원<br/>
									<small>(900원 적립)</small>
								</td>
								<td>
									<input type="number" name="amount" value="1" style="width: 43px; height: 20px;"/><br/>
									<a href="" class="btn btn-outline-secondary btn-xs">변경</a>
								</td>
								<td><strong>16,200원</strong></td>
								<td>
									<a href="" class="btn btn-primary btn-xs">주문하기</a><br />
									<a href="deleteItem.jsp" class="btn btn-secondary btn-xs">삭제하기</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-footer d-flex justify-content-between">
					<span>선택한 상품 <button class="btn btn-primary btn-xs">주문하기</button> <button class="btn btn-secondary btn-xs">삭제하기</button></span>
					<span>상품 총 금액 : <strong class="mr-5">48,600원</strong> 포인트 적립액 : <strong>2,7000원</strong></span>
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