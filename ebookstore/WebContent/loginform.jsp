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
		<div class='col-12'>
			<%@ include file="common/navbar.jsp" %>
		</div>
	</div>
	<%
		String error = request.getParameter("error");
	%>
	<%
		if ("blank".equals(error)) {
	%>
		<div class="col-6 offset-3">
			<div class="alert alert-danger">
				<strong>오류</strong> 아이디와 비밀번호는 필수 입력값입니다.
			</div>
		</div>
	<%
		}
	%>
	<%
		if ("invalid".equals(error)) {
	%>
		<div class="col-6 offset-3">
			<div class="alert alert-danger">
				<strong>오류</strong> 아이디혹은 비밀번호가 올바르지 않습니다.
			</div>
		</div>
	<%
		}
	%>
	<%
		if ("required".equals(error)) {
	%>
		<div class="col-6 offset-3">
			<div class="alert alert-danger">
				<strong>오류</strong> 로그인이 필요한 페이지에 접속했습니다. 로그인 후 이용하세요.
			</div>
		</div>
	<%
		}
	%>
	<div class="row">
		<div class="col-6 offset-3">
			<div class="card">
				<form method="post" action="login.jsp">
					<div class="card-header"><h4>로그인 폼</h4></div>
					<div class="card-body">
						<div class="form-group">
							<label>아이디</label>
							<input type="text" class="form-control" name="id" />
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" name="password" />
						</div>
						<div class="text-right">
							<a href="" class="btn btn-secondary">취소</a>
							<input type="submit" class="btn btn-primary" value="로그인" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<%@ include file="common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>