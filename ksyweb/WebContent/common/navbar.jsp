<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<a href="index.jsp" class="navbar-brand">블로그</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsible-navbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<%
		// session객체에 저장되어있는 사용자 아이디, 이름 조회
		// 반환값이 Object타입이기 때문에 캐스팅 필요
		String loginedUserId = (String) session.getAttribute("LOGINED_USER_ID");
		String loginedUserName = (String) session.getAttribute("LOGINED_USER_NAME");
	%>
	<div class="collapse navbar-collapse" id="collapsible-navbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a href="index.jsp" class="nav-link">홈</a></li>
			<li class="nav-item"><a href="board/list.jsp" class="nav-link">게시판</a></li>
			<%
				if (loginedUserId != null) {
			%>
				<li class="nav-item"><a href="my/info.jsp" class="nav-link">내 정보</a></li>
			<%
				}
			%>
		</ul>
			<%
				if (loginedUserName != null) {
			%>
				<span class="navbar-text"><strong class="text-white"><%=loginedUserName %></strong>(<%=loginedUserId %>) 님 환영합니다.</span>
			<%
				}
			%>
		<ul class="navbar-nav ">
			<%
				if (loginedUserId == null) {
			%>
				<li class="nav-item"><a href="loginform.jsp" class="nav-link">로그인</a></li>
				<li class="nav-item"><a href="form.jsp" class="nav-link">회원가입</a></li>
			<%
				} else {
			%>
				<li class="nav-item"><a href="logout.jsp" class="nav-link">로그아웃</a></li>
			<%
				}
			%>
		</ul>	
	</div>
</nav>