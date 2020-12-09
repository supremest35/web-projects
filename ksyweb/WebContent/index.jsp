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
			<%@ include file="common/navbar.jsp" %>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-12">
			<div class="jumbotron">
				<h1>블로그 메인</h1>
		  		<p>블로그에 글을 작성하고, 공유합니다.</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 mt-5">
			<%@ include file="common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>