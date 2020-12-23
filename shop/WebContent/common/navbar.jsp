<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<a href="/shop/index.jsp" class="navbar-brand">쇼핑몰</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsible-navbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsible-navbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a href="/shop/index.jsp" class="nav-link">홈</a></li>
			<li class="nav-item dropdown">
      			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        			카테고리
		      	</a>
		      	<div class="dropdown-menu">
		        	<a class="dropdown-item" href="/shop/product/list.jsp?catno=100">국내도서</a>
		        	<a class="dropdown-item" href="/shop/product/list.jsp?catno=200">외국도서</a>
		        	<a class="dropdown-item" href="/shop/product/list.jsp?catno=300">전자책</a>
		      	</div>
		    </li>
		</ul>
		<ul class="navbar-nav ">
			<li class="nav-item"><a href="/shop/loginform.jsp" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="/shop/form.jsp" class="nav-link">회원가입</a></li>
			<li class="nav-item"><a href="/shop/cart/list.jsp" class="nav-link">장바구니</a></li>
			<li class="nav-item"><a href="/shop/order/list.jsp" class="nav-link">주문내역</a></li>
			<li class="nav-item"><a href="/shop/my/info.jsp" class="nav-link">내정보</a></li>
			<li class="nav-item"><a href="/shop/logout.jsp" class="nav-link">로그아웃</a></li>
		</ul>	
	</div>
</nav>