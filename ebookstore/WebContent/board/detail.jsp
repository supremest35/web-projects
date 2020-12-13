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
				<div class="card-header"><h4>게시글 상세보기</h4></div>
				<div class="card-body">
					<table class="table table-bordered">
						<colgroup>
							<col width="12%">
							<col width="38%">
							<col width="12%">
							<col width="38%">
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<td></td>
								<th>등록일</th>
								<td></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td></td>
								<th>추천수</th>
								<td><span class="badge badge-success float">내가 추천한 글</span></td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-footer">
						<a href="" class="btn btn-warning">수정</a>
						<a href="" class="btn btn-danger">삭제</a>
						<a href="" class="btn btn-success">추천</a>
					<a href="" class="btn btn-primary float-right">목록</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col-12">
			<div class="card">
					<div class="card-body">
						<form>
							<div class="form-group row">
								<div class="col-11">
									<textarea rows="3" class="form-control" name="content"></textarea>
								</div>
								<div class="col-1">
									<input type="submit" class="btn btn-outline-primary" value="등록">
								</div>
							</div>
						</form>
					</div>
				<ul class="list-group">
					<li class="list-group-item">
    					<div class="d-flex w-100 justify-content-between">
      						<h5 class="mb-1">홍길동</h5>
      						<small>2020-21-05 12:56:01</small>
    					</div>
    					<p class="mb-1">댓글 내용입니다.</p>
  					</li>
  					<li class="list-group-item">
    					<div class="d-flex w-100 justify-content-between">
      						<h5 class="mb-1">홍길동</h5>
      						<small>2020-21-05 12:56:01</small>
    					</div>
    					<p class="mb-1">댓글 내용입니다.</p>
  					</li>
  					<li class="list-group-item">
    					<div class="d-flex w-100 justify-content-between">
      						<h5 class="mb-1">홍길동</h5>
      						<small>2020-21-05 12:56:01</small>
    					</div>
    					<p class="mb-1">댓글 내용입니다.</p>
  					</li>
				</ul>
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