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
	<!-- 새 상품 시작 -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold">새 상품</div>
				<div class="card-body">
					<div class="row">
						<!-- 새 상품 정보 리스트 시작 -->
						<!-- 상품정보 반복 시작 -->
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<!-- 상품정보 반복 끝 -->
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<!-- 새 상품정보 리스트 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 새 상품 끝 -->
	
	<!-- 추천 상품 시작 -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold">추천상품</div>
				<div class="card-body">
					<div class="row">
						<!-- 추천 상품정보 리스트 시작 -->
						<!-- 추천 상품정보 반복 시작 -->
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<!-- 추천 상품정보 반복 끝 -->
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
						<div class="col-3">
							<div class="card ">
	 							<div class="card-body">
		  							<a href="/shop/product/detail.jsp"><img class="img-thumbnail" src="/shop/resources/images/book.jpg" alt="Card image"></a>
	   								<strong>불안한 마음을 잠재우는 범</strong>
	   								<div class="d-flex justify-content-between">
	   									<small class="text-secondary">하주원</small>
	   									<small class="text-secondary">올댓북스</small>
	   								</div>
	   								<div class="d-flex justify-content-between">
	   									<small><strong class="text-danger">16,200</strong> 원 (10% 할인)</small> 
	   									<small>900원 적립</small>
	   								</div>
	   								<div class="mt-3">
	   									<!-- 상품 테이블의 무료 배송 여부가 Y일 때 표시 -->
	   									<span class="badge badge-primary">무료배송</span>
	   									<!-- 등록일 기준 7일 이내 상품인 경우 표시 -->
	   									<span class="badge badge-success">새 상품</span>
	   									<!-- 상품 테이블의 베스트셀러 여부가 Y일 때 표시 -->
	   									<span class="badge badge-info">베스트셀러</span>
	   								</div>
								</div>
							</div>		
						</div>
					<!-- 추천 상품 정보 리스트 끝 -->
					</div>
				</div>
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