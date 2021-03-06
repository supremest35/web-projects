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
		<div class="col-2"><a href="index.jsp">김선영</a></div>
		<div class="col-2"></div>
		<div class="col-8">
			<table class="table">
				<thead>
					<tr>
						<th><a href="">ABOUT</a></th>
						<th><a href="">PROJECT</a></th>
						<th><a href="">PUBLICATION</a></th>
						<th><a href="board/list.jsp">BOARD</a></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h3>새 글</h3>
			<form method="post" action="add.jsp" enctype="multipart/form-data">
				<div>
					<label>사용자 아이디</label>
					<input type="text" name="userId" />
				</div>
				<div>
					<label>제목</label>
					<input type="text" name="title" />
				</div>
				<div>
					<textarea rows="10" cols="150" name="document"></textarea>
				</div>
				<div>
					<label>첨부파일1</label>
					<input type="file" name="photofile1" /> 
					<label>첨부파일2</label>
					<input type="file" name="photofile2" /> 
					<label>첨부파일3</label>
					<input type="file" name="photofile3" /> 
				</div>
				<div>
					<input type="submit" value="작성완료" />
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-12">푸터영역</div>
	</div>
</div>
</body>
</html>