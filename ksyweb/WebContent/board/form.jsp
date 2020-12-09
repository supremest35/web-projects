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
				<form method="post" action="insert.jsp">
					<div class="card-header"><h4>게시글 입력폼</h4></div>
					<div class="card-body">
						<div class="form-group row">
							<label class="col-2 col-form-label">카테고리</label>
							<div class="col-10">
								<select class="form-control" name="category">
									<option value="" selected disabled> 카테고리를 선택하세요</option>
									<option value="1"> 정치</option>
									<option value="2"> 경제</option>
									<option value="3"> 사회</option>
									<option value="4"> 스포츠</option>
									<option value="5"> 연예</option>
									<option value="6"> IT</option>
									<option value="7"> 기타</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-2 col-form-label">제목</label>
							<div class="col-10">
								<input type="text" class="form-control" name="title" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-2 col-form-label">내용</label>
							<div class="col-10">
								<textarea rows="10" class="form-control" name="content"></textarea>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="text-right">
							<a href="list.jsp" class="btn btn-secondary">취소</a>
							<input type="submit" class="btn btn-primary" value="저장">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>