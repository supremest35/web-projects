<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap 4 Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style type="text/css">
		.btn-group-xs > .btn, .btn-xs {
		  padding: .25rem .4rem;
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
		<div class="col-12 mb-3">
			<div class="card">
		  		<div class="row no-gutters">
		    		<div class="col-md-3">
		      			<img src="/shop/resources/images/book.jpg" class="card-img" alt="...">
		    		</div>
		    		<div class="col-md-9">
		      			<div class="card-body">
		        			<h5 class="card-title">불안한 마음을 잠재우는 방법</h5>
		        			<form method="get" action="buy.jsp">
			        			<table class="table">
			        				<colgroup>
			        					<col width="18%">
			        					<col width="32%">
			        					<col width="18%">
			        					<col width="32%">
			        				</colgroup>
			        				<tbody>
			        					<tr>
			        						<th>저자</th>
			        						<td>브라이언 M. 페이건</td>
			        						<th>역자</th>
			        						<td>안희정</td>
			        					</tr>
			        					<tr>
			        						<th>출판사</th>
			        						<td>올댓북스</td>
			        						<th>출판일</th>
			        						<td>2020년 12월 20일</td>
			        					</tr>
			        					<tr>
			        						<th>카테고리</th>
			        						<td>소설</td>
			        						<th>재고현황</th>
			        						<td>100 권</td>
			        					</tr>
			        					<tr>
			        						<th>정가</th>
			        						<td><small>18,000 원</small></td>
			        						<th>상태</th>
			        						<td>재고 있음</td>
			        					</tr>
			        					<tr>
			        						<th>판매가</th>
			        						<td><strong  class="text-danger">16,200 원</strong> <small>(10%할인)</small></td>
			        						<th>포인트</th>
			        						<td><span class="text-danger">900원</span> 적립</td>
			        					</tr>
			        					<tr>
			        						<th>평점</th>
			        						<td><strong class="text-danger">9.8</strong> 점</td>
			        						<th>사용자 리뷰</th>
			        						<td>9 개</td>
			        					</tr>
			        					<tr>
			        						<th>구매수량</th>
			        						<td><input type="number" class="form-control" name="amount" value="1" style="width: 100px;"></td>
			        						<td colspan="2" class="text-right">
			        							<button type="button" class="btn btn-primary">바로구매</button>
			        							<button type="button" class="btn btn-info">장바구니</button>
			        							<a href="list.jsp?pno=1" class="btn btn-outline-primary">쇼핑계속</a>
			        						</td>
			        					</tr>
			        				</tbody>
			        			</table>
		        			</form>
		      			</div>
			  		</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 사용자 리뷰 -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5>
						사용자 리뷰
						<button class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#modal-review-form">리뷰쓰기</button>
					</h5>
				</div>
				<!-- 사용자 리뷰 리스트 시작 -->
				<!-- 사용자 리뷰 반복 시작 -->
				<div class="card-body border border-left-0 border-top-0 border-right-0">
					<h5 class="card-title  d-flex justify-content-between">
						<span>리뷰 제목</span>
						<small class="text-secondary">
							<span class="mr-3">평점:<span class="text-danger">10</span> </span> 
							<span class="mr-3">홍길동</span> <span class="mr-3">2020-12-12</span>
						</small>
					</h5>
					<div class="card-text">
						그의 소설은 현재 세계 40여 개국에서 출간돼 독자들로부터 공감과 지지를 이끌어내고 있다. 프랑스 언론은 ‘기욤 뮈소는 하나의 현상’, ‘페이지터너라는 말이 가장 잘 어울리는 작가’, 
						‘언제나 상상의 한계를 뛰어넘는 반전으로 독자들을 놀라게 하는 작가’라는 수식어를 붙여주며 찬사를 보내고 있다.
					</div>
					<div class="mt-2 text-secondary text-right"><small>이 리뷰가 도움이 되셨나요? <a href="" class="ml-3 btn btn-outline-secondary btn-xs"><i class="fa fa-heart-o"></i> 3</a></small></div>
				</div>
				<!-- 사용자 리뷰 반복 종료 -->
				<div class="card-body border border-left-0 border-top-0 border-right-0">
					<h5 class="card-title  d-flex justify-content-between">
						<span>리뷰 제목</span>
						<small class="text-secondary">
							<span class="mr-3">평점:<span class="text-danger">10</span> </span> 
							<span class="mr-3">홍길동</span> <span class="mr-3">2020-12-12</span>
						</small>
					</h5>
					<div class="card-text">
						그의 소설은 현재 세계 40여 개국에서 출간돼 독자들로부터 공감과 지지를 이끌어내고 있다. 프랑스 언론은 ‘기욤 뮈소는 하나의 현상’, ‘페이지터너라는 말이 가장 잘 어울리는 작가’, 
						‘언제나 상상의 한계를 뛰어넘는 반전으로 독자들을 놀라게 하는 작가’라는 수식어를 붙여주며 찬사를 보내고 있다.
					</div>
					<div class="mt-2 text-secondary text-right"><small>이 리뷰가 도움이 되셨나요? <a href="" class="ml-3 btn btn-outline-secondary btn-xs"><i class="fa fa-heart text-danger"></i> 15</a></small></div>
				</div>
				<div class="card-body border border-left-0 border-top-0 border-right-0">
					<h5 class="card-title  d-flex justify-content-between">
						<span>리뷰 제목</span>
						<small class="text-secondary">
							<span class="mr-3">평점:<span class="text-danger">10</span> </span> 
							<span class="mr-3">홍길동</span> <span class="mr-3">2020-12-12</span>
						</small>
					</h5>
					<div class="card-text">
						그의 소설은 현재 세계 40여 개국에서 출간돼 독자들로부터 공감과 지지를 이끌어내고 있다. 프랑스 언론은 ‘기욤 뮈소는 하나의 현상’, ‘페이지터너라는 말이 가장 잘 어울리는 작가’, 
						‘언제나 상상의 한계를 뛰어넘는 반전으로 독자들을 놀라게 하는 작가’라는 수식어를 붙여주며 찬사를 보내고 있다.
					</div>
					<div class="mt-2 text-secondary text-right"><small>이 리뷰가 도움이 되셨나요? <a href="" class="ml-3 btn btn-outline-secondary btn-xs"><i class="fa fa-heart-o"></i> 10</a></small></div>
				</div>
				<div class="card-body border border-left-0 border-top-0 border-right-0">
					<h5 class="card-title  d-flex justify-content-between">
						<span>리뷰 제목</span>
						<small class="text-secondary">
							<span class="mr-3">평점:<span class="text-danger">10</span> </span> 
							<span class="mr-3">홍길동</span> <span class="mr-3">2020-12-12</span>
						</small>
					</h5>
					<div class="card-text">
						그의 소설은 현재 세계 40여 개국에서 출간돼 독자들로부터 공감과 지지를 이끌어내고 있다. 프랑스 언론은 ‘기욤 뮈소는 하나의 현상’, ‘페이지터너라는 말이 가장 잘 어울리는 작가’, 
						‘언제나 상상의 한계를 뛰어넘는 반전으로 독자들을 놀라게 하는 작가’라는 수식어를 붙여주며 찬사를 보내고 있다.
					</div>
					<div class="mt-2 text-secondary text-right"><small>이 리뷰가 도움이 되셨나요? <a href="" class="ml-3 btn btn-outline-secondary btn-xs"><i class="fa fa-heart-o"></i> 5</a></small></div>
				</div>
				<!-- 사용자 리뷰 리스트 종료  -->
				
				<!-- 페이지 처리 시작 -->
				<div class="p-3">
					<ul class="pagination justify-content-center">
				  		<li class="page-item"><a class="page-link" href="list.jsp">이전</a></li>
				  	    <li class="page-item"><a class="page-link" href="list.jsp">1</a></li>
				  		<li class="page-item active"><a class="page-link" href="list.jsp">2</a></li>
				  		<li class="page-item"><a class="page-link" href="list.jsp">3</a></li>
				  		<li class="page-item"><a class="page-link" href="list.jsp">4</a></li>
				  		<li class="page-item"><a class="page-link" href="list.jsp">5</a></li>
				  		<li class="page-item"><a class="page-link" href="list.jsp">다음</a></li>
					</ul>
				</div>
				<!-- 페이지 처리 종료  -->
			</div>
		</div>
	</div>
	
	<!-- 리뷰 쓰기 폼 모달 시작 -->
	<!-- Modal -->
	<div class="modal fade" id="modal-review-form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
  			<form method="post" action="insertReview.jsp">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">리뷰 쓰기 폼</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
      			<div class="modal-body">
        			<div class="form-group">
        				<label>제목</label>
        				<input type="text" class="form-control" name="title" />
        			</div>
        			<div class="form-group">
        				<label>내용</label>
        				<textarea rows="3" class="form-control" name="content"></textarea>
        			</div>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        			<button type="submit" class="btn btn-primary">등록</button>
      			</div>
    		</div>
    		</form>
  		</div>
	</div>
	<!-- 리뷰 쓰기 폼 모달 끝 -->
	
	<div class="row">
		<div class="col-12 mt-3">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</div>
</body>
</html>