<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<a href="index.jsp" class="navbar-brand">블로그</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsible-navbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsible-navbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a href="index.jsp" class="nav-link">홈</a></li>
			<li class="nav-item"><a href="board/list.jsp" class="nav-link">게시판</a></li>
			<li class="nav-item"><a href="my/info.jsp" class="nav-link">내 정보</a></li>
		</ul>
		<ul class="navbar-nav ">
			<li class="nav-item"><a href="loginform.jsp" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="form.jsp" class="nav-link">회원가입</a></li>
			<li class="nav-item"><a href="logout.jsp" class="nav-link">로그아웃</a></li>
		</ul>	
	</div>
</nav>