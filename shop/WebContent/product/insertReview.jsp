<%@page import="kr.co.shop.vo.Book"%>
<%@page import="kr.co.shop.dao.BookDao"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.dao.UserDao"%>
<%@page import="kr.co.shop.dao.ReviewDao"%>
<%@page import="kr.co.shop.vo.Review"%>
<%@page import="kr.co.shop.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 리뷰를 추가합니다.
	int bookNo = StringUtils.stringToInt(request.getParameter("bookno"));
	int pageNo = StringUtils.stringToInt(request.getParameter("pno"), 1);
	int point = StringUtils.stringToInt(request.getParameter("point"));
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String loginedUserId = (String) session.getAttribute("LOGINED_USER_ID");
	
	Review review = new Review();
	review.setBookNo(bookNo);
	review.setTitle(title);
	review.setContent(content);
	review.setPoint(point);

	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(loginedUserId);
	review.setUserNo(user.getNo());
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	reviewDao.insertReview(review);	
	
	BookDao bookDao = BookDao.getInstance();
	Book book = bookDao.getBookByNo(bookNo);
	book.setReviewCount(book.getReviewCount() + 1);
	if (book.getReviewPoint() == 0.0) {
		book.setReviewPoint(point);
	} else {
		book.setReviewPoint((book.getReviewPoint()+point)/2);
	}
	bookDao.updateBook(book);
	
	response.sendRedirect("detail.jsp?pno=" + pageNo + "&bookno=" + bookNo);
%>