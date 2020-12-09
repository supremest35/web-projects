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
					<h4>게시글 리스트 <a href="form.jsp" class="btn btn-primary float-right">새 글</a></h4>
				</div>
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>추천수</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
							<tr>
								<td>10000</td>
								<td><a href="">게시글 글 쓰기 연습입니다.</a></td>
								<td>관리자</td>
								<td>10</td>
								<td>2020-12-08</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="" class="page-link">&laquo;</a></li>
						<li class="page-item"><a href="" class="page-link">1</a></li>
						<li class="page-item"><a href="" class="page-link">2</a></li>
						<li class="page-item"><a href="" class="page-link">3</a></li>
						<li class="page-item"><a href="" class="page-link">4</a></li>
						<li class="page-item"><a href="" class="page-link">5</a></li>
						<li class="page-item"><a href="" class="page-link">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>