<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
   <a href="/ebookstore/index.jsp" class="navbar-brand">블로그</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsible-navbar">
      <span class="navbar-toggler-icon"></span>
   </button>
   <%
   		String loginedUserId = (String) session.getAttribute("LOGINED_USER_ID");
   		String loginedUserName = (String) session.getAttribute("LOGINED_USER_NAME");
   %>
   <div class="collapse navbar-collapse" id="collapsible-navbar">
      <ul class="navbar-nav mr-auto">
         <li class="nav-item"><a href="/ebookstore/index.jsp" class="nav-link">홈</a></li>
         <li class="nav-item"><a href="/ebookstore/board/list.jsp" class="nav-link">게시판</a></li>
         <li class="nav-item"><a href="/ebookstore/book/list.jsp" class="nav-link">도서</a></li>
         <%
         	if (loginedUserId != null) {
         %>
	         <li class="nav-item dropdown">
	               <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	                 마이 메뉴
	               </a>
	               <div class="dropdown-menu">
	                 <a class="dropdown-item" href="/ebookstore/my/info.jsp">내정보</a>
	                 <a class="dropdown-item" href="/ebookstore/book/cart.jsp">장바구니</a>
	                 <a class="dropdown-item" href="/ebookstore/book/buyhistory.jsp">구매내역</a>
	               </div>
	          </li>
         <%
         	}
         %>
      </ul>
      <%
      	if (loginedUserId != null) {
      %>
      	<span class="navbar-text"><strong class="text-white"><%=loginedUserName %></strong>(<%=loginedUserId %>)님 환영합니다</span>
      <%
      	}
      %>
      <ul class="navbar-nav ">
      <%
      	if (loginedUserId == null) {
      %>
         <li class="nav-item"><a href="/ebookstore/loginform.jsp" class="nav-link">로그인</a></li>
         <li class="nav-item"><a href="/ebookstore/form.jsp" class="nav-link">회원가입</a></li>
      <%
      	} else {
      %>
         <li class="nav-item"><a href="/ebookstore/logout.jsp" class="nav-link">로그아웃</a></li>
      <%
      	}
      %>
      </ul>   
   </div>
</nav>