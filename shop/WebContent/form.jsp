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
	<%
		String error = request.getParameter("error");
	%>
	<div class="row">
	<%
		if ("pwd".equals(error)) {
	%>
		<div class="col-12">
			<div class="alert alert-danger">
				<strong>오류</strong> 비밀번호가 일치하지 않습니다.
			</div>
		</div>
	<% 
		}
	%>
	<%
		if ("dupId".equals(error)) {
	%>
		<div class="col-12">
			<div class="alert alert-danger">
				<strong>오류</strong> 이미 사용중인 아이디입니다.
			</div>
		</div>
	<%
		}
	%>
	</div>
	
	<div class="row">
		<div class="col-12">
			<div class="card">
				<form method="post" action="register.jsp">
				<div class="card-header"><h4>회원가입 폼</h4></div>
				<div class="card-body">
					<div class="form-group">
						<label>이름</label>
						<input type="text" class="form-control" name="name" required />
					</div>
					<div class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" name="id" required/>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="password" required/>
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label>
						<input type="password" class="form-control" name="password2" required/>
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<input type="text" class="form-control" name="tel" required/>
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type="text" class="form-control" name="email" required/>
					</div>
					<div class="text-right">
						<a href="/" class="btn btn-secondary">취소</a>
						<input type="submit" class="btn btn-primary" value="회원가입" />
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