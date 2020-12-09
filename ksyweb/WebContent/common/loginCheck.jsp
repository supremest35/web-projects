<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// loginCheck.jsp는
	// 세션에 로그인된 사용자의 정보가 있는지 확인하고, 사용자 정보가 없으면
	// loginform.jsp를 재요청하게하는 URL을 응답으로 보내고, 해당 jsp프로그램의 실행을 중단시킨다.
	// 	* 로그인된 사용자 정보가 꼭 필요한 jsp페이지
	//  * 로그인 후 요청(이용)할 수 있는 jsp페이지에 loginCheck.jsp를 최상단에 포함시켜두면
	//    로그인 여부를 체크하면서 로그인 처리가 안된 사용자가 해당 jsp 페이지를 이용하는 것을 차단할 수 있다.
	if (session.getAttribute("LOGINED_USER_ID") == null) {
		response.sendRedirect("../loginform.jsp?error=required");
		return;
	}
%>