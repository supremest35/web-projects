<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
   <a href="/ebookstore/index.jsp" class="navbar-brand">블로그</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsible-navbar">
      <span class="navbar-toggler-icon"></span>
   </button>
   <div class="collapse navbar-collapse" id="collapsible-navbar">
      <ul class="navbar-nav mr-auto">
         <li class="nav-item"><a href="/ebookstore/index.jsp" class="nav-link">홈</a></li>
         <li class="nav-item"><a href="/board/list.jsp" class="nav-link">게시판</a></li>
         <li class="nav-item"><a href="/book/list.jsp" class="nav-link">도서</a></li>
         <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                 마이 메뉴
               </a>
               <div class="dropdown-menu">
                 <a class="dropdown-item" href="/my/info.jsp">내정보</a>
                 <a class="dropdown-item" href="/book/cart.jsp">장바구니</a>
                 <a class="dropdown-item" href="/book/buyhistory.jsp">구매내역</a>
               </div>
          </li>
      </ul>
      
      <span class="navbar-text"><strong class="text-white"></strong>님 환영합니다</span>
      
      <ul class="navbar-nav ">
         <li class="nav-item"><a href="/loginform.jsp" class="nav-link">로그인</a></li>
         <li class="nav-item"><a href="/form.jsp" class="nav-link">회원가입</a></li>
         <li class="nav-item"><a href="/logout.jsp" class="nav-link">로그아웃</a></li>
      </ul>   
   </div>
</nav>