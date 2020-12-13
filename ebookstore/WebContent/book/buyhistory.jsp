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
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h4>구매내역 리스트</h4>
				</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="12%">
							<col width="12%">
							<col width="*">
							<col width="12%">
							<col width="10%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>구매일자</th>
								<th>주문상태</th>
								<th>제목</th>
								<th>구매가격</th>
								<th>수량</th>
								<th>결재금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>100</td>
								<td>2020-12-10</td>
								<td>결재완료</td>
								<td><a href="detail.jsp">이것이 자바다</a></td>
								<td>32,000 원</td>
								<td>2</td>
								<td>64,000 원</td>
							</tr>
							<tr>
								<td>78</td>
								<td>2020-12-9</td>
								<td>배송중</td>
								<td><a href="detail.jsp">이것이 자바다</a></td>
								<td>32,000 원</td>
								<td>2</td>
								<td>64,000 원</td>
							</tr>
							<tr>
								<td>67</td>
								<td>2020-12-7</td>
								<td>배송완료</td>
								<td><a href="detail.jsp">이것이 자바다</a></td>
								<td>32,000 원</td>
								<td>2</td>
								<td>64,000 원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>